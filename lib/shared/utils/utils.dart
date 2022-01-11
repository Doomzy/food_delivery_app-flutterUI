import 'package:flutter/material.dart';

void navigateTo({required context, required Widget destination}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );

void navigateToAndRemove({required context, required Widget destination}) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination),
        (Route<dynamic> route) => false);
