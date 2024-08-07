import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/navigation_cubit.dart';

class TabletDrawer extends StatelessWidget {
  const TabletDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
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
              // menambahkan list button
              _buildDrawerItem(
                context,
                icon: Icons.home,
                title: 'Home',
                isSelected: state == NavigationState.home,
                onTap: () => BlocProvider.of<NavigationCubit>(context).showHome(),
              ),
              _buildDrawerItem(
                context,
                icon: Icons.pageview,
                title: 'Page 1',
                isSelected: state == NavigationState.page1,
                onTap: () => BlocProvider.of<NavigationCubit>(context).showPage1(),
              ),
              _buildDrawerItem(
                context,
                icon: Icons.pages,
                title: 'Page 2',
                isSelected: state == NavigationState.page2,
                onTap: () => BlocProvider.of<NavigationCubit>(context).showPage2(),
              ),
              _buildDrawerItem(
                context,
                icon: Icons.pages,
                title: 'Page 3',
                isSelected: state == NavigationState.page3,
                onTap: () => BlocProvider.of<NavigationCubit>(context).showPage3(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String title, required bool isSelected, required Function onTap}) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Theme.of(context).iconTheme.color),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.blue : Theme.of(context).textTheme.bodyLarge?.color),
      ),
      tileColor: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
    );
  }
}