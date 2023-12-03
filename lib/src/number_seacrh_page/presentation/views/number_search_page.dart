import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NumberSearchPage extends StatefulWidget {
  const NumberSearchPage({super.key});

  @override
  State<NumberSearchPage> createState() => _NumberSearchPageState();
}

class _NumberSearchPageState extends State<NumberSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск по брони'),
        centerTitle: false,
      ),
      body: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 250,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'ORDER_SUCCESS',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'PAYMENT_SUCCESS',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Онлайн продажа',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Номер брони: 16296374',
                            style: TextStyle(color: Colors.grey[600])),
                        SizedBox(height: 4),
                        Text('ID: 65478bc25c24a7b8c2b61f06',
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.phone, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('77784047979',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            Icon(Icons.email, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('kuat.bodikov@gmail.com',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Актобе, Kinopark 7 Keruencity',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Бесбармақ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text('Зал 2',
                            style: TextStyle(color: Colors.grey[600])),
                        Text('05-11-2023 21:20:00 - 05-11-2023 22:45:00',
                            style: TextStyle(color: Colors.grey[600])),
                        SizedBox(height: 16),
                        Text('Сумма: 4000',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 16),
                        DataTable(
                          columns: [
                            DataColumn(label: Text('Ряд')),
                            DataColumn(label: Text('Место')),
                            DataColumn(label: Text('Тариф')),
                            DataColumn(label: Text('Цена')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('7')),
                              DataCell(Text('7')),
                              DataCell(Text('Пенсионный')),
                              DataCell(Text('2000')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('7')),
                              DataCell(Text('6')),
                              DataCell(Text('Пенсионный')),
                              DataCell(Text('2000')),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Детали Платежа',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 8),
                        Text('Способ оплаты: EPAY',
                            style: TextStyle(fontSize: 16)),
                        Text('Сумма: 4000', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Заказ номер по банку: 16296374',
                            style: TextStyle(fontSize: 16)),
                        Text('Статус по банку: success',
                            style:
                                TextStyle(color: Colors.green, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Создано: 05-11-2023 12:34:45',
                            style: TextStyle(color: Colors.grey[600])),
                        Text('Обновлено: 05-11-2023 12:34:45',
                            style: TextStyle(color: Colors.grey[600])),
                        SizedBox(height: 8),
                        Text('Payment id: ef44efc7-6ef8-436f-b5be-f0b89a0ad6fc',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Kinopark 7 Keruencity',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Бесбармақ', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('id брони: 65478bc25c24a7b8c2b61f06',
                      style: TextStyle(fontSize: 16)),
                  Text('Номер брони: 16296374', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Дата начала: 05-11-2023 21:20:00',
                      style: TextStyle(fontSize: 16)),
                  Text('Время оплаты бронирования: 05-11-2023 17:34:45',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Общая сумма брони: 4000',
                      style: TextStyle(fontSize: 16)),
                  Text('Зал: Зал 2', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 16),
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Ряд')),
                      DataColumn(label: Text('Место')),
                      DataColumn(label: Text('Цена')),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('7')),
                        DataCell(Text('7')),
                        DataCell(Text('2000')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('7')),
                        DataCell(Text('6')),
                        DataCell(Text('2000')),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
