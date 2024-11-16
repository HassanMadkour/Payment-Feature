import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

AppBar buildAppBar(BuildContext context, [String? title]) {
  return AppBar(
    title: Text(
      title ?? '',
      style: AppStyles.medium25,
    ),
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_sharp,
          size: 45,
        )),
  );
}
