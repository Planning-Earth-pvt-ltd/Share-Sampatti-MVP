import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/features/home/screens/advertisment.dart';
import 'package:share_sampatti_mvp/scr/features/home/screens/explore.dart';
import 'package:share_sampatti_mvp/scr/features/home/screens/invest.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    name() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Inter(
            text: "Namaste, User",
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          CircleAvatar(
            radius: 15,
            child: Inter(text: "U", fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NAME
              name().withPadAllCustom(20, 0, 20, 20),

              // NET WORTH
              NetWorth(),

              // START INVESTMENT NOW
              Inter(
                text: "Start Investing Now",
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ).withPadAllCustom(0, 0, 20, 0),
              Inter(
                text: "Start Investing Now",
                color: AppColors.lightGrey,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ).withPadAllCustom(0, 0, 20, 0),
              Invest(),

              // ADVERTISMENT
              Advertisment(),

              //EXPLORE BY REGIONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Inter(
                    text: "Explore By Regions",
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: "View All",
                    width: 88,
                    height: 22,
                    radius: 6,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ).withPadAll(20),
              Explore(
                explore: AppConstants.regions,
                images: AppAssets.regionsImages,
              ),

              // TRACK NOW
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.asset(AppAssets.trackNow),
              ).withPadSymmetric(0, 20),

              //EXPLORE BY Theme
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Inter(
                    text: "Explore By Theme",
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: "View All",
                    width: 88,
                    height: 22,
                    radius: 6,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ).withPadAll(20),
              Explore(
                explore: AppConstants.themes,
                images: AppAssets.regionsImages,
              ),

              // CALL NOW
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.asset(AppAssets.callNow),
              ).withPadSymmetric(0, 20),

              //PROPERTY
              Container(
                height: size.width * 0.7,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Inter(
                                text: "Property Title",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 20),
                              Inter(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),

                        Expanded(
                          flex: 2,

                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(11),
                            child: Image.asset(AppAssets.advertismentImages[0]),
                          ),
                        ),
                      ],
                    ),

                    CustomElevatedButton(
                      onPressed: () {},
                      text: "Invest Now",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
