import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/navigation_cubit.dart';

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: () {
            BlocProvider.of<NavigationCubit>(context).showHome();
          },
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        TextButton.icon(
          onPressed: () {
            BlocProvider.of<NavigationCubit>(context).showPage1();
          },
          icon: Icon(Icons.pageview),
          label: Text('Page 1'),
        ),
        TextButton.icon(
          onPressed: () {
            BlocProvider.of<NavigationCubit>(context).showPage2();
          },
          icon: Icon(Icons.pages),
          label: Text('Page 2'),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<NavigationCubit>(context).showPage3();
          },
          child: Text('Page 3'),
        ),
      ],
    );
  }
}
