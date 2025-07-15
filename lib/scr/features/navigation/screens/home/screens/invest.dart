import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class Invest extends ConsumerWidget {
  const Invest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final propertyProv = ref.watch(propertyProvider);

    return SizedBox(
      height: appDimensions.width * 0.6,
      child: propertyProv.when(
        data: (property) => ListView.builder(
          itemCount: 10,
          // itemCount: property.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: appDimensions.horizontalPaddingM),
          itemBuilder: (context, index) {
            final price = NumberFormat.decimalPattern(
              "en_IN",
            ).format(property[index % property.length].pricePerSqFt);

            return Container(
              height: appDimensions.width * 0.6,
              width: appDimensions.width * 0.7,
              margin: EdgeInsets.only(left: appDimensions.horizontalPaddingM),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(appDimensions.radiusM),
              ),
              child: Column(
                children: [
                  // IMAGE
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.vertical(
                      top: Radius.circular(appDimensions.radiusM),
                    ),
                    child: Image.network(
                      property[index % property.length].images[0],
                      height: appDimensions.width * 0.38,
                      width: appDimensions.width,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITLE
                      Inter(
                        text: property[index % property.length].title,
                        fontSize: appDimensions.fontS,
                        fontWeight: FontWeight.w500,
                      ),
                      Divider(thickness: 2, color: AppColors.dividerColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // PRICE PER SQFT
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Inter(
                                text: "₹ $price /-",
                                fontSize: appDimensions.fontS,
                                fontWeight: FontWeight.w500,
                              ),
                              Inter(
                                text: "per\nSQFT",
                                color: AppColors.lightGrey,
                                fontSize: appDimensions.fontXXXS,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),

                          // INVEST NOW BUTTON
                          GestureDetector(
                            onTap: () => context.push(
                              "/investNow/${property[index % property.length].id}",
                            ),
                            child: Inter(
                              text: "Invest Now",
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: appDimensions.fontS,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).withPadAll(appDimensions.horizontalPaddingS),
                ],
              ),
            );
          },
        ),
        error: (e, _) => Center(child: Text('Error: $e')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    ).withPadSymmetric(appDimensions.horizontalPaddingM, 0);
  }
}
