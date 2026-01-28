
// // import 'package:contacts/bloc/contactlist_event.dart';
// // import 'package:contacts/bloc/contactlist_state.dart';
// // import 'package:contacts/contact.model.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';


// // class ContactListBloc
// //     extends Bloc<ContactlistEvent, ContactlistState> {

// //   final contactliststorage storage;

// //   ContactListBloc(this.storage) : super(ContactListInitial()) {

// //     on<LoadContactslist>((event, emit) async {

// //       final ContactlistEvent= await storage.LoadContactslist();

// //       emit((contactListLoaded(Contactlist)));
// //     });
// //   }
// //     }
// import 'package:contacts/bloc/contactlist_event.dart';
// import 'package:contacts/bloc/contactlist_state.dart';
// import 'package:contacts/sharepreference.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class ContactListBloc
//     extends Bloc<ContactListEvent,ContactListState> {

//   final ContactStorage storage;

//   ContactListBloc(this.storage) : super(ContactListInitial()) {

//     on<LoadContactslist>((event, emit) async {

//       final contacts = await storage.loadContactsList();

//       emit(contacts(contacts));
//     });
//   }}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contacts/bloc/contactlist_event.dart';
import 'package:contacts/bloc/contactlist_state.dart';
import 'package:contacts/contact.model.dart';
import 'package:contacts/sharepreference.dart'; // ContactStorage

class ContactBloc extends Bloc<ContactListEvent, ContactListState> {
  final ContactStorage storage;

  // This should be a list of Contact objects
  List<Contactlist> _contacts = [];

  ContactBloc(this.storage) : super(ContactLoading()) {
    on<LoadContactslist>(_load);
    on<AddContact>(_add);
    on<DeleteContact>(_delete);
  }

  // Load contacts
  Future<void> _load(
      LoadContactslist event, Emitter<ContactListState> emit) async {
    _contacts = await storage.loadContacts();
    emit(ContactLoaded(List.from(_contacts)));
  }

  // Add a new contact
  Future<void> _add(
      AddContact event, Emitter<ContactListState> emit) async {
    final contact = Contactlist(name: event.name, phone: event.phone);

    _contacts.add(contact); // Add the contact, not storage

    await storage.saveContacts(_contacts); // Save the full list

    emit(ContactLoaded(List.from(_contacts)));
  }

  // Delete a contact
  Future<void> _delete(
      DeleteContact event, Emitter<ContactListState> emit) async {
    if (event.index < 0 || event.index >= _contacts.length) return;

    _contacts.removeAt(event.index);

    await storage.saveContacts(_contacts);

    emit(ContactLoaded(List.from(_contacts)));
  }
}