import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/helpers.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/view/scope_bottom_sheet.dart';
import '../queries/scope/maintenances_task.dart' as queries;

@RoutePage()
class ScopeList extends StatelessWidget {
  const ScopeList({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppbar(
        title: Text('Scope List - $taskId'),
        returnBack: true,
      ),
      body: GraphQLProvider(
        client: GraphQLManager.getClient(HttpLink('http://localhost:3015/general-graphql')),
        child: Column(
          children: [
            Query(
              options: QueryOptions(
                document: gql(queries.maintenancesTask),
                variables: {
                  "where": {"isDeleted": false, "id": int.parse(taskId)}
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
                final MaintanenceModel maintanenceModel;
                maintanenceModel = MaintanenceModel.fromJson(result.data?['maintenances'][0]);
                return ScopeBottomSheet(maintanenceModel: maintanenceModel, taskId: taskId);
              }),
            )
          ],
        ),
      ),
    );
  }
}
