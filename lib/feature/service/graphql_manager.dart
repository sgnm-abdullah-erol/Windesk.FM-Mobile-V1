import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/global_providers/global_provider.dart';

class GraphQLManager {
  static final HttpLink _httpLink = HttpLink('http://localhost:3015/graphql');

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
    final HttpLink httpLink = HttpLink('http://10.0.2.2:3015/graphql',defaultHeaders: {
      'Authorization' : 'Bearer ${context.read<GlobalProvider>().globalUserToken}',
      'user' : '{"id":"${context.read<GlobalProvider>().userId}"}'
    });

    _client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );
    return _client;
  }
}
