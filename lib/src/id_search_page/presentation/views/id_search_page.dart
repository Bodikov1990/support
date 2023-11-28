import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class IdSearchPage extends StatefulWidget {
  const IdSearchPage({super.key});

  @override
  State<IdSearchPage> createState() => _IdSearchPageState();
}

class _IdSearchPageState extends State<IdSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск по ID'),
        centerTitle: false,
      ),
    );
  }
}
