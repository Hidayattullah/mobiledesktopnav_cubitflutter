import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/navigation_cubit.dart';

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavBarItem(
              context,
              title: 'Home',
              isSelected: state == NavigationState.home,
              onTap: () => BlocProvider.of<NavigationCubit>(context).showHome(),
            ),
            _buildNavBarItem(
              context,
              title: 'Page 1',
              isSelected: state == NavigationState.page1,
              onTap: () => BlocProvider.of<NavigationCubit>(context).showPage1(),
            ),
            _buildNavBarItem(
              context,
              title: 'Page 2',
              isSelected: state == NavigationState.page2,
              onTap: () => BlocProvider.of<NavigationCubit>(context).showPage2(),
            ),
            _buildNavBarItem(
              context,
              title: 'Page 3',
              isSelected: state == NavigationState.page3,
              onTap: () => BlocProvider.of<NavigationCubit>(context).showPage3(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavBarItem(BuildContext context, {required String title, required bool isSelected, required Function onTap}) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue : Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}