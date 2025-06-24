import 'package:share_sampatti_mvp/app/app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    buildHeadingText(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ).withPadAll(20);
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "User Profile"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE DETAILS
            Container(
              color: AppColors.darkGrey,
              height: 90,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // PROFILE PIC
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.profileBackground,
                        child: Inter(
                          text: "S",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),

                      // USER DETAILS
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NAME
                          Inter(
                            text: "Shubham Patel",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),

                          // PHONE NUMBER
                          Inter(
                            text: "+91 XXXXXX4475",
                            color: AppColors.lightGrey,
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ],
                  ),

                  // EDIT PROFILE BUTTON
                  IconButton(
                    onPressed: () => context.push("/personalDetails"),
                    style: IconButton.styleFrom(
                      shape: CircleBorder(
                        side: BorderSide(color: AppColors.grey),
                      ),
                    ),
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            // ACCOUNT DETAILS
            buildHeadingText("Account Details"),
            ProfileList(
              details: AppConstants.accountDetails,
              onTap: AppConstants.accountDetailsRoutes,
            ),

            // ABOUT
            buildHeadingText("About"),
            ProfileList(
              details: AppConstants.about,
              onTap: AppConstants.aboutRoutes,
            ),
            SizedBox(height: 30),

            // LOGOUT
            ProfileList(details: ["Logout"], color: AppColors.red),
          ],
        ),
      ),
    );
  }
}
