import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class SaveScreen extends ConsumerStatefulWidget {
  const SaveScreen({super.key});

  @override
  ConsumerState<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends ConsumerState<SaveScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final searchController = ref.watch(searchProvider);
    final propertyProv = ref.watch(propertyProvider);
    final bookmarked = ref.watch(bookMarkProvider);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  title: Inter(
                    text: "Save",
                    fontSize: appDimensions.fontL,
                    fontWeight: FontWeight.w600,
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(70),
                    child: CustomTextField(
                      controller: searchController["search"]!,
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: AppColors.grey,
                      ),
                    ).withPadAll(appDimensions.horizontalPaddingS),
                  ),
                ),

                propertyProv.when(
                  data: (data) {
                    final isBookmarked = data
                        .where((p) => bookmarked.contains(p.id))
                        .toList();

                    if (isBookmarked.isEmpty) {
                      return SliverFillRemaining(
                        child: Center(
                          child: Inter(
                            text: "No saved properties",
                            color: AppColors.lightGrey,
                          ),
                        ),
                      );
                    }

                    return SliverList.builder(
                      itemCount: isBookmarked.length,
                      itemBuilder: (context, index) {
                        final property = isBookmarked[index];
                        final price = NumberFormat.decimalPattern(
                          "en_IN",
                        ).format(property.pricePerSqFt);

                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: appDimensions.verticalPaddingS,
                          ),
                          padding: EdgeInsets.all(
                            appDimensions.horizontalPaddingM,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(
                              appDimensions.radiusM,
                            ),
                            border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.white),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                      property.images.isNotEmpty
                                          ? property.images[0]
                                          : "https://res.cloudinary.com/dowsrgchg/image/upload/v1752232642/properties/gxbw2tvj3qa2wtill46v.webp",
                                    ),
                                  ),
                                  SizedBox(
                                    width: appDimensions.horizontalSpaceXS,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Inter(
                                          text: property.title,
                                          fontSize: appDimensions.fontM,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: appDimensions.verticalSpaceS,
                                        ),
                                        Inter(
                                          text: "Estimated Price: ₹$price",
                                          color: AppColors.lightGrey,
                                          fontSize: appDimensions.fontS,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => ref
                                        .read(bookMarkProvider.notifier)
                                        .toggleMarker(property.id),
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: appDimensions.verticalSpaceS),
                              Divider(
                                thickness: 2,
                                color: AppColors.dividerColor,
                              ),
                              SizedBox(height: appDimensions.verticalSpaceS),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Inter(
                                        text: "Absolute Returns:",
                                        color: AppColors.lightGrey,
                                        fontSize: appDimensions.fontS,
                                      ),
                                      Inter(
                                        text: "24.1 %",
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontSize: appDimensions.fontM,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () => context.push(
                                      "/investNow/${property.id}",
                                    ),
                                    child: Inter(
                                      text: "Invest Now",
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontSize: appDimensions.fontS,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  error: (e, _) => Center(child: Text('Error: $e')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
