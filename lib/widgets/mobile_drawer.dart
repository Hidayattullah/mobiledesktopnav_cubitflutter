import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/navigation_cubit.dart';

class MobileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              BlocProvider.of<NavigationCubit>(context).showHome();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.pageview),
            title: Text('Page 1'),
            onTap: () {
              BlocProvider.of<NavigationCubit>(context).showPage1();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text('Page 2'),
            onTap: () {
              BlocProvider.of<NavigationCubit>(context).showPage2();
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Page 3'),
            onTap: () {
              BlocProvider.of<NavigationCubit>(context).showPage3();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
