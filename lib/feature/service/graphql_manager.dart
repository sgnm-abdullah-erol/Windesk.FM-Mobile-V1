import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLManager {
  static final HttpLink _httpLink = HttpLink('https://workorder-server.ifm.gov.tr/general-graphql');

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
}