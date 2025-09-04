import 'package:share_sampatti_mvp/app/app.dart';

class BottomProperty extends ConsumerWidget {
  const BottomProperty({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final currentPropertyProv = ref.watch(
      currentPropertyProvider("cmda6d0zy0001v2ms0wmqwee5"),
    );

    return currentPropertyProv.when(
      data: (data) => Container(
        height: appDimensions.height * 0.3,
        margin: EdgeInsets.all(appDimensions.horizontalPaddingM),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(appDimensions.radiusM),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Inter(
                        text: data.title,
                        fontSize: appDimensions.fontM,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: appDimensions.verticalSpaceS),
                      Inter(
                        text: data.description!,
                        maxLines: 4,
                        fontSize: appDimensions.fontXS,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),

                SizedBox(width: appDimensions.horizontalSpaceS),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(
                    appDimensions.radiusM,
                  ),
                  child: Image.network(
                    data.images[0],
                    height: 115,
                    width: 158,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            CustomElevatedButton(
              onPressed: () =>
                  context.push("/investNow/cmcufto670000v2sg2kh02m7c"),
              text: "Invest Now",
            ),
          ],
        ),
      ),
      error: (e, _) => Center(child: Text('Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
