import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_images.dart';
import 'package:payment_app/core/utils/app_styles.dart';
import 'package:svg_flutter/svg.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImages.imagesCardBackground))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Credit",
                style: AppStyles.medium12,
              ),
              trailing: SvgPicture.asset(AppImages.imagesCreditCard),
            ),
            const Spacer(),
            const Text("1234 5678 1234 5678", style: AppStyles.semiBold12),
            const Spacer(),
            const Row(
              children: [
                CardWidgetElement(
                  title: "Card header",
                  subtitle: "Sam Louis",
                ),
                Spacer(flex: 1),
                CardWidgetElement(
                  title: "Expire",
                  subtitle: "07/29",
                ),
                Spacer(flex: 1),
                CardWidgetElement(
                  title: "CVV",
                  subtitle: "215",
                ),
                Spacer(flex: 4),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CardWidgetElement extends StatelessWidget {
  const CardWidgetElement({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.regular6,
        ),
        Text(
          subtitle,
          style: AppStyles.medium12,
        ),
      ],
    );
  }
}
