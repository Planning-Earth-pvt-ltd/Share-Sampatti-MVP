import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class NetWorth extends StatelessWidget {
  const NetWorth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Inter(
            text: "Net Worth",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.lightGrey,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Inter(
                text: "₹ 2,34,560",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColors.lightGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
