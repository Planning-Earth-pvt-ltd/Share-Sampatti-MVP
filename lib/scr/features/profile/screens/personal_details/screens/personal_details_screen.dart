import 'package:share_sampatti_mvp/app/app.dart';

class CompleteYourProfileScreen extends ConsumerStatefulWidget {
  const CompleteYourProfileScreen({super.key});

  @override
  ConsumerState<CompleteYourProfileScreen> createState() =>
      _CompleteYourProfileScreenState();
}

class _CompleteYourProfileScreenState
    extends ConsumerState<CompleteYourProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Map<String, TextEditingController> controller = ref.watch(provider);
    final nameValidator = ref.watch(nameValidatorProvider);
    final mobileValidator = ref.watch(mobileValidatorProvider);
    final emailValidator = ref.watch(emailValidatorProvider);
    final panValidator = ref.watch(panValidatorProvider);

    buildHeading(String text) {
      return Inter(
        text: text,
        color: AppColors.lightGrey,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back_sharp),
            color: AppColors.lightGrey,
          ),
          title: Text("Complete Your Profile"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Inter(
                  text:
                      "Add your contact info to get resemblance updates, portfolio insights, reminders & more",
                  color: AppColors.lightGrey,
                  fontSize: 12,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("Name"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["name"]!,
                  hintText: 'Demo Gupta',
                  validator: nameValidator,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("Email Address"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["emailAddress"]!,
                  hintText: '007.demo@gmail.com',
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("Phone Number"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["mobileNumber"]!,
                  hintText: '987654XXXX',
                  validator: mobileValidator,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.01),
                Inter(
                  text: "Cannot edit phone number",
                  color: AppColors.lightGrey,
                  fontSize: 12,
                ),
                SizedBox(height: size.height * 0.03),

                buildHeading("PAN"),
                SizedBox(height: size.height * 0.01),
                CustomTextField(
                  controller: controller["pan"]!,
                  hintText: 'XXXXXX756C',
                  validator: panValidator,
                ),
                SizedBox(height: size.height * 0.01),
                Wrap(
                  children: [
                    Inter(
                      text: "PAN cannot be edited once verified.  ",
                      fontSize: 12,
                      color: AppColors.lightGrey,
                    ),
                    CustomTextButton(
                      text: "Learn more",
                      fontSize: 12,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {},
                      text: "Reset",
                      width: size.width * 0.43,
                      backgroundColor: AppColors.darkGrey,
                      textColor: Theme.of(context).colorScheme.primary,
                    ),
                    CustomElevatedButton(
                      onPressed: () {},
                      text: "Save",
                      width: size.width * 0.43,
                      textColor: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
