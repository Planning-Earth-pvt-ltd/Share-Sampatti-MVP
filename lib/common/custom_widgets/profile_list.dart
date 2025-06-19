import 'package:share_sampatti_mvp/app/app.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({
    super.key,
    required this.details,
    this.subDetails,
    this.onTap,
    this.color,
  });

  final List<String> details;
  final List<String>? subDetails;
  final List<Function()?>? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: subDetails == null ? details.length * 55 : details.length * 65,
      child: ListView.builder(
        itemCount: details.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Column(
          children: [
            InkWell(
              onTap: onTap == null ? () {} : onTap![index],
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
                      if (subDetails != null)
                        Inter(
                          text: subDetails![index],
                          color: AppColors.lightGrey,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
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
