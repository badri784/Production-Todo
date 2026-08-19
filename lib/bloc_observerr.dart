import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverr implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    debugPrint('${bloc.runtimeType} - $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} - $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('${bloc.runtimeType} - $event');
  }

  @override
  void onTransition(Bloc bloc, Transition<dynamic, dynamic> transition) {
    debugPrint('${bloc.runtimeType} - $transition');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    debugPrint('${bloc.runtimeType} - Closed');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    debugPrint('${bloc.runtimeType} - Created');
  }

  @override
  void onDone(
    Bloc<dynamic, dynamic> bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    debugPrint('${bloc.runtimeType} - Done');
  }
}
