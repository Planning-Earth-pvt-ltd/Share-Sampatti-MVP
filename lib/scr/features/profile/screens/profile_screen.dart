import 'package:share_sampatti_mvp/app/app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    buildHeading(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ).withPadAll(20);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColors.lightGrey,
        ),
        title: Text("User Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Inter(
                            text: "Shubham Patel",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          Inter(
                            text: "View Details",
                            color: AppColors.lightGrey,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
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
            buildHeading("Account Details"),
            ProfileList(
              details: AppConstants.accountDetails,
              subDetails: AppConstants.accountSubDetails,
            ),

            buildHeading("Account"),
            ProfileList(details: AppConstants.account),

            buildHeading("About"),
            ProfileList(
              details: AppConstants.about,
              onTap: List.generate(
                AppConstants.aboutRoutes.length,
                (index) =>
                    () => context.push(AppConstants.aboutRoutes[index]),
              ),
            ),
            SizedBox(height: 30),
            ProfileList(details: ["Logout"], color: AppColors.red),
          ],
        ),
      ),
    );
  }
}
