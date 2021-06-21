import 'package:avaliacaon2/screens/home/listOfContacts.dart';
import 'package:avaliacaon2/screens/registers/form_edit.dart';
import 'package:avaliacaon2/screens/registers/form_register.dart';
import 'package:avaliacaon2/screens/registers/form_remove.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Agenda de Contatos",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => ListOfContacts(),
        "/register": (BuildContext context) => FormRegister(),
        "/edit": (BuildContext context) => FormEdit(),
        "/remove": (BuildContext context) => FormRemove(),
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(), fillColor: Colors.black,
          hoverColor: Colors.black,

          
        ),
        
      )));
}
