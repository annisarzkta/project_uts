import 'package:uts_aplikasibergerak/constants.dart';
import 'package:uts_aplikasibergerak/screens/assignment_screen/data/assignment_data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// ignore: unused_import
import 'widgets/assignment_widgets.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({Key? key}) : super(key: key);
  static String routeName = 'AssignmentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Description'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: ListView.builder(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  itemCount: assignment.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                              color: kOtherColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: kTextLightColor,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor.withOpacity(0.4),
                                    borderRadius:
                                        BorderRadius.circular(kDefaultPadding),
                                  ),
                                  child: Center(
                                    child: Text(
                                      assignment[index].subjectName,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                                kHalfSizedBox,
                                Text(
                                  assignment[index].topicName1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: kTextBlackColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                                kHalfSizedBox,
                                Text(
                                  assignment[index].topicName2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: kTextBlackColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                                kHalfSizedBox,
                                Text(
                                  assignment[index].topicName3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: kTextBlackColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
