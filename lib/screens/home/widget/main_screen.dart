import 'package:avaliacaon2/models/contact.dart';
import 'package:avaliacaon2/shared/menu.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  final dynamic _data;
  late List<Contact> _contacts;

  MainScreen(this._data);

  @override
  Widget build(BuildContext context) {
    _contacts = prepareContacts(_data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda de Contatos"),
      ),
      drawer: Menu(),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: _contacts.length,
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    return ListTile(
      leading: Image.asset("assets/images/contacts.png"),
      title: Text(_contacts.elementAt(index).name!),
      subtitle: Row(
        children: [
          Text(_contacts.elementAt(index).email!),
          SizedBox(
            width: 10,
          ),
          Text(_contacts.elementAt(index).celPhone!),
        ],
      ),
    );
  }

  List<Contact> prepareContacts(dynamic data) {
    List<Contact> contacts = [];
    for (int index = 0; index < data.length; index++) {
      contacts.add(Contact.toObject(data[index]));
    }
    return contacts;
  }
}
