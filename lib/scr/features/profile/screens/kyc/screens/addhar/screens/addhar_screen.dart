import 'package:share_sampatti_mvp/app/app.dart';

class AddharScreen extends ConsumerStatefulWidget {
  const AddharScreen({super.key});

  @override
  ConsumerState<AddharScreen> createState() => _AddharScreenState();
}

class _AddharScreenState extends ConsumerState<AddharScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Map<String, TextEditingController> controller = ref.watch(
      documentProvider,
    );

    buildHeading(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ).leftAlignment();
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar.appbar(context, "Verify your Addhar"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                Image.asset(AppAssets.addhar, height: size.height * 0.3),
                SizedBox(height: size.height * 0.1),

                buildHeading("Enter Addhar Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["addhar"]!,
                  hintText: 'XXXX XXXX 7562',
                  // validator: addharValidator,
                ),
                SizedBox(height: size.height * 0.03),

                CustomElevatedButton(onPressed: () {}, text: "Save"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
