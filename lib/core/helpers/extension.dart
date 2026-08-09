import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushnamed(String routeNamed, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeNamed, arguments: arguments);
  }

  Future<dynamic> pushReplacementName(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntilname(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop() => Navigator.of(this).pop();
}
