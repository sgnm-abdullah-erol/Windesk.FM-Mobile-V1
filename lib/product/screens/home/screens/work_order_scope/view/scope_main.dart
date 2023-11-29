import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/helpers.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/view/scope_bottom_sheet.dart';
import '../queries/scope/maintenances_task.dart' as queries;

class ScopeModalBottomSheet extends StatelessWidget {
  const ScopeModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: GraphQLManager.getClient(HttpLink('https://workorder-server.ifm.gov.tr/general-graphql')),
        child: Column(
          children: [
            Query(
              options: QueryOptions(
                document: gql(queries.maintenancesTask),
                variables: {
                  "where": {"isDeleted": false, "id": 2939}
                },
                //pollInterval: 10,
              ),
              builder: withGenericHandling((QueryResult result, {refetch, fetchMore}) {
                if (result.data == null && !result.hasException) {
                  return const Text(
                    'Loading has completed, but both data and errors are null. '
                    'This should never be the case – please open an issue',
                  );
                }
                MaintanenceModel maintanenceModel;
                maintanenceModel = MaintanenceModel.fromJson(result.data?['maintenances'][0]);
                return ScopeBottomSheet();
              }),
            )
          ],
        ));
  }
}
