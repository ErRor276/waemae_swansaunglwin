import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waemaeskeleton/models/job.dart';
import 'package:waemaeskeleton/providers/graphql_provider.dart';
import 'package:waemaeskeleton/services/graphql_service.dart';

final jobsProvider = Provider<Future<List<Job>>>((ref) async {
  final GraphqlService graphqlService = ref.watch(graphqlServiceProvider);
  final _client = graphqlService.client;
  final jobs = await graphqlService.getJobs(_client);
  return jobs;
});

final filterProvider = StateProvider((_) => []);

final filteredJobsProvider = Provider<Future<List<Job>>>((ref) async {
  final filter = ref.watch(filterProvider);
  final jobs = await ref.watch(jobsProvider);

  List<Job> filteredJobs = filter.state.isEmpty
      ? jobs
      : jobs.where((job) {
          for (var day in filter.state) {
            if (!job.days.contains(day)) {
              return false;
            }
          }
          return true;
        }).toList();

  return filteredJobs;
});
