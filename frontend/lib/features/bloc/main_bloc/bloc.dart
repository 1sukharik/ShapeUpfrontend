import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';
import 'state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(1)) {
    on<ChangeTabEvent>((event, emit) {
      emit(NavigationState(event.tabIndex));
    });
  }
}
