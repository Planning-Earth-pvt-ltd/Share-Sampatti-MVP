import 'package:share_sampatti_mvp/app/app.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key, required this.details, this.onTap, this.color});

  final List<String> details;
  final List<String>? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: details.length * 55,
      child: ListView.builder(
        itemCount: details.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            InkWell(
              onTap: onTap == null ? () {} : () => context.push(onTap![index]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Inter(
                        text: details[index],
                        color: color,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.lightGrey,
                    size: 13,
                  ),
                ],
              ).withPadSymmetric(10, 20),
            ),
            if (index != details.length - 1)
              Divider(
                thickness: 2,
                color: AppColors.dividerColor,
              ).withPadSymmetric(0, 20),
          ],
        ),
      ),
    );
  }
}
