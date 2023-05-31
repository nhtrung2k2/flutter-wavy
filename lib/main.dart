import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/app_bloc.dart';
import 'package:wavy/bloc/confirm_the_schedule_bloc.dart';
import 'package:wavy/bloc/cost_list_bloc.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/employee_detail.dart';
import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/bloc/salary_bloc.dart';
import 'package:wavy/bloc/payment_bloc.dart';
import 'package:wavy/bloc/review_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';

import 'package:wavy/event/employees_event.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/model/schedule.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/employee_state.dart';
import 'package:wavy/view/pages/Input_salary.dart';

import 'package:wavy/view/pages/baby_sister_detail.dart';
import 'package:wavy/view/pages/confirm_the_schedule.dart';
import 'package:wavy/view/pages/cost_list.dart';
import 'package:wavy/view/pages/home.dart';
import 'package:wavy/view/pages/login.dart';
import 'package:wavy/view/pages/payment.dart';
import 'package:wavy/view/pages/register_baby_sister_id.dart';
import 'package:wavy/view/pages/register_baby_sister_infor.dart';
import 'package:wavy/view/pages/register_baby_sister_schedule.dart';
import 'package:wavy/view/pages/settings_profile_page.dart';
import 'package:wavy/view/pages/splash_page.dart';
import 'package:wavy/view/pages/BaseScreen.dart';
import 'package:wavy/view/pages/termination_contract.dart';

import 'bloc/employee_change_setting.dart';
import 'bloc/logout_bloc.dart';
import 'event/salary_event.dart';
import 'state/app_state.dart';
import 'state/employee_change_setting.dart';
import 'utils/routesName.dart';
import 'view/pages/basic_setting.dart';
import 'view/pages/register_basic_setting.dart';
import 'dart:developer' as devtool;
import 'package:wavy/view/pages/review.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.registerAll();

  runApp(MainApp());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceLocator.locator.get<AppBloc>(),
      child: Builder(builder: (context) {
        return MainApp();
      }),
    );
  }
}

final GlobalKey<NavigatorState> _rootNavitator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: "shell");

class MainApp extends StatelessWidget {
  late final GoRouter _router;

