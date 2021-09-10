import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waemaeskeleton/services/graphql_service.dart';

final graphqlServiceProvider = Provider<GraphqlService>((ref) {
  return GraphqlService(
    link: HttpLink("https://9aa7-128-199-112-22.ngrok.io/"),
  );
});
