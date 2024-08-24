import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customErrorSnackBar(
    {required String message, required BuildContext context}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          const SizedBox(width: 8),
          Text(message),
        ],
      ),
    ),
  );
}
