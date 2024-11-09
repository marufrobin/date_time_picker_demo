import 'dart:developer';

import 'package:flutter/material.dart';

class Common__DateTimePicker {
  static Future<DateTime?> kShowDateRangePicker({
    required BuildContext context,
  }) async {
    try {
      return await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
    } catch (e) {
      return throw Exception("Error on Date range picker $e");
    }
  }

  static Future<DateTime?> kShowTimePicker({
    required BuildContext context,
  }) async {
    try {
      TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial,
      );
      log(timeOfDay.toString(), name: "Time of the day-->");

      DateTime selectedDay = DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        timeOfDay!.hour,
        timeOfDay.minute,
      );
      log(selectedDay.toString(), name: "selectedDay  of the day-->");
      return selectedDay;
    } catch (e) {
      return throw Exception("Error on time select $e");
    }
  }
}
