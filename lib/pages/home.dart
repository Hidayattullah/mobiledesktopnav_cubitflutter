import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/cubit/navigation_cubit.dart';
import '/cubit/theme_cubit.dart';
import '../pages/home_page.dart';
import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../widgets/tablet_drawer.dart';
import '../widgets/desktop_navbar.dart';
import '../widgets/mobile_bottom_navigation.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
            appBar: AppBar(
              title: const Text('Responsive Navigation'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  },
                ),
              ],
            ),
            drawer: MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024 ? TabletDrawer() : null,
            body: Column(
              children: [
                if (MediaQuery.of(context).size.width >= 1024) DesktopNavBar(),
                Expanded(
                  child: BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      switch (state) {
                        case NavigationState.home:
                          return const HomePage();
                        case NavigationState.page1:
                          return Page1();
                        case NavigationState.page2:
                          return Page2();
                        case NavigationState.page3:
                          return Page3();
                        default:
                          return const HomePage();
                      }
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 600 ? const MobileBottomNavigation() : null,
    );  
  }
}
