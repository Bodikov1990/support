import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support/core/utils/constants.dart';
import 'package:support/core/viewmodels/theme_view_model.dart';
import 'package:support/src/ticket_search_page/presentation/bloc/ticket_search_bloc.dart';

@RoutePage()
class NumberSearchPage extends StatefulWidget {
  const NumberSearchPage({super.key});

  @override
  State<NumberSearchPage> createState() => _NumberSearchPageState();
}

class _NumberSearchPageState extends State<NumberSearchPage> {
  final TextEditingController _numberController = TextEditingController();
  final _ticketSearchBloc = TicketSearchBloc();
  final Color? cardColor = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  void _getTicket() {
    _ticketSearchBloc
        .add(TicketGetTicketNumberEvent(number: _numberController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketSearchBloc, TicketSearchState>(
      bloc: _ticketSearchBloc,
      builder: (context, state) {
        if (state is TicketSearchInitial) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Поиск по брони'),
              centerTitle: false,
              actions: [_buildTextField()],
            ),
          );
        } else if (state is TicketLoadingState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Поиск по брони'),
              centerTitle: false,
              actions: [_buildTextField()],
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TicketLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Поиск по брони'),
              centerTitle: false,
            ),
            endDrawer: _buildDrawer(),
            body: ListView.builder(
              itemCount: state.tickets.length,
              itemBuilder: (BuildContext context, int index) {
                final ticket = state.tickets[index];
                return Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text('Информация по брони',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: OrderStatusExtension.fromInt(
                                                ticket.status ?? 0)
                                            .color,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Статус заказа: ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            OrderStatusExtension.fromInt(
                                                    ticket.status ?? 0)
                                                .inRussian,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: PaymentStatusExtension.fromInt(
                                                ticket.payment?.status ?? 0)
                                            .color,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Статус платежа: ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            PaymentStatusExtension.fromInt(
                                                    ticket.payment?.status ?? 0)
                                                .inRussian,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(ticket.contract?.name ?? '-',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text('Номер брони: ${ticket.number}',
                                        style:
                                            TextStyle(color: Colors.grey[600])),
                                    const SizedBox(height: 4),
                                    Text('ID: ${ticket.id}',
                                        style:
                                            TextStyle(color: Colors.grey[600])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text('Информация о клиенте',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: <Widget>[
                                        const Icon(Icons.phone,
                                            color: Colors.blue),
                                        const SizedBox(width: 8),
                                        Text(ticket.customer?.phone ?? "-",
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16)),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: <Widget>[
                                        const Icon(Icons.email,
                                            color: Colors.blue),
                                        const SizedBox(width: 8),
                                        Text(ticket.customer?.email ?? "-",
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text('Информация об оплате',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      const SizedBox(height: 8),
                                      Text(
                                          'Способ оплаты: ${ticket.contract?.payments?.first.name ?? "-"}',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          'Сумма: ${ticket.payment?.amount.toString()}',
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(height: 8),
                                      Text(
                                          'Заказ номер по банку: ${ticket.payment?.description ?? "-"}',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          'Статус по банку: ${ticket.payment?.reason}',
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 16)),
                                      const SizedBox(height: 8),
                                      Text('Создано: ${ticket.createdAt}',
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      Text('Обновлено: ${ticket.updatedAt}',
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      const SizedBox(height: 8),
                                      Text('Payment id: ${ticket.payment?.id}',
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 550,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text('Информация о сеансе',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      const SizedBox(height: 8),
                                      Text(
                                          '${ticket.items?.ticket?.detail?.city?.name}, ${ticket.items?.ticket?.detail?.object?.name}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      const SizedBox(height: 8),
                                      Text(
                                          '${ticket.items?.ticket?.detail?.movie?.name}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text(
                                          '${ticket.items?.ticket?.detail?.hall?.name}',
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      Text(
                                          '${ticket.items?.ticket?.detail?.seance?.timeframe?.start} - ${ticket.items?.ticket?.detail?.seance?.timeframe?.end}',
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      const SizedBox(height: 16),
                                      Text(
                                          'Сумма: ${ticket.items?.ticket?.amount} ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 16),
                                      DataTable(
                                        columns: const [
                                          DataColumn(label: Text('Ряд')),
                                          DataColumn(label: Text('Место')),
                                          DataColumn(label: Text('Тариф')),
                                          DataColumn(label: Text('Цена')),
                                        ],
                                        rows: ticket
                                                .items?.ticket?.detail?.seats
                                                ?.map<DataRow>((seat) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                      Text(seat.row ?? "-")),
                                                  DataCell(
                                                      Text(seat.col ?? "-")),
                                                  DataCell(Text(
                                                      seat.discount?.name ??
                                                          "-")),
                                                  DataCell(Text(
                                                      seat.price.toString())),
                                                ],
                                              );
                                            }).toList() ??
                                            [],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 550,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text('Информация с ДБ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      const SizedBox(height: 8),
                                      Text(
                                          '${ticket.items?.ticket?.detail?.object?.name}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      Text(
                                          '${ticket.items?.ticket?.detail?.movie?.name}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      const SizedBox(height: 8),
                                      Text('id брони: ${ticket.id}',
                                          style: const TextStyle(fontSize: 16)),
                                      Text('Номер брони: ${ticket.number}',
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(height: 8),
                                      Text(
                                          'Дата начала: ${ticket.items?.ticket?.detail?.seance?.timeframe?.start}',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          'Время оплаты бронирования: ${ticket.payment?.dateTime}',
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(height: 8),
                                      Text(
                                          'Общая сумма брони: ${ticket.payment?.amount}',
                                          style: const TextStyle(fontSize: 16)),
                                      Text(
                                          'Зал: ${ticket.items?.ticket?.detail?.hall?.name}',
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(height: 16),
                                      DataTable(
                                        columns: const [
                                          DataColumn(label: Text('Ряд')),
                                          DataColumn(label: Text('Место')),
                                          DataColumn(label: Text('Цена')),
                                          DataColumn(
                                              label:
                                                  Text('Время снятие брони')),
                                        ],
                                        rows: ticket
                                                .items?.ticket?.detail?.seats
                                                ?.map<DataRow>((seat) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                      Text(seat.row ?? "-")),
                                                  DataCell(
                                                      Text(seat.col ?? "-")),
                                                  DataCell(Text(
                                                      seat.price.toString())),
                                                  const DataCell(Text("-")),
                                                ],
                                              );
                                            }).toList() ??
                                            [],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }

  Row _buildTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.white,
          width: 350,
          height: 40,
          child: TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: 'Введите номер брони',
                border: OutlineInputBorder(),
              ),
              onEditingComplete: _getTicket),
        ),
        IconButton(
            onPressed: _getTicket, icon: const Icon(Icons.search_outlined))
      ],
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
          // Добавьте дополнительные кнопки или виджеты здесь
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
            fixedSize: MaterialStatePropertyAll(
              Size.fromWidth(width),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ThemeViewModel().mainRed),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
}
