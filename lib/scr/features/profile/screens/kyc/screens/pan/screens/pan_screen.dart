import 'package:share_sampatti_mvp/app/app.dart';

class PanScreen extends ConsumerStatefulWidget {
  const PanScreen({super.key});

  @override
  ConsumerState<PanScreen> createState() => _PanScreenState();
}

class _PanScreenState extends ConsumerState<PanScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Map<String, TextEditingController> controller = ref.watch(
      documentProvider,
    );

    buildHeadingText(String text) {
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
        appBar: CustomAppBar.appbar(context, "Verify your PAN"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                Image.asset(AppAssets.pan, height: size.height * 0.3),
                SizedBox(height: size.height * 0.1),

                buildHeadingText("Enter PAN Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["pan"]!,
                  hintText: 'XXXXXX756C',
                  // validator: panValidator,
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
