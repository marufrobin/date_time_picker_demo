import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class CustomPicker extends picker.DateTimePickerModel {
  @override
  String leftDivider() {
    return super.leftDivider();
  }

  @override
  String rightDivider() {
    return super.rightDivider();
  }

  @override
  List<int> layoutProportions() {
    return [1, 1, 1, 1];
    // return super.layoutProportions();
  }
}
