import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class TransactionShape extends StatelessWidget {
  const TransactionShape({
    super.key,
    required this.upperSection,
    required this.lowerSection,
    this.scaffoldBackground = Colors.white,
    this.containerColor = Colors.grey,
    this.dividerPosition = .2,
    this.containerHeightRatio = .85,
  });
  final Widget upperSection, lowerSection;
  final Color scaffoldBackground, containerColor;
  final double dividerPosition, containerHeightRatio;
  @override
  Widget build(BuildContext context) {
    double containerHeight =
        MediaQuery.sizeOf(context).height * containerHeightRatio;
    double lowerSectionHeight = containerHeight * dividerPosition;

    return SizedBox(
      height: containerHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: containerHeight,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.grey),
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    SizedBox(
                        height: containerHeight - lowerSectionHeight - 120,
                        child: upperSection),
                    const SizedBox(height: 50),
                    SizedBox(
                        height: lowerSectionHeight - 5, child: lowerSection),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.grey,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.green,
                child: SvgPicture.asset(AppImages.imagesRightIcon),
              ),
            ),
          ),
          Positioned(
              bottom: lowerSectionHeight + 20,
              child: CircleAvatar(backgroundColor: scaffoldBackground)),
          Positioned(
              bottom: lowerSectionHeight + 20,
              right: 0,
              child: CircleAvatar(backgroundColor: scaffoldBackground)),
          Positioned(
              bottom: lowerSectionHeight + 40,
              left: 50,
              right: 50,
              child: Row(
                children: List.generate(
                    20,
                    (_) => Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 3),
                            height: 2,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )),
              )),
        ],
      ),
    );
  }
}
