part of 'navigation_cubit.dart';

abstract class NavigationState {
  const NavigationState();
}

class NavigationInitial extends NavigationState {}

class NavigationHome extends NavigationState {}

class NavigationAbout extends NavigationState {}
