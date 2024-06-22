import 'package:bloc/bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  bool isTrigger = false;

  bool get getIsTrigger => isTrigger;

  void changeTo(NavigationState state, {bool fromNoti = false}) {
    if (fromNoti) {
      if (!isTrigger) {
        emit(state);
        isTrigger = true;
      }
    } else {
      emit(state);
    }
  }
}
