import 'package:animated_widgets/animated_widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_login_button.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/splash/queries/splash_queries.dart';
import 'package:vm_fm_4/product/screens/splash/queries/splash_query_variables.dart';

import '../../../core/constants/paths/asset_paths.dart';
import '../../../core/route/app_route.gr.dart';
import '../../../feature/extensions/context_extension.dart';
import '../../../feature/global_providers/global_provider.dart';
import '../home/screens/work_order_support/graphql_result_handling.dart';
import 'splash_provider.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: Consumer<SplashProvider>(
        builder: (context, SplashProvider splashProvider, child) {
          splashProvider.setSplashFinished(context);
          // _navigate(context);
          return _versionControl(context, splashProvider.deviceVersion);
        },
      ),
    );
  }

  Widget _versionControl(BuildContext context, deviceVersion) {
    return GraphQLProvider(
      client: GraphQLManager.getClient(HttpLink(ServiceTools.url.generalGraphql_url)),
      child: Query(
        options: QueryOptions(
          document: gql(SplashQuery.versionControl),
          variables: SplashQueryVariables.getVersion(),
        ),
        builder: GraphqlResultHandling.withGenericHandling(
          context,
          (QueryResult result, {refetch, fetchMore}) {
            if (result.data == null && !result.hasException) {
              return const Text('asd');
            }
            if ('v1.0.4' == result.data?['versions'].first['versionNo'].toString()) {
              _navigate(context);
            }
            print(result.data?['versions'].first['versionNo'].toString());
            return 'v1.0.4' != result.data?['versions'].first['versionNo'].toString()
                ? WillPopScope(
                    child: Scaffold(
                      appBar: const CustomMainAppbar(title: ''),
                      body: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(LocaleKeys.UpdateApp).tr(),
                            CustomLoginButton(
                                title: LocaleKeys.Update,
                                onPressed: () {
                                  print('Navigate store page');
                                })
                          ],
                        ),
                      )),
                    ),
                    onWillPop: () async => false,
                  )
                : _splashScreenBody(context);
          },
        ),
      ),
    );
  }

  void _navigate(BuildContext context) {
    context.read<GlobalProvider>().setDeviceModel(context.read<SplashProvider>().getDeviceModel());
    context.read<GlobalProvider>().setDeviceVersion(context.read<SplashProvider>().getDeviceVersion());
    context.watch<SplashProvider>().isSplashFinished
        ? context.watch<SplashProvider>().isUserAlreadyLoggedIn
            ? context.router.replace(const HomeScreen())
            : context.router.replace(LoginScreen(userName: ''))
        : const SizedBox();
  }

  ScaleAnimatedWidget _splashScreenBody(BuildContext context) {
    return ScaleAnimatedWidget.tween(
      enabled: true,
      duration: const Duration(milliseconds: 3000),
      scaleDisabled: 0.5,
      scaleEnabled: 1,
      child: SizedBox(
        height: context.width / 1.5,
        width: context.width / 1.5,
        child: Image.asset(AssetPaths.logo),
      ),
    );
  }
}
