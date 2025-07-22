import 'package:share_sampatti_mvp/app/app.dart';

class NoConnection extends ConsumerWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.noConnection,
                width: appDimensions.width * 0.5,
              ),
              SizedBox(height: appDimensions.verticalSpaceL),
              Inter(
                text: "We couldn’t connect to our servers",
                fontSize: appDimensions.fontM,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: appDimensions.verticalSpaceS),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.lightGrey,
                    fontSize: appDimensions.fontXXS,
                  ),
                  children: [
                    TextSpan(text: "Please check your network connection. "),
                    TextSpan(
                      text: "support@ShareSampatti.com",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(text: " Contact  for assistance."),
                  ],
                ),
              ),
            ],
          ),
          CustomElevatedButton(
            onPressed: () {
              ref.refresh(propertyProvider);
              ref.read(noConnectionProvider.notifier).state = false;
            },
            text: "Retry",
          ),
        ],
      ).withPadAll(appDimensions.horizontalPaddingM),
    );
  }
}
