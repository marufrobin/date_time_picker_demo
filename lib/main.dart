import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

import 'native_date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Time Picker Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DateTimePickerDemo(title: 'Date Time Picker Demo'),
    );
  }
}

class DateTimePickerDemo extends StatefulWidget {
  const DateTimePickerDemo({super.key, required this.title});
  final String title;

  @override
  State<DateTimePickerDemo> createState() => _DateTimePickerDemoState();
}

class _DateTimePickerDemoState extends State<DateTimePickerDemo> {
  DateTime? _showDateTimePicker;

  DateTime? _show12TimePicker;

  DateTime? _showDatePicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Demo-01'),
              Text("Picked Date $_showDatePicker"),
              _datePicker(context),
              const SizedBox(height: 16),
              const Text('Demo-02'),
              Text("Picked Time $_showDateTimePicker"),
              TextButton(
                onPressed: () {
                  picker.DatePicker.showDateTimePicker(
                    context,
                    onChanged: (DateTime? date) {
                      log(name: 'onChanged', date.toString());
                    },
                    onConfirm: (DateTime? date) {
                      log(name: 'onConfirm', date.toString());
                      setState(() => _showDateTimePicker = date);
                    },
                    onCancel: () {
                      log(name: 'onCancel', "Cancelled");
                    },
                    showTitleActions: true,
                  );
                },
                child: const Text('Open Date Time Picker'),
              ),
              const Text('Demo-03'),
              Text("Picked 12H Time $_show12TimePicker"),
              TextButton(
                onPressed: () {
                  picker.DatePicker.showTime12hPicker(
                    context,
                    onChanged: (DateTime? date) {
                      log(name: 'onChanged', date.toString());
                    },
                    onConfirm: (DateTime? date) {
                      log(name: 'onConfirm', date.toString());
                      setState(() => _show12TimePicker = date);
                    },
                    onCancel: () {
                      log(name: 'onCancel', "Cancelled");
                    },
                    showTitleActions: true,
                  );
                },
                child: const Text('Open Time Picker'),
              ),
              const _NativeDateTimePicker(),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _datePicker(BuildContext context) {
    return TextButton(
      onPressed: () {
        picker.DatePicker.showDatePicker(
          context,
          onChanged: (DateTime? date) {
            log(name: 'onChanged', date.toString());
          },
          onConfirm: (DateTime? date) {
            log(name: 'onConfirm', date.toString());
            setState(() => _showDatePicker = date);
          },
          onCancel: () {
            log(name: 'onCancel', "Cancelled");
          },
        );
      },
      child: const Text('Open DatePicker'),
    );
  }
}

class _NativeDateTimePicker extends StatefulWidget {
  const _NativeDateTimePicker({super.key});

  @override
  State<_NativeDateTimePicker> createState() => _NativeDateTimePickerState();
}

class _NativeDateTimePickerState extends State<_NativeDateTimePicker> {
  DateTime? _pickedDate;
  DateTime? _pickedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Demo-05'),
        Text("Picked Date $_pickedDate"),
        TextButton(
          onPressed: () async {
            DateTime? date = await Common__DateTimePicker.kShowDateRangePicker(
                context: context);
            log(date.toString(), name: "Date time-->");
            setState(() => _pickedDate = date);
          },
          child: const Text('Open Native Date Range Picker'),
        ),
        const Text('Demo-06'),
        Text("Picked Time $_pickedTime"),
        TextButton(
          onPressed: () async {
            DateTime? dateTime =
                await Common__DateTimePicker.kShowTimePicker(context: context);
            log(dateTime.toString(), name: "Date time-->");
            setState(() => _pickedTime = dateTime);
          },
          child: const Text('Open Native Time Picker'),
        ),
      ],
    );
  }
}
