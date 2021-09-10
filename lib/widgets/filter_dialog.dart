import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waemaeskeleton/constants/colors.dart';
import 'package:waemaeskeleton/models/job.dart';
import 'package:waemaeskeleton/providers/jobs_provider.dart';

class FilterDialog extends HookWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filter = useProvider(filterProvider);
    final selected = useState(filter.state);
    print(filter.state);

    final days = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: days.length * 2,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? GestureDetector(
                        onTap: () {
                          if (selected.value.contains(days[index ~/ 2])) {
                            List tmp = [...selected.value];
                            tmp.remove(days[index ~/ 2]);
                            selected.value = [...tmp];
                          } else {
                            selected.value = [
                              ...selected.value,
                              days[index ~/ 2]
                            ];
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFECECEC),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 18.0,
                                width: 18.0,
                                decoration: BoxDecoration(
                                  color:
                                      selected.value.contains(days[index ~/ 2])
                                          ? Colors.black
                                          : Colors.white,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Text(
                                days[index ~/ 2],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF414040),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(height: 12.0);
              },
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                print("search");
                filter.state = [...selected.value];
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 72.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  gradient: ButtonGradientColor,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 2.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "SEARCH",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
