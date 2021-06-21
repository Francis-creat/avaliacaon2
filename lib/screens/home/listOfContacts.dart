import 'package:avaliacaon2/DAO/contactDAO.dart';
import 'package:avaliacaon2/screens/home/widget/main_screen.dart';
import 'package:flutter/material.dart';

class ListOfContacts extends StatefulWidget {
  @override
  _ListOfContactsState createState() => _ListOfContactsState();

  
}

class _ListOfContactsState extends State<ListOfContacts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactDAO.listRecords("contacts"),
      builder: builder,
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      default:
        return MainScreen(snapshot.data);
    }
  }
}
