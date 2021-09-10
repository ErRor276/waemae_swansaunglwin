import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waemaeskeleton/constants/colors.dart';
import 'package:waemaeskeleton/models/job.dart';
import 'package:waemaeskeleton/providers/jobs_provider.dart';
import 'package:waemaeskeleton/widgets/filter_dialog.dart';
import 'package:waemaeskeleton/widgets/job_card.dart';

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobs = useProvider(filteredJobsProvider);
    final List<Job> emptyJobs = [];

    return Scaffold(
        body: SafeArea(
      /***************************************************
            Edit this part out to start on your assignments
        ***************************************************/
      // data fetching
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        color: BgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Text(
                "Jobs",
                style: TextStyle(
                  fontSize: 48,
                  color: Color(0xFFFF460C),
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FilterDialog();
                  },
                );
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
                    "FILTER SEARCH",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: FutureBuilder(
                future: jobs,
                initialData: emptyJobs,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Job>> projectSnap) {
                  if (projectSnap.connectionState == ConnectionState.none ||
                      projectSnap.data!.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: projectSnap.data?.length,
                    itemBuilder: (context, index) {
                      return JobCard(job: projectSnap.data![index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      /*****************************************************/
    ));
  }
}
