import 'package:avaliacaon2/DAO/contactDAO.dart';
import 'package:avaliacaon2/models/contact.dart';
import 'package:avaliacaon2/shared/menu.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class FormEdit extends StatelessWidget {
  final TextEditingController celPhoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edição de Contatos"),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Celular do Contato"),
                keyboardType: TextInputType.number,
                controller: celPhoneController,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Nome do Contato"),
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email do Contato"),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    saveRecord(context);
                  },
                  child: Text("Editar Contato")),
            ],
          ),
        ),
      ),
    );
  }

  void saveRecord(BuildContext mainContext) async {
    String _celPhone = celPhoneController.text;
    String _name = nameController.text;
    String _email = emailController.text;
    late String message;

    if (EmailValidator.validate(_email)) {
      Contact contact = Contact(
        name: _name,
        email: _email,
        celPhone: _celPhone,
      );
      int _result = await ContactDAO.updateRecord("contacts", contact.toMap());

      if (_result != 0) {
        message = "O contato $_name foi adicionado com sucesso!!!";
      } else {
        message = "Não foi possível adicionar contato $_name!!!";
      }
    } else {
      message = "Email inválido!!!";
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
