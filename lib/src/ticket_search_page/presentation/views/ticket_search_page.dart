// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:support/core/utils/constants.dart';
import 'package:support/core/viewmodels/theme_view_model.dart';
import 'package:support/src/ticket_search_page/data/models/ticket_model.dart';
import 'package:support/src/ticket_search_page/presentation/bloc/ticket_search_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class NumberSearchPage extends StatefulWidget {
  final bool isMobile;

  const NumberSearchPage({
    super.key,
    required this.isMobile,
  });

  @override
  State<NumberSearchPage> createState() => _NumberSearchPageState();
}

class _NumberSearchPageState extends State<NumberSearchPage> {
  final TextEditingController _numberController = TextEditingController();
  final _ticketSearchBloc = TicketSearchBloc();
  final Color? cardColor = Colors.white;
  DateTime _lastTitleTapTime = DateTime.now();
  int developerModeCounter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _getTicket() {
    _ticketSearchBloc
        .add(TicketGetTicketNumberEvent(number: _numberController.text));
  }

  Widget _isMobilePlatform(TicketModel ticket) {
    if (widget.isMobile) {
      return _buildMainColumn(ticket);
    }
    return _buildMainRow(ticket);
  }

  double _width() {
    return MediaQuery.of(context).size.width - 62;
  }

