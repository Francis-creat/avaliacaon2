

import 'package:flutter/cupertino.dart';

class Contact {
  int? registration;
  String? name;
  String? email;
  String? celPhone;
  

  Contact({
    this.registration,
    this.name,
    this.email,
    this.celPhone,
    
  });

  
  Map<String, dynamic> toMap() {
    return {
      "registration": registration,
      'name': name,
      'email': email,
      'celPhone': celPhone,
      
    };
  }

  
  static Contact toObject(Map<String, dynamic> data) {
    return Contact(
      registration: data["registration"],
      name: data["name"],
      email: data["email"],
      celPhone: data["celPhone"],
      
    );
  }
}
