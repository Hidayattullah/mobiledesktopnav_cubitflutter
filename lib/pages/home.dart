import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/cubit/navigation_cubit.dart';
import '/pages/home_page.dart';
import '/pages/page1.dart';
import '/pages/page2.dart';
import '/pages/page3.dart';
import '/widgets/mobile_drawer.dart';
import '/widgets/tablet_desktop_navbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          BlocProvider.of<NavigationCubit>(context).showMobileDrawer();
        } else {
          BlocProvider.of<NavigationCubit>(context).showTabletDesktopNavBar();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Responsive Navigation'),
          ),
          drawer: constraints.maxWidth < 600 ? MobileDrawer() : null,
          body: Column(
            children: [
              if (constraints.maxWidth >= 600) TabletDesktopNavBar(),
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
        );
      },
    );
  }
}