import 'package:uts_aplikasibergerak/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static String routeName = 'MyProfileScreen';

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar theme for tablet
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          InkWell(
            onTap: () {
              //send report to school management, in case if you want some changes to your profile
            },
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                  // children: [
                  //   const Icon(Icons.report_gmailerrorred_outlined),
                  //   kHalfWidthSizedBox,
                  //   Text(
                  //     'Report',
                  //     style: Theme.of(context).textTheme.titleSmall,
                  //   ),
                  // ],
                  ),
            ),
          ),
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: 100.w,
              height: SizerUtil.deviceType == DeviceType.tablet ? 19.h : 15.h,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: kBottomBorderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius:
                        SizerUtil.deviceType == DeviceType.tablet ? 12.w : 13.w,
                    backgroundColor: kSecondaryColor,
                    backgroundImage:
                        const AssetImage('assets/images/profile.jpg'),
                  ),
                  kWidthSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Annisa Rizkyta',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text('Sekretaris',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  )
                ],
              ),
            ),
            sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ProfileDetailRow(title: 'NIM', value: '1102200052'),
                ProfileDetailRow(title: 'Class of', value: '2020'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ProfileDetailRow(title: 'Position', value: 'Sekretaris 1'),
                ProfileDetailRow(
                    title: 'Date of Birth', value: '17 Januari 2002'),
              ],
            ),
            sizedBox,
            const ProfileDetailColumn(
              title: 'Email',
              value: 'annisa@gmail.com',
            ),
            const ProfileDetailColumn(
              title: 'Phone Number',
              value: '+8385828883',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: kTextBlackColor,
                      fontSize: SizerUtil.deviceType == DeviceType.tablet
                          ? 7.sp
                          : 9.sp,
                    ),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.bodySmall),
              kHalfSizedBox,
              SizedBox(
                width: 30.w,
                child: const Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 10.sp,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: kTextBlackColor,
                    fontSize:
                        SizerUtil.deviceType == DeviceType.tablet ? 7.sp : 9.sp,
                  ),
            ),
            kHalfSizedBox,
            Text(value, style: Theme.of(context).textTheme.bodySmall),
            kHalfSizedBox,
            SizedBox(
              width: 90.w,
              child: const Divider(
                thickness: 1.0,
              ),
            )
          ],
        ),
        Icon(
          Icons.lock_outline,
          size: 10.sp,
        ),
      ],
    );
  }
}
