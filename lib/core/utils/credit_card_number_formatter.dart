import 'package:flutter/services.dart';

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length > 16) {
      return oldValue;
    }

    final newText = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i % 4 == 0 && i != 0) {
        newText.write('    ');
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
