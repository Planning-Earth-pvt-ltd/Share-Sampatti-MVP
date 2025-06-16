import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class Invest extends StatelessWidget {
  const Invest({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.6,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 20),
        itemBuilder: (context, index) => Container(
          height: size.width * 0.6,
          width: size.width * 0.65,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(11),
                ),
                child: Image.asset(AppAssets.startInvestingNow),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Inter(
                    text: "Property Title",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  Divider(color: AppColors.lightGrey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Inter(
                            text: "₹ 2,34,560 /-",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          Inter(
                            text: "per\nSQFT",
                            color: AppColors.lightGrey,
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Inter(
                          text: "Invest Now",
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ).withPadAll(10),
            ],
          ),
        ),
      ),
    ).withPadSymmetric(30, 0);
  }
}
