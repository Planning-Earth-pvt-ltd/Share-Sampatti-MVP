import 'package:intl/intl.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class InvestmentScreen extends ConsumerStatefulWidget {
  const InvestmentScreen({super.key});

  @override
  ConsumerState<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends ConsumerState<InvestmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final searchController = ref.watch(searchProvider);
    final propertyProv = ref.watch(propertyProvider);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Inter(
                text: "Invest",
                fontSize: appDimensions.fontL,
                fontWeight: FontWeight.w600,
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomTextField(
                  controller: searchController["search"]!,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search_rounded, color: AppColors.grey),
                ).withPadAll(appDimensions.horizontalPaddingS),
              ),
            ),
            body: propertyProv.when(
              data: (property) => ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final bookmark = ref.watch(bookmarkProvider(index));
                  final price = NumberFormat.decimalPattern(
                    "en_IN",
                  ).format(property[index % property.length].pricePerSqFt);

                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: appDimensions.verticalPaddingS,
                    ),
                    padding: EdgeInsets.all(appDimensions.horizontalPaddingM),
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
                                property[index % property.length].images[0],
                              ),
                            ),
                            SizedBox(width: appDimensions.horizontalSpaceXS),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Inter(
                                    text:
                                        property[index % property.length].title,
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
                              onPressed: () =>
                                  ref
                                          .read(
                                            bookmarkProvider(index).notifier,
                                          )
                                          .state =
                                      !bookmark,
                              icon: Icon(
                                bookmark
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: appDimensions.verticalSpaceS),
                        Divider(thickness: 2, color: AppColors.dividerColor),
                        SizedBox(height: appDimensions.verticalSpaceS),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Inter(
                                  text: "Absolute Returns:",
                                  color: AppColors.lightGrey,
                                  fontSize: appDimensions.fontS,
                                ),
                                Inter(
                                  text: "24.1 %",
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: appDimensions.fontM,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
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
                    ),
                  );
                },
              ),
              error: (e, _) => Center(child: Text('Error: $e')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }
}
