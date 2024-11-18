import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_images.dart';
import 'package:payment_app/core/utils/app_styles.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_done_entity.dart';
import 'package:svg_flutter/svg.dart';

class TransactionDetailsSection extends StatelessWidget {
  const TransactionDetailsSection({
    super.key,
    required this.transactionDoneEntity,
  });
  final TransactionDoneEntity transactionDoneEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Thank you!", style: AppStyles.medium25),
        Text("Your transaction was successful", style: AppStyles.regular20),
        const SizedBox(height: 20),
        ListTile(
          title: const Text("Date", style: AppStyles.regular18),
          trailing: SizedBox(
            width: MediaQuery.sizeOf(context).width * .5,
            child: Text(
              textAlign: TextAlign.right,
              transactionDoneEntity.transactionDateTime.substring(10, 22),
              style: AppStyles.semiBold18,
              overflow: TextOverflow.ellipsis, // Handles overflow gracefully
              maxLines: 1,
            ),
          ),
        ),
        ListTile(
          title: const Text("Time", style: AppStyles.regular18),
          trailing: SizedBox(
            width: MediaQuery.sizeOf(context).width * .5,
            child: Text(
              textAlign: TextAlign.right,

              transactionDoneEntity.transactionDateTime.substring(0, 9),
              style: AppStyles.semiBold18,
              overflow: TextOverflow.ellipsis, // Handles overflow gracefully
              maxLines: 1,
            ),
          ),
        ),
        ListTile(
            title: const Text("To", style: AppStyles.regular18),
            trailing: SizedBox(
              width: MediaQuery.sizeOf(context).width * .5,
              child: Text(
                textAlign: TextAlign.right,
                transactionDoneEntity.sellerEmail,
                style: AppStyles.semiBold18,
                overflow: TextOverflow.ellipsis,
              ),
            )),
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
