import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  /// for example: "### ### ## ##"
  final String format;

  PhoneNumberFormatter({required this.format});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final buffer = StringBuffer();
    int digitIndex = 0;

    for (int i = 0; i < format.length; i++) {
      if (digitIndex >= newText.length) {
        break;
      }

      if (format[i] == '#') {
        buffer.write(newText[digitIndex]);
        digitIndex++;
      } else {
        buffer.write(format[i]);
      }
    }

    if (digitIndex < newText.length) {
      buffer.write(newText.substring(digitIndex));
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