  void _increaseDeveloperCounter() {
    log("developerModeCounter = $developerModeCounter");
    DateTime now = DateTime.now();
    log(now.difference(_lastTitleTapTime).inSeconds.toString());
    if (now.difference(_lastTitleTapTime).inMilliseconds <= 300) {
      developerModeCounter += 1;
    } else {
      developerModeCounter = 1;
    }
    _lastTitleTapTime = now;
    if (developerModeCounter >= 10) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketSearchBloc, TicketSearchState>(
        bloc: _ticketSearchBloc,
        listener: (context, state) {
          if (state is TicketLoadingErrorState) {
            _showAlert(
                context: context, title: state.title, content: state.message);
          }
        },
        child: BlocBuilder<TicketSearchBloc, TicketSearchState>(
          bloc: _ticketSearchBloc,
          builder: (context, state) {
            if (state is TicketSearchInitial) {
              return Scaffold(
                appBar: AppBar(
                  title: GestureDetector(
                      onTap: _increaseDeveloperCounter,
                      child: const Text(numberTitle)),
                  centerTitle: true,
                  leading: developerModeCounter >= 10
                      ? TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TalkerScreen(talker: GetIt.I<Talker>())));
                          },
                          child: const Text('Log'))
                      : const SizedBox(),
                ),
                floatingActionButton: _buildTextField(),
              );
            } else if (state is TicketLoadingState) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text(numberTitle),
                  centerTitle: true,
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
                floatingActionButton: _buildTextField(),
              );
            } else if (state is TicketLoadedState) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text(numberTitle),
                    centerTitle: true,
                  ),
                  endDrawer: _buildDrawer(),
                  body: ListView.builder(
                    itemCount: state.tickets.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ticket = state.tickets[index];
                      return _isMobilePlatform(ticket);
                    },
                  ),
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: ThemeViewModel().mainRed,
                      onPressed: () {
                        _showtextField(context: context);
                      },
                      child: const Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      )));
            } else if (state is TicketLoadingErrorState) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text(numberTitle),
                  centerTitle: true,
                ),
                floatingActionButton: _buildTextField(),
              );
            }
            return Container();
          },
        ));
  }

  Column _buildMainColumn(TicketModel ticket) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 300,
              child: _orderInfo(ticket),
            ),
            SizedBox(
              height: 150,
              child: _clientInfo(ticket),
            )
          ],
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 550,
                child: _paymentInfo(ticket),
              ),
              SizedBox(
                width: 550,
                child: _seanceInfo(ticket),
              ),
              SizedBox(width: 550, child: _dbInfo(ticket)),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildMainRow(TicketModel ticket) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 300,
              child: _orderInfo(ticket),
            ),
            SizedBox(
              height: 150,
              child: _clientInfo(ticket),
            )
          ],
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 550,
                child: _paymentInfo(ticket),
              ),
              SizedBox(
                width: 550,
                child: _seanceInfo(ticket),
              ),
              SizedBox(
                width: 550,
                child: _dbInfo(ticket),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Card _dbInfo(TicketModel ticket) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Информация с ДБ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text('${ticket.items?.ticket?.detail?.object?.name}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('${ticket.items?.ticket?.detail?.movie?.name}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text('id брони: ${ticket.id}',
                style: const TextStyle(fontSize: 16)),
            Text('Номер брони: ${ticket.number}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
                'Дата начала: ${ticket.items?.ticket?.detail?.seance?.timeframe?.start}',
                style: const TextStyle(fontSize: 16)),
            Text('Время оплаты бронирования: ${ticket.payment?.dateTime}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Общая сумма брони: ${ticket.payment?.amount}',
                style: const TextStyle(fontSize: 16)),
            Text('Зал: ${ticket.items?.ticket?.detail?.hall?.name}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Ряд')),
                  DataColumn(label: Text('Место')),
                  DataColumn(label: Text('Цена')),
                  DataColumn(label: Text('Время снятие брони')),
                ],
                rows: ticket.items?.ticket?.detail?.seats?.map<DataRow>((seat) {
                      return DataRow(
                        cells: [
                          DataCell(Text(seat.row ?? "-")),
                          DataCell(Text(seat.col ?? "-")),
                          DataCell(Text(seat.price.toString())),
                          const DataCell(Text("-")),
                        ],
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _seanceInfo(TicketModel ticket) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Информация о сеансе',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(
                '${ticket.items?.ticket?.detail?.city?.name}, ${ticket.items?.ticket?.detail?.object?.name}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Text('${ticket.items?.ticket?.detail?.movie?.name}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text('${ticket.items?.ticket?.detail?.hall?.name}',
                style: TextStyle(color: Colors.grey[600])),
            Text(
                '${ticket.items?.ticket?.detail?.seance?.timeframe?.start} - ${ticket.items?.ticket?.detail?.seance?.timeframe?.end}',
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 16),
            Text('Сумма: ${ticket.items?.ticket?.amount} ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Ряд')),
                  DataColumn(label: Text('Место')),
                  DataColumn(label: Text('Тариф')),
                  DataColumn(label: Text('Цена')),
                ],
                rows: ticket.items?.ticket?.detail?.seats?.map<DataRow>((seat) {
                      return DataRow(
                        cells: [
                          DataCell(Text(seat.row ?? "-")),
                          DataCell(Text(seat.col ?? "-")),
                          DataCell(Text(seat.discount?.name ?? "-")),
                          DataCell(Text(seat.price.toString())),
                        ],
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _paymentInfo(TicketModel ticket) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Информация об оплате',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(
                'Способ оплаты: ${ticket.contract?.payments?.first.name ?? "-"}',
                style: const TextStyle(fontSize: 16)),
            Text('Сумма: ${ticket.payment?.amount.toString()}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Заказ номер по банку: ${ticket.payment?.description ?? "-"}',
                style: const TextStyle(fontSize: 16)),
            Text('Статус по банку: ${ticket.payment?.reason}',
                style: const TextStyle(color: Colors.green, fontSize: 16)),
            const SizedBox(height: 8),
            Text('Создано: ${ticket.createdAt}',
                style: TextStyle(color: Colors.grey[600])),
            Text('Обновлено: ${ticket.updatedAt}',
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 8),
            Text('Payment id: ${ticket.payment?.id}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Card _clientInfo(TicketModel ticket) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Информация о клиенте',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                const Icon(Icons.phone, color: Colors.blue),
                const SizedBox(width: 8),
                Text(ticket.customer?.phone ?? "-",
                    style: const TextStyle(color: Colors.blue, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                const Icon(Icons.email, color: Colors.blue),
                const SizedBox(width: 8),
                Text(ticket.customer?.email ?? "-",
                    style: const TextStyle(color: Colors.blue, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _orderInfo(TicketModel ticket) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Информация по брони',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: OrderStatusExtension.fromInt(ticket.status ?? 0).color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'Статус заказа: ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    OrderStatusExtension.fromInt(ticket.status ?? 0).inRussian,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color:
                    PaymentStatusExtension.fromInt(ticket.payment?.status ?? 0)
                        .color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'Статус платежа: ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    PaymentStatusExtension.fromInt(ticket.payment?.status ?? 0)
                        .inRussian,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(ticket.contract?.name ?? '-',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Номер брони: ${ticket.number}',
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 4),
            Text('ID: ${ticket.id}', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Container _buildTextField() {
    return Container(
      width: widget.isMobile ? _width() : 340,
      height: 40,
      decoration: BoxDecoration(
          color: ThemeViewModel().mainRed,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300,
            height: 40,
            child: TextField(
                controller: _numberController,
                decoration: const InputDecoration(
                    labelText: numberlabel,
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white),
                onEditingComplete: _getTicket),
          ),
          IconButton(
            onPressed: _getTicket,
            icon: const Icon(Icons.search_outlined),
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Меню кнопок',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildButton(),
          _buildButton(),
          _buildButton(),
          _buildButton(),
          _buildButton(),
          _buildButton(),
        ],
      ),
    );
  }

  Padding _buildButton() {
    var width = MediaQuery.of(context).size.width - 8;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(
              Size.fromWidth(width),
            ),
            backgroundColor:
                WidgetStateProperty.all<Color>(ThemeViewModel().mainRed),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
          child: const Text(
            'Возврат',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _showtextField({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: numberlabel,
                border: OutlineInputBorder(),
              ),
              onEditingComplete: _getTicket,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _getTicket();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeViewModel().mainRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Поиск',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Ок',
              style: TextStyle(color: ThemeViewModel().mainRed),
            ),
          ),
        ],
      ),
    );
  }

  _showAlert({required BuildContext context, String? title, String? content}) {
    final content0 = content ?? '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title != null
            ? Text(title, style: const TextStyle(fontWeight: FontWeight.w600))
            : null,
        content: Text(content0),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Ок',
              style: TextStyle(color: ThemeViewModel().mainRed),
            ),
          ),
        ],
      ),
    );
  }
}
