import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_images.dart';
import 'package:payment_app/core/utils/app_styles.dart';
import 'package:svg_flutter/svg.dart';

class CodeBarSection extends StatelessWidget {
  const CodeBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: SvgPicture.asset(AppImages.imagesCode)),
          const SizedBox(width: 10),
          Flexible(
            child: SizedBox(
              width: 200,
              child: AspectRatio(
                aspectRatio: 113 / 58,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.green)),
                  child: Center(
                    child: Text(
                      "PAID",
                      style:
                          AppStyles.semiBold24.copyWith(color: AppColors.green),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
