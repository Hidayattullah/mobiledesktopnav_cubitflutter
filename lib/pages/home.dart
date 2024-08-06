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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return BlocListener<LayoutCubit, LayoutType>(
      listener: (context, layoutType) {
        if (layoutType == LayoutType.mobile) {
          BlocProvider.of<NavigationCubit>(context).showHome();
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            BlocProvider.of<LayoutCubit>(context).setMobile();
          } else if (constraints.maxWidth < 1024) {
            BlocProvider.of<LayoutCubit>(context).setTablet();
          } else {
            BlocProvider.of<LayoutCubit>(context).setDesktop();
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('Responsive Navigation'),
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  },
                ),
              ],
            ),
            drawer: constraints.maxWidth >= 600 && constraints.maxWidth < 1024 ? TabletDrawer() : null,
            body: Column(
              children: [
                if (constraints.maxWidth >= 1024) DesktopNavBar(),
                Expanded(
                  child: BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      switch (state) {
                        case NavigationState.home:
                          return HomePage();
                        case NavigationState.page1:
                          return Page1();
                        case NavigationState.page2:
                          return Page2();
                        case NavigationState.page3:
                          return Page3();
                        default:
                          return HomePage();
                      }
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: constraints.maxWidth < 600 ? MobileBottomNavigation() : null,
          );
        },
      ),
    );
  }
}
