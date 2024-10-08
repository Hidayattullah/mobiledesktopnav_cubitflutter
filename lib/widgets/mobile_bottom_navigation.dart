import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/navigation_cubit.dart';

class MobileBottomNavigation extends StatelessWidget {
  const MobileBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
          selectedItemColor: Colors.blue, // Warna biru untuk ikon yang dipilih
          unselectedItemColor: Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black54, // Warna menyesuaikan tema
          currentIndex: _getSelectedIndex(state),
          onTap: (index) {
            if (index == 0) {
              BlocProvider.of<NavigationCubit>(context).showHome();
            } else if (index == 1) {
              BlocProvider.of<NavigationCubit>(context).showPage1();
            } else if (index == 2) {
              BlocProvider.of<NavigationCubit>(context).showPage2();
            } else if (index == 3) {
              BlocProvider.of<NavigationCubit>(context).showPage3();
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pageview),
              label: 'Page 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              label: 'Page 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              label: 'Page 3',
            ),
          ],
        );
      },
    );
  }

  int _getSelectedIndex(NavigationState state) {
    switch (state) {
      case NavigationState.home:
        return 0;
      case NavigationState.page1:
        return 1;
      case NavigationState.page2:
        return 2;
      case NavigationState.page3:
        return 3;
      default:
        return 0;
    }
  }
}
