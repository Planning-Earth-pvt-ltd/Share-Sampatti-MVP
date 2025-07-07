import 'package:share_sampatti_mvp/app/app.dart';

class KYCScreen extends ConsumerWidget {
  const KYCScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final appDimension = ref.watch(appDimensionsProvider);

    kycCard(String cardType, String route) {
      return ElevatedButton(
        onPressed: () => context.push(route),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGrey,
          foregroundColor: Theme.of(context).colorScheme.secondary,
          minimumSize: Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appDimension.radiusM),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.edit_document,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(width: size.width * 0.01),
            Inter(
              text: "Upload your $cardType card",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColors.lightGrey, size: 16),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColors.lightGrey,
        ),
        title: Text("KYC"),
      ),
      body: Column(
        children: [
          // KYC IMAGE
          SizedBox(height: size.height * 0.03),
          Image.asset(AppAssets.kyc, height: size.height * 0.3),
          SizedBox(height: size.height * 0.1),

          Inter(
            text: "Please submit the following documents verify your profile.",
            fontSize: 12,
            color: AppColors.lightGrey,
          ),
          SizedBox(height: size.height * 0.03),

          // PAN
          kycCard("Pan", "/pan"),
          SizedBox(height: size.height * 0.03),

          // ADDHAR
          kycCard("Addhar", "/addhar"),
        ],
      ).withPadAll(size.width * 0.05),
    );
  }
}
