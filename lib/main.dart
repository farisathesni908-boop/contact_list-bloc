import 'package:contacts/bloc/contactlist_bloc.dart';
import 'package:contacts/contactlistpage.dart';
import 'package:contacts/sharepreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
final ContactStorage storage=ContactStorage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactBloc(storage),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
           
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: ContactPage()
        ),
    );
  }
}

