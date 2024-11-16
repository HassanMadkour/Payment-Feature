import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.textInputType,
    this.inputFormatter,
  });
  final String hint;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint,
            style: AppStyles.regular18
                .copyWith(color: Colors.black.withOpacity(.7)),
          ),
          TextField(
            style: AppStyles.semiBold18,
            inputFormatters: inputFormatter,
            keyboardType: textInputType,
            decoration: InputDecoration(
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(),
                border: buildBorder()),
          )
        ],
      ),
    );
  }

  UnderlineInputBorder buildBorder() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2));
  }
}
