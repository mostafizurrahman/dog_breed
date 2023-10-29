import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeProvider {
  static BoxDecoration get shadow => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ],
      );

  static BoxDecoration get circle => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(1000),
    ),
    border: Border.all(color: Colors.black54, width: 1),
  );

  static Widget get progressView => const CircularProgressIndicator(color: Colors.blueAccent, strokeWidth: 1.25,);
  static Widget getIndicator(context, url, downloadProgress) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Center(
        child: ThemeProvider.progressView,
      ),
    );
  }

  static Widget geErrorView(context, url, error) {
   return const SizedBox(
      child: Center(
        child: Icon(
          Icons.error,
          size: 50,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  static showLoader(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            backgroundColor: Colors.grey.withAlpha(60),
            child: WillPopScope(
              onWillPop: () => Future.value(false),
              child: Container(
                width: 120,
                height: 120,
                decoration: ThemeProvider.shadow,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      ThemeProvider.progressView,
                      const SizedBox(height: 12),
                      const Text('Loading Data....')
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      barrierDismissible: false,
    );
  }
}
