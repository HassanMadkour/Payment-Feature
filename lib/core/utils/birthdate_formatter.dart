import 'package:flutter/services.dart';

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;

    String newText = newValue.text;

    if (newTextLength == 2 || newTextLength == 5) {
      if (oldValue.text.length < newTextLength) {
        newText += '/';
        selectionIndex++;
      }
    }

    if (newTextLength > 10) {
      newText = newText.substring(0, 10);
      selectionIndex = 10;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