  MainApp({super.key}) {
    _router = GoRouter(
      navigatorKey: _rootNavitator,
      routes: [
        GoRoute(
            name: RoutesName.splashRoute.name,
            path: RoutesName.splashRoute.path,
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const SplashPage())),
        GoRoute(
          name: RoutesName.loginRoute.name,
          path: RoutesName.loginRoute.path,
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MultiBlocProvider(providers: [
                BlocProvider.value(
                  value: ServiceLocator.locator.get<LoginBloc>(),
                )
              ], child: const LoginPage())),
          redirect: getRouteName,
        ),
        ShellRoute(
            navigatorKey: _shellNavigator,
            builder: (context, state, child) => BaseScreen(child: child),
            routes: [
              GoRoute(
                  path: RoutesName.homeRoute.path,
                  name: RoutesName.homeRoute.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                          child: MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                            value: ServiceLocator.locator.get<EmployeeBloc>()
                              ..add(FetchEmployees()),
                          ),
                          BlocProvider.value(
                            value: ServiceLocator.locator
                                .get<EmployeeDetailBloc>(),
                          ),
                        ],
                        child: const HomePage(),
                      )),
                  routes: [
                    GoRoute(
                        path: RoutesName.registerbabysisterDetailRoute.path,
                        name: RoutesName.registerbabysisterDetailRoute.name,
                        pageBuilder: (context, state) => MaterialPage(
                              key: state.pageKey,
                              child: BlocProvider.value(
                                  value: ServiceLocator.locator
                                      .get<EmployeeDetailBloc>(),
                                  child: BabySisterDetail(
                                    babysisterId:
                                        state.queryParams['babysisterId'] ?? '',
                                    shiftId: int.parse(
                                        state.queryParams['shiftId'] ?? '0'),
                                  )),
                            ),
                        routes: [
                          GoRoute(
                            path: RoutesName.babysisterConfirmTheSchedule.path,
                            name: RoutesName.babysisterConfirmTheSchedule.name,
                            routes: [
                              GoRoute(
                                path: RoutesName.babysisterCostList.path,
                                name: RoutesName.babysisterCostList.name,
                                pageBuilder: (context, state) => MaterialPage(
                                    key: state.pageKey,
                                    child: BlocProvider.value(
                                      value: ServiceLocator.locator
                                          .get<CostListBloc>(),
                                      child: CostList(
                                          amountId: int.parse(
                                              state.queryParams['amountId'] ??
                                                  '0')),
                                    )),
                              ),
                            ],
                            pageBuilder: (context, state) => MaterialPage(
                                key: state.pageKey,
                                child: BlocProvider.value(
                                  value: ServiceLocator.locator
                                      .get<ConfirmTheScheduleBloc>(),
                                  child: ConfirmTheSchedule(
                                      babysisterId:
                                          state.queryParams['babysisterId'] ??
                                              '',
                                      shiftId: int.parse(
                                          state.queryParams['shiftId'] ?? '0')),
                                )),
                          ),
                          GoRoute(
                            path: RoutesName.babysisterPayment.path,
                            name: RoutesName.babysisterPayment.name,
                            pageBuilder: (context, state) => MaterialPage(
                                key: state.pageKey,
                                child: BlocProvider.value(
                                  value:
                                      ServiceLocator.locator.get<PaymentBloc>(),
                                  child: Payment(
                                    babysisterId:
                                        state.queryParams['babysisterId'] ?? '',
                                    shiftId: int.parse(
                                        state.queryParams['shiftId'] ?? '0'),
                                  ),
                                )),
                          ),
                          GoRoute(
                            path: RoutesName.basicSettingRoute.path,
                            name: RoutesName.basicSettingRoute.name,
                            pageBuilder: (context, state) => MaterialPage(
                                key: state.pageKey,
                                child: MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                        value: ServiceLocator.locator
                                            .get<EmployeeDetailBloc>()),
                                    BlocProvider(
                                      create: (context) => SalaryBloc(
                                          ServiceLocator.locator
                                              .get<EmployeesRepository>()),
                                    ),
                                    BlocProvider(
                                      create: (context) => ScheduleCubic(
                                          ServiceLocator.locator
                                              .get<EmployeesRepository>()),
                                    ),
                                    BlocProvider.value(
                                        value: ServiceLocator.locator
                                            .get<EmployeeChangeSettingBloc>()),
                                    BlocProvider.value(
                                        value: ServiceLocator.locator
                                            .get<EmployeeBloc>()),
                                  ],
                                  child: const BasicSettingPage(),
                                )),
                          ),
                          GoRoute(
                            path: RoutesName.babysisterReview.path,
                            name: RoutesName.babysisterReview.name,
                            pageBuilder: (context, state) => MaterialPage(
                                key: state.pageKey,
                                child: BlocProvider.value(
                                  value:
                                      ServiceLocator.locator.get<ReviewBloc>(),
                                  child: Review(
                                    babysistterId:
                                        state.queryParams['babysisterId'] ?? '',
                                    shiftId: int.parse(
                                        state.queryParams['shiftId'] ?? '0'),
                                  ),
                                )),
                          ),
                        ]),
                    GoRoute(
                      path: RoutesName.registerbabysisterIdRoute.path,
                      name: RoutesName.registerbabysisterIdRoute.name,
                      pageBuilder: (context, state) => MaterialPage(
                          key: state.pageKey,
                          child: BlocProvider.value(
                            value: ServiceLocator.locator
                                .get<EmployeeSearchBloc>(),
                            child: const RegisterBabySisterId(),
                          )),
                      routes: [
                        GoRoute(
                            path: RoutesName.registerbabysisterInforRoute.path,
                            name: RoutesName.registerbabysisterInforRoute.name,
                            pageBuilder: (context, state) => MaterialPage(
                                  key: state.pageKey,
                                  child: BlocProvider.value(
                                    value: ServiceLocator.locator
                                        .get<EmployeeSearchBloc>(),
                                    child: const RegisterBabySisterInforPage(),
                                  ),
                                ),
                            routes: [
                              GoRoute(
                                  path: RoutesName
                                      .registerbabysisterScheduleRoute.path,
                                  name: RoutesName
                                      .registerbabysisterScheduleRoute.name,
                                  pageBuilder: (context, state) => MaterialPage(
                                          child: BlocProvider.value(
                                        value: ServiceLocator.locator
                                            .get<ScheduleCubic>(),
                                        child:
                                            const RegisterBabySisterSchedulePage(),
                                      )),
                                  // routes: GoRoute(path: 'register_baby_sister_input_salary',
                                  // name:'register_baby_sister_input_salary',
                                  // pageBuilder: (context, state) => MaterialPage(child:

                                  // ),
                                  // )
                                  routes: [
                                    GoRoute(
                                        path: RoutesName
                                            .registerbabysisterInputSalaryRoute
                                            .path,
                                        name: RoutesName
                                            .registerbabysisterInputSalaryRoute
                                            .name,
                                        pageBuilder: (context, state) =>
                                            MaterialPage(
                                                child: BlocProvider.value(
                                              value: ServiceLocator.locator
                                                  .get<SalaryBloc>(),
                                              child: const InputSalaryPage(),
                                            )),
                                        routes: [
                                          GoRoute(
                                              path: RoutesName
                                                  .registerbabysisterBasicSettingsRoute
                                                  .path,
                                              name: RoutesName
                                                  .registerbabysisterBasicSettingsRoute
                                                  .name,
                                              pageBuilder: ((context, state) =>
                                                  MaterialPage(
                                                      child: MultiBlocProvider(
                                                    providers: [
                                                      BlocProvider.value(
                                                        value: ServiceLocator
                                                            .locator
                                                            .get<
                                                                EmployeeSearchBloc>(),
                                                      ),
                                                      BlocProvider.value(
                                                          value: ServiceLocator
                                                              .locator
                                                              .get<
                                                                  SalaryBloc>()),
                                                      BlocProvider.value(
                                                          value: ServiceLocator
                                                              .locator
                                                              .get<
                                                                  ScheduleCubic>()),
                                                      BlocProvider.value(
                                                          value: ServiceLocator
                                                              .locator
                                                              .get<
                                                                  EmployeeChangeSettingBloc>())
                                                    ],
                                                    child:
                                                        const ReigsterBasicSettingPage(),
                                                  ))))
                                        ])
                                  ])
                            ]),
                      ],
                    )
                  ]),
              GoRoute(
                  path: RoutesName.settingsRoute.path,
                  name: RoutesName.settingsRoute.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                          child: BlocProvider.value(
                        value: ServiceLocator.locator.get<LoginBloc>(),
                        child: const SettingsPage(),
                      )),
                  redirect: getRouteName)
            ])
      ],
      errorPageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(child: Text(state.error.toString())),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ServiceLocator.locator.allReady(),
        builder: (context, snapshot) {
          return BlocProvider.value(
              value: AppBloc(ServiceLocator.locator.get<LogoutBloc>(),
                  ServiceLocator.locator.get<LoginBloc>()),
              child: BlocListener<AppBloc, AppState>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  devtool.log("redirect");
                  devtool.log(state.status.name);
                  if (state.status == AuthenticationStatus.authenticated ||
                      state.status == AuthenticationStatus.unauthenticated) {
                    _router.refresh();
                  }
                },
                child: MaterialApp.router(
                  routerConfig: _router,
                ),
              ));
        });
  }
}

String? getRouteName(BuildContext context, state) {
  final appBlocState = ServiceLocator.locator.get<AppBloc>().state;
  devtool.log("getRouteName");
  devtool.log(appBlocState.status.name);
  final isInitial = appBlocState.status == AuthenticationStatus.unknow;

  final isLoggedIn = appBlocState.status == AuthenticationStatus.authenticated;
  final isLoggingIn = state.location == RoutesName.loginRoute.path;
  devtool.log("go_router");
  devtool.log(isLoggedIn.toString());
  if (!isInitial && !isLoggedIn && !isLoggingIn) {
    return RoutesName.loginRoute.path;
  }

  if (!isInitial && isLoggedIn && isLoggingIn) {
    return RoutesName.homeRoute.path;
  }

  return null;
}
