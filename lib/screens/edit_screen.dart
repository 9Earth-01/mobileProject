import 'package:account/main.dart';
import 'package:account/models/transactions.dart';
import 'package:account/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  Transactions statement;

  EditScreen({super.key, required this.statement});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final time = TextEditingController();
  final importantwork = TextEditingController();
  final heritage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = widget.statement.title1;
    time.text = widget.statement.title2;
    importantwork.text = widget.statement.title3;
    heritage.text = widget.statement.title4;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(180, 143, 50, 29),
          centerTitle: true,
          title: const Text(
            'แก้ไขข้อมูล',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อของสะสม',
                  ),
                  autofocus: false,
                  controller: name,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'แบรนด์',
                  ),
                  autofocus: false,
                  controller: time,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ประเภท',
                  ),
                  autofocus: false,
                  controller: importantwork,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'แหล่งที่มา',
                  ),
                  autofocus: false,
                  controller: heritage,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: const Color.fromARGB(51, 47, 0, 255)),
                    child: const Text(
                      'แก้ไขข้อมูล',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var statement = Transactions(
                            keyID: widget.statement.keyID,
                            title1: name.text,
                            title2: time.text,
                            title3: importantwork.text,
                            title4: heritage.text,
                            date: DateTime.now());
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);

                        provider.updateTransaction(statement);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return MyHomePage();
                                }));
                      }
                    })
              ],
            )));
  }
}
