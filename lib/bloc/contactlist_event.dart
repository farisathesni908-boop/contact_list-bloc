

abstract class ContactListEvent {}
class LoadContactslist extends ContactListEvent{}
class AddContact extends ContactListEvent{
  final String name;
  final String phone;
  AddContact(this.name,this.phone);

}
class DeleteContact extends ContactListEvent{
  final int index;
  DeleteContact(this.index);
}