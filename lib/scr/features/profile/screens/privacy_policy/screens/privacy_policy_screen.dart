import 'package:share_sampatti_mvp/app/app.dart';

class PrivacyPolicyScreen extends ConsumerWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    return Scaffold(
      appBar: CustomAppBar.appbar(context, "Privacy Policy"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
        child: Column(
          children: [
            Inter(
              text:
                  "Share Sampatti Private Limited, CIN No. U70200KA2022PTC166655 (“Company”,“We”, “Us”, or “Our”), a private limited company with its registered office at No 222, Relebale Lifestyle Layout Haralu, HSR Layout, Bengaluru - 560102, Karnataka, India which operates the website www.ShareSampatti.com [and the mobile application] (collectively referred to as the “Platform”) is committed to protecting your privacy and the information that you share while using the platform. We value the  trust You place in Us. Therefore, We maintain the highest security standards for securing the transactions and Your Information ( defined below). We may also allow Our group/affiliate entities to use Our Platform to offer their products and services to You, in accordance with this privacy policy and under applicable terms and conditions specified on Our Platform.",
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: appDimensions.verticalSpaceL),
            Inter(
              text:
                  "This privacy policy (“Privacy Policy”) specifies the manner in which Your personal data and other information is collected, received, stored, processed, disclosed, transferred, dealt with or otherwise handled by the Company in accordance with applicable laws.",
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
