import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // MARK: Name
    Row name() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Inter(
            text: "Namaste, Shubham",
            fontSize: 22.78,
            fontWeight: FontWeight.w600,
          ),
          GestureDetector(
            onTap: () => context.push("/profile"),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.profileBackground,
              child: Inter(
                text: "S",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NAME
          name().withPadAll(20),

          // NET WORTH
          NetWorth(),

          // START INVESTMENT NOW
          Inter(
            text: "Start Investing Now",
            fontSize: 22.78,
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
                fontSize: 20.58,
                fontWeight: FontWeight.w500,
              ),
              CustomElevatedButton(
                onPressed: () {},
                text: "View All",
                width: 72,
                height: 25,
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
          SizedBox(height: 20),

          // TRACK NOW
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.asset(AppAssets.trackNow),
              ).withPadSymmetric(0, 20),
              CustomElevatedButton(
                onPressed: () {},
                text: "Track Now",
                width: 91,
                height: 27,
                radius: 6,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ).withPadAllCustom(0, 40, 40, 0),
            ],
          ),

          //EXPLORE BY Theme
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Inter(
                text: "Explore By Theme",
                fontSize: 20.58,
                fontWeight: FontWeight.w500,
              ),
              CustomElevatedButton(
                onPressed: () {},
                text: "View All",
                width: 72,
                height: 25,
                radius: 6,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ).withPadAll(20),
          Explore(explore: AppConstants.themes, images: AppAssets.themesImages),
          SizedBox(height: 20),

          // CALL NOW
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.asset(AppAssets.callNow),
              ).withPadSymmetric(0, 20),
              CustomElevatedButton(
                onPressed: () => CustomUrlLauncher.telephone(),
                text: "Call Now",
                width: 91,
                height: 27,
                radius: 6,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ).withPadAllCustom(0, 20, 0, 40),
            ],
          ),

          //PROPERTY
          Container(
            height: size.width * 0.55,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Theme.of(context).colorScheme.secondary.withAlpha(50),
                  blurRadius: 25.6,
                  spreadRadius: 0,
                ),
              ],
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

                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(11),
                      child: Image.asset(
                        AppAssets.advertismentImages[0],
                        height: 115,
                        width: 158,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),

                CustomElevatedButton(
                  onPressed: () => context.push("/investNow"),
                  text: "Invest Now",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
