import 'package:bloc/bloc.dart';

enum NavigationState { home, page1, page2, page3 }

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.home);

  void showHome() => emit(NavigationState.home);
  void showPage1() => emit(NavigationState.page1);
  void showPage2() => emit(NavigationState.page2);
  void showPage3() => emit(NavigationState.page3);

  void showMobileDrawer() {}

  void showTabletDesktopNavBar() {}
}
