import 'package:drawernav_cubitflutter/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/navigation_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Flutter App',
      home: BlocProvider(
        create: (context) => NavigationCubit(),
        child: Home(),
      ),
    );
  }
}


