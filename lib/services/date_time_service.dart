import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeService {
  Future<void> showDateTimePicker(
      BuildContext context, void Function(DateTime) onDateTimeChanged) {
    return showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: 250,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime(2024),
              onDateTimeChanged: onDateTimeChanged,
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: 2100,
            ),
          );
        });
  }
}
