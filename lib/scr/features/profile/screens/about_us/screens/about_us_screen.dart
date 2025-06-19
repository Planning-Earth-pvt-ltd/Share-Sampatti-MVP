import 'package:share_sampatti_mvp/app/app.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColors.lightGrey,
        ),
        title: Text("About us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Inter(
              text:
                  "Share Sampatti shatters the traditional barriers to real estate investment. Our platform empowers everyone to become a player, allowing you to invest in valuable properties with just a tap, for a fraction of the usual cost. we believe real estate wealth creation shouldn’t be limited to the privileged few.",
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ).withPadAll(20),
            Inter(
              text:
                  "Join Share Sampatti, invest like a pro, diversify you portfolio, and unlock the potential for long-term growth. We offer a secure, transparent, and user-friendly experience,so you can invest with confidence and start your journey to financial freedom today!",
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ).withPadAll(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(AppAssets.appLogo, width: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Inter(
                      text: "+91 999999999",
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                    Inter(
                      text: "share@sampatti.com",
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ],
                ),
              ],
            ).withPadSymmetric(50, 20),
            Inter(
              text: "Sco - 539, Sector-70, Mohali\nPin No- 160070",
              textAlign: TextAlign.center,
              letterSpacing: 1,
              fontSize: 12,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
