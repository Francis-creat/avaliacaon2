import 'package:avaliacaon2/DAO/contactDAO.dart';
import 'package:avaliacaon2/models/contact.dart';
import 'package:avaliacaon2/shared/menu.dart';

import 'package:flutter/material.dart';

class FormRemove extends StatelessWidget {
  final TextEditingController celPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remoção de contatos"),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "celular do contato"),
                keyboardType: TextInputType.number,
                controller: celPhoneController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  saveRecord(context);
                },
                child: Text("Remover contato"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveRecord(BuildContext mainContext) async {
    String _celPhone = (celPhoneController .text);
    late String message;

    Contact contact = Contact(
      celPhone: _celPhone,
    );
    int _result =
        await ContactDAO.removeRecord("contacts", contact.celPhone!);

    if (_result != 0) {
      message = "Contato removido com sucesso!!!";
    } else {
      message = "Não foi possível remover!!!";
    }

    showDialog(
      context: mainContext,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Mensagem do sistema"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}