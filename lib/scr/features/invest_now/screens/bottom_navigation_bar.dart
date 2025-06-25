import 'package:share_sampatti_mvp/app/app.dart';

class SellOrBuy extends StatelessWidget {
  const SellOrBuy({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(color: AppColors.darkGrey),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Inter(
            text: "Price per SQFT",
            color: AppColors.lightGrey,
            fontSize: 20,
          ),
          Inter(text: "₹ 2,300.3/-", fontSize: 24),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                onPressed: () {},
                backgroundColor: AppColors.grey,
                text: "Sell",
                textColor: AppColors.lightGrey,
                width: width * 0.43,
              ),
              CustomElevatedButton(
                onPressed: () {},
                text: "Buy",
                width: width * 0.43,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
