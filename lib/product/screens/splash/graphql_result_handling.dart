import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';

final class GraphqlResultHandling {
  static QueryBuilder withGenericHandling(BuildContext context, QueryBuilder builder) {
    return (result, {fetchMore, refetch}) {
      if (result.hasException) {
        return Text(result.exception.toString());
      }

      if (result.isLoading) {
        return SizedBox(
          height: context.height * 4 / 5,
          width: context.width,
          child: const Center(child: CustomLoadingIndicator()),
        );
      }

      return builder(result, fetchMore: fetchMore, refetch: refetch);
    };
  }
}
