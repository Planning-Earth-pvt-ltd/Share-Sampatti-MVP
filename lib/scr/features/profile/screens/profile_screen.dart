import 'package:share_sampatti_mvp/app/app.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    buildHeadingText(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: appDimensions.fontM,
        fontWeight: FontWeight.w600,
      ).withPadAll(appDimensions.horizontalPaddingM);
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
              margin: EdgeInsets.only(top: appDimensions.verticalSpaceM),
              padding: EdgeInsets.only(
                top: appDimensions.verticalPaddingS,
                bottom: appDimensions.verticalPaddingS,
                left: appDimensions.horizontalPaddingM,
                right: appDimensions.horizontalPaddingS,
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
                          fontSize: appDimensions.fontL,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: appDimensions.horizontalSpaceXS),

                      // USER DETAILS
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NAME
                          Inter(
                            text: "Shubham Patel",
                            fontSize: appDimensions.fontM,
                            fontWeight: FontWeight.w600,
                          ),

                          // PHONE NUMBER
                          Inter(
                            text: "+91 XXXXXX4475",
                            color: AppColors.lightGrey,
                            fontSize: appDimensions.fontXXS,
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
                      size: appDimensions.iconsM,
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
            SizedBox(height: appDimensions.verticalSpaceM),

            // LOGOUT
            ProfileList(details: ["Logout"], color: AppColors.red),
          ],
        ),
      ),
    );
  }
}
