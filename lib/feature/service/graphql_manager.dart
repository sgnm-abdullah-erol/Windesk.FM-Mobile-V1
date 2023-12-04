import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/global_providers/global_provider.dart';

class GraphQLManager {
  static final HttpLink _httpLink = HttpLink('http://localhost:3015/graphql');

  static final String _userToken = SharedManager().getString(SharedEnum.userToken) as String;

  static ValueNotifier<GraphQLClient> _client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: _httpLink,
      cache: GraphQLCache(),
    ),
  );

  static ValueNotifier<GraphQLClient> getClient(HttpLink link) {

  final HttpLink httpLink = HttpLink(
    'http://localhost:3015/graphql',
  );

_client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
    return _client;
  }

static ValueNotifier<GraphQLClient> getClientForMutation(BuildContext context) {

  final HttpLink httpLink = HttpLink(
    'http://localhost:3015/graphql'
  );
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${context.read<GlobalProvider>().globalUserToken}',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
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
