import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingService {
  void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white.withOpacity(0.5),
            title: const Text(
              'Сиздин маалыматыңыз жөнөтүлүүдө',
              textAlign: TextAlign.center,
            ),
            children: [
              CupertinoActivityIndicator(
                radius: 20,
                color: Colors.blue.withOpacity(0.5),
              )
            ],
          );
        });
  }
}
