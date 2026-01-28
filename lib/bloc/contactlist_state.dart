// part of 'contactlist_bloc.dart';

// //  base state
// abstract class ContactlistState {}

// // loading  state
//  class contactloading extends ContactlistState{}
// // loded state
// class contactloaded extends ContactlistState{
//  final  List<Contactlist> contactlists;
//  contactloaded(this.contacts);
// }



// Base state
import 'package:contacts/contact.model.dart';

abstract class ContactListState {}

// Loading state
class ContactLoading extends ContactListState {}

// Loaded state
class ContactLoaded extends ContactListState {
  final List<Contactlist> contactlists;

  ContactLoaded(this.contactlists);
}