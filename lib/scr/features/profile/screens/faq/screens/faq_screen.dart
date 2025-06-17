import 'package:share_sampatti_mvp/app/app.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColors.lightGrey,
        ),
        title: Text("FAQ's"),
      ),
      body: Column(
        children: [
          Inter(
            text: "Frequently Asked Questions",
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          Wrap(
            children: [
              Inter(
                text: "Don’t see the answer you’re looking for? ",
                color: AppColors.lightGrey,
                fontSize: 11,
              ),
              CustomTextButton(
                text: "Get in touch",
                fontSize: 11,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 50),
          ExpansionTileCard(
            baseColor: AppColors.black,
            expandedColor: AppColors.black,
            shadowColor: Theme.of(context).colorScheme.secondary,
            title: Inter(
              text: "How to start to join this social media?",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: [
              Inter(
                text:
                    "Getting started with a new  social media platform is a straightforward process. Decide which social media platform you want to join (e.g., Facebook, Instagram,twitter, LinkedIn)",
                color: AppColors.lightGrey,
              ).withPadAll(10),
            ],
          ),
          Divider(color: AppColors.dividerColor),
          ExpansionTileCard(
            baseColor: AppColors.black,
            expandedColor: AppColors.black,
            shadowColor: Theme.of(context).colorScheme.secondary,
            title: Inter(
              text: "For what platforms the applications is available?",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: [
              Inter(
                text:
                    "Getting started with a new  social media platform is a straightforward process. Decide which social media platform you want to join (e.g., Facebook, Instagram,twitter, LinkedIn)",
                color: AppColors.lightGrey,
              ).withPadAll(10),
            ],
          ),
        ],
      ).withPadAll(20),
    );
  }
}
