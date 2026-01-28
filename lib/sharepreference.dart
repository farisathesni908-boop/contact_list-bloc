// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class ContactStorage {
//   static const String key = 'contacts';

//   // Save contacts
//   Future<void> saveContacts(List<ContactStorage> contacts) async {
//     final prefs = await SharedPreferences.getInstance();

//     final jsonList =
//         contacts.map((c) => jsonEncode(c.toJson())).toList();

//     await prefs.setStringList(key, jsonList);
//   }

//   // Load contacts
//   Future<List<ContactStorage>> loadContacts() async {
//     final prefs = await SharedPreferences.getInstance();

//     final list = prefs.getStringList(key);

//     if (list == null) return [];

//     return list
//         .map((e) => ContactStorage.fromJson(jsonDecode(e)))
//         .toList();
//   }

//   Future loadContactsList() async {}
// }
import 'dart:convert';
import 'package:contacts/contact.model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ContactStorage {
  static const String key = 'contacts';

  // Save contacts
  Future<void> saveContacts(List<Contactlist> contacts) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList =
        contacts.map((c) => jsonEncode(c.toJson())).toList();

    await prefs.setStringList(key, jsonList);
  }

  // Load contacts
  Future<List<Contactlist>> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();

    final list = prefs.getStringList(key);

    if (list == null) return [];

    return list
        .map((e) => Contactlist.fromJson(jsonDecode(e)))
        .toList();
  }
}