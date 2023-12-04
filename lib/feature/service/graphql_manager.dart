import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/global_providers/global_provider.dart';

class GraphQLManager {
  static final HttpLink _httpLink = HttpLink(ServiceTools.url.graphql_url);

  static ValueNotifier<GraphQLClient> _client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: _httpLink,
      cache: GraphQLCache(),
    ),
  );

  static ValueNotifier<GraphQLClient> getClient(HttpLink link) {
    _client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
    return _client;
  }

  static ValueNotifier<GraphQLClient> getClientForMutation(BuildContext context) {
    final HttpLink httpLink = HttpLink(ServiceTools.url.graphql_url);
    final AuthLink authLink = AuthLink(getToken: () async => 'Bearer ${context.read<GlobalProvider>().globalUserToken}');

    final Link link = authLink.concat(httpLink);
    _client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
    return _client;
  }
}
