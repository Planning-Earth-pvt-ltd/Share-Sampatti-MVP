import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class FAQScreen extends ConsumerWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    buildExpensionTile(String question, String answer) {
      return Column(
        children: [
          ExpansionTileCard(
            baseColor: AppColors.black,
            expandedColor: AppColors.black,
            shadowColor: Theme.of(context).colorScheme.secondary,
            title: Inter(
              text: question,
              fontSize: appDimensions.fontS,
              fontWeight: FontWeight.w500,
            ),
            children: [
              Inter(
                text: answer,
                color: AppColors.lightGrey,
              ).withPadAll(appDimensions.horizontalPaddingS),
            ],
          ),
          Divider(color: AppColors.dividerColor),
        ],
      );
    }

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "FAQ's"),
      body: Column(
        children: [
          Inter(
            text: "Frequently Asked Questions",
            fontSize: appDimensions.fontL,
            fontWeight: FontWeight.w600,
          ),
          Wrap(
            children: [
              Inter(
                text: "Don’t see the answer you’re looking for? ",
                color: AppColors.lightGrey,
                fontSize: appDimensions.fontXXS,
              ),
              CustomTextButton(
                text: "Get in touch",
                fontSize: appDimensions.fontXXS,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: appDimensions.verticalSpaceL),

          buildExpensionTile(
            "How to start to join this social media?",
            "Getting started with a new  social media platform is a straightforward process. Decide which social media platform you want to join (e.g., Facebook, Instagram,twitter, LinkedIn)",
          ),

          buildExpensionTile(
            "For what platforms the applications is available?",
            "Getting started with a new  social media platform is a straightforward process. Decide which social media platform you want to join (e.g., Facebook, Instagram,twitter, LinkedIn)",
          ),
        ],
      ).withPadAll(appDimensions.horizontalPaddingM),
    );
  }
}
