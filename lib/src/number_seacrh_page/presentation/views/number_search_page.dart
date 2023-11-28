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
    );
  }
}
