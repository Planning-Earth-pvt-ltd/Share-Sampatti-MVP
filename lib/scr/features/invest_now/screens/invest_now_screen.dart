import 'package:share_sampatti_mvp/app/app.dart';

class InvestNowScreen extends StatelessWidget {
  const InvestNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColors.lightGrey,
        ),
        title: Text("Invest Now"),
      ),
      body: Center(child: Inter(text: "Invest Now")),
    );
  }
}
