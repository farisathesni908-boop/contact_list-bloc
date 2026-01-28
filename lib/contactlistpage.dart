import 'package:contacts/bloc/contactlist_bloc.dart';
import 'package:contacts/bloc/contactlist_event.dart';
import 'package:contacts/bloc/contactlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List (BLoC)"),
      ),

      body: Column(
        children: [

          // Input
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),

                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Phone"),
                  keyboardType: TextInputType.phone,
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        phoneController.text.isEmpty) return;

                    context.read<ContactBloc>().add(
                          AddContact(
                            nameController.text,
                            phoneController.text,
                          ),
                        );

                    nameController.clear();
                    phoneController.clear();
                  },
                  child: Text("Add Contact"),
                ),
              ],
            ),
          ),

          Divider(),

          // List
          Expanded(
            child: BlocBuilder<ContactBloc, ContactListState>(
              builder: (context, state) {
                if (state is ContactLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is ContactLoaded) {
                  if (state.contactlists.isEmpty) {
                    return Center(child: Text("No Contacts"));
                  }

                  return ListView.builder(
                    itemCount: state.contactlists.length,
                    itemBuilder: (context, index) {
                      final c = state.contactlists[index];

                      return ListTile(
                        title: Text(c.name),
                        subtitle: Text(c.phone),

                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<ContactBloc>()
                                .add(DeleteContact(index));
                          },
                        ),
                      );
                    },
                  );
                }

                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}