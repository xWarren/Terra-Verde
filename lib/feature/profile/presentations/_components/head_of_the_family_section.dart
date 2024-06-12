import 'package:flutter/widgets.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';

class HeadOfTheFamilySection extends StatelessWidget {
  const HeadOfTheFamilySection({
    super.key,
    required this.onTap,
    required this.firstName,
    required this.lastName
  });

  final VoidCallback onTap;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Head of the Family",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10
            ),
            decoration: ShapeDecoration(
              color: CustomColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: CustomColors.primaryColor)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: Dimensions.regularSpacing),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Image.asset(
                          Assets.logo,
                          height: 64,
                          width: 64
                        ),
                      ),
                      const SizedBox(width: Dimensions.extraLargeSpacing),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Text(
                                 "$firstName $lastName",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: CustomColors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Dimensions.largeSpacing),
                            const Text(
                             "Head of the Family",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: CustomColors.grey500,
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Image.asset(Assets.icView),
                )
              ]
            ),
          )
        ]
      ),
    );
  }
}