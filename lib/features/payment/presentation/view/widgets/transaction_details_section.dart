import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_images.dart';
import 'package:payment_app/core/utils/app_styles.dart';
import 'package:svg_flutter/svg.dart';

class TransactionDetailsSection extends StatelessWidget {
  const TransactionDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Thank you!", style: AppStyles.medium25),
        Text("Your transaction was successful", style: AppStyles.regular20),
        const SizedBox(height: 20),
        const ListTile(
            title: Text("Date", style: AppStyles.regular18),
            trailing: Text("01/24/2023", style: AppStyles.semiBold18)),
        const ListTile(
            title: Text("Time", style: AppStyles.regular18),
            trailing: Text("10:15 AM", style: AppStyles.semiBold18)),
        const ListTile(
            title: Text("To", style: AppStyles.regular18),
            trailing: Text("Sam Louis", style: AppStyles.semiBold18)),
        const Divider(height: 40, indent: 20, endIndent: 20),
        const ListTile(
            title: Text("Total", style: AppStyles.semiBold24),
            trailing: Text(r"$50.97", style: AppStyles.semiBold24)),
        Card(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          child: ListTile(
            leading: SvgPicture.asset(AppImages.imagesCreditCard),
            title: const Text("Credit Card", style: AppStyles.regular18),
            subtitle: Text("Mastercard **78",
                style: AppStyles.regular16
                    .copyWith(color: Colors.black.withOpacity(.7))),
          ),
        ),
      ],
    );
  }
}
