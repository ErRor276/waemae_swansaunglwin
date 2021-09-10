import 'dart:convert';

import 'package:graphql/client.dart';
import 'package:waemaeskeleton/models/job.dart';

class GraphqlService {
  final HttpLink link;

  GraphqlService({required this.link});

  GraphQLClient get client => GraphQLClient(
        /// pass the store to the cache for persistence
        cache: GraphQLCache(store: InMemoryStore()),
        link: link,
      );

  Future<List<Job>> getJobs(GraphQLClient client) async {
    try {
      final String _query = """
    query jobs {
      jobs  {
        name
        location
        days
      }
    }
  """;
      final QueryOptions options = QueryOptions(document: gql(_query));
      final QueryResult response = await client.query(options);
      final result = List<Map<String, dynamic>>.from(response.data!["jobs"]);
      print(result);
      List<Job> jobs =
          result.map((job) => Job.fromJson(job)).toList(growable: false);
      return jobs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
