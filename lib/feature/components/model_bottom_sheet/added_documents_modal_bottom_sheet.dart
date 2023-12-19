import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/graphql_result_handling.dart';
import 'package:url_launcher/link.dart' as link;

class AddedDocumentsModalBottomSheet extends StatelessWidget {
  const AddedDocumentsModalBottomSheet({super.key, required this.taskId, required this.checkListValueId});

  final int taskId;
  final int checkListValueId;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClient(HttpLink(ServiceTools.url.generalGraphql_url)),
      child: Query(
        options: QueryOptions(
          document: gql(MaintenancesTaskQuery.getDocumentsQuery),
          variables: MaintenancesTaskVariableQueries.getDocumentValues(taskId, checkListValueId),
        ),
        builder: GraphqlResultHandling.withGenericHandling(
          context,
          (QueryResult result, {refetch, fetchMore}) {
            if (result.data == null && !result.hasException) {
              return Text(LocaleKeys.FetchScopeListError.tr(), style: Theme.of(context).textTheme.bodyMedium);
            }
            final resultDataQuery = result.data?['maintenances'].first['CheckListValue'].first['Document'];
            return SizedBox(
              height: context.height * 0.7,
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: resultDataQuery.length,
                    itemBuilder: (context, index) {
                      bool containPdf = resultDataQuery?[index]['url'].toString().contains('.pdf') ?? false;
                      return ListTile(
                        title: link.Link(
                          uri: Uri.parse(resultDataQuery?[index]['url'] ?? ''),
                          target: LinkTarget.blank,
                          builder: (BuildContext ctx, FollowLink? openLink) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(flex: 1, child: Text(resultDataQuery?[index]['name'] ?? '')),
                                Flexible(
                                  flex: 1,
                                  child: TextButton.icon(
                                    onPressed: openLink,
                                    label: containPdf ? const Text('Dökümana Git') : const Text('Fotoğrafa Git'),
                                    icon: const Icon(Icons.read_more),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        onTap: () {},
                      );
                    }),
              ),
            );
          },
        ),
      ),
    );
  }
}
