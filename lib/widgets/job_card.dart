import 'package:flutter/material.dart';
import 'package:waemaeskeleton/constants/colors.dart';
import 'package:waemaeskeleton/models/job.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            job.name,
            style: TextStyle(
              fontSize: 20,
              color: SecondaryTextColor,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(3.0),
            color: Color(0xFFFFF4F4),
            child: Text(
              job.location,
              style: TextStyle(
                fontSize: 18,
                color: PrimaryTextColor,
              ),
            ),
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Working Days :",
                style: TextStyle(
                  color: PrimaryTextColor,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(width: 5.0),
              getDays(days: job.days, smallScreen: width < 360),
            ],
          ),
        ],
      ),
    );
  }

  Widget getDays({required days, required bool smallScreen}) {
    String daysStr = "";
    int divider = smallScreen ? 2 : 3;
    for (var i = 0; i < days.length; i++) {
      daysStr += "${days[i]}${i == days.length - 1 ? "" : ", "}";
      daysStr += (i + 1) % divider == 0 ? "\n" : "";
    }
    return Text(
      daysStr,
      maxLines: 3,
      style: TextStyle(
        color: SecondaryTextColor,
        fontSize: 14.0,
      ),
    );
  }
}
