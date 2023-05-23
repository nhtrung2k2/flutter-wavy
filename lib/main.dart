import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/confirm_the_schedule_bloc.dart';
import 'package:wavy/bloc/cost_list_bloc.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/bloc/salary_bloc.dart';
import 'package:wavy/bloc/payment_bloc.dart';
import 'package:wavy/bloc/review_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';
import 'package:wavy/service/getit/service_locator.dart';
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
import 'package:wavy/view/pages/review.dart';
import 'package:wavy/view/pages/settings_page.dart';
import 'package:wavy/view/pages/splash_page.dart';
import 'package:wavy/view/pages/BaseScreen.dart';

import 'view/pages/register_basic_setting.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.registerAll();
  runApp(MainApp());
}

final GlobalKey<NavigatorState> _rootNavitator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: "shell");

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _router = GoRouter(
      routes: [
        GoRoute(
            name: 'spashPage',
            path: '/',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const SplashPage())),
        GoRoute(
            name: 'loginPage',
            path: '/login',
            pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: BlocProvider.value(
                    value: ServiceLocator.locator.get<LoginBloc>(),
                    child: const LoginPage()))),
        ShellRoute(
            navigatorKey: _shellNavigator,
            builder: (context, state, child) => BaseScreen(child: child),
            routes: [
              GoRoute(
                  path: '/home',
                  name: 'homePage',
                  pageBuilder: (context, state) => NoTransitionPage(
                          child: BlocProvider.value(
                        value: ServiceLocator.locator.get<EmployeeBloc>(),
                        child: const HomePage(),
                      )),
                  routes: [
                    GoRoute(
                        path: 'register_baby_sister_detail',
                        name: 'register_baby_sister_detail',
                        pageBuilder: (context, state) => MaterialPage(
                            key: state.pageKey,
                            child: const BabySisterDetail()),
                        routes: [
                          GoRoute(
                              path: 'baby_sister_detail_confirm_schedule',
                              name: 'baby_sister_detail_confirm_schedule',
                              pageBuilder: (context, state) => MaterialPage(
                                  child: BlocProvider.value(
                                    value: ServiceLocator.locator.get<ConfirmTheScheduleBloc>(),
                                    child: ConfirmTheSchedule(
                                      babysisterId: state.queryParams['babysisterId'] ?? '',
                                      shiftId: int.parse(state.queryParams['shiftId'] ?? '-1'),
                                    ),
                                  )),
                              routes: [
                                GoRoute(
                                    path: 'baby_sister_cost_list',
                                    name: 'baby_sister_cost_list',
                                    pageBuilder: (context, state) => MaterialPage(
                                        child: BlocProvider.value(
                                          value: ServiceLocator.locator.get<CostListBloc>(),
                                          child: CostList(
                                            amountId: int.parse(state.queryParams['amountId'] ?? ''),
                                          ),
                                        ))),
                              ]
                          ),
                          GoRoute(
                              path: 'baby_sister_payment',
                              name: 'baby_sister_payment',
                              pageBuilder: (context, state) => MaterialPage(
                                  child: BlocProvider.value(
                                    value: ServiceLocator.locator.get<PaymentBloc>(),
                                    child: Payment(
                                      key: state.pageKey,
                                      shiftId: int.parse(state.queryParams['shift_id'] ?? ''),
                                    ),
                                  ))),
                          GoRoute(
                              path: 'baby_sister_review',
                              name: 'baby_sister_review',
                              pageBuilder: (context, state) => MaterialPage(
                                  child: BlocProvider.value(
                                    value: ServiceLocator.locator.get<ReviewBloc>(),
                                    child: Review(
                                      key: state.pageKey,
                                      shiftId: int.parse(state.queryParams['shift_id'] ?? '0'),
                                      babysistterId: state.queryParams['babysistter_id'] ?? '',
                                    ),
                                  ))),
                        ]
                    ),
                    GoRoute(
                      path: 'register-babysister-id',
                      name: 'register-babysister-id',
                      pageBuilder: (context, state) => MaterialPage(
                          key: state.pageKey,
                          child: BlocProvider.value(
                            value: ServiceLocator.locator
                                .get<EmployeeSearchBloc>(),
                            child: const RegisterBabySisterId(),
                          )),
                      routes: [
                        GoRoute(
                            path: 'register_baby_sister_infor',
                            name: "register_baby_sister_infor",
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
                                  path: 'register_baby_sister_schedule',
                                  name: 'register_baby_sister_schedule',
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
                                        path:
                                            'register_baby_sister_input_salary',
                                        name:
                                            'register_baby_sister_input_salary',
                                        pageBuilder: (context, state) =>
                                            MaterialPage(
                                                child: BlocProvider.value(
                                              value: ServiceLocator.locator
                                                  .get<SalaryBloc>(),
                                              child: const InputSalaryPage(),
                                            )),
                                        routes: [
                                          GoRoute(
                                              path:
                                                  'register_baby_sister_basic_settings',
                                              name:
                                                  'register_baby_sister_basic_settings',
                                              pageBuilder: ((context, state) =>
                                                  MaterialPage(
                                                      child: MultiBlocProvider(
                                                    providers: [
                                                      BlocProvider.value(
                                                          value: ServiceLocator
                                                              .locator
                                                              .get<
                                                                  SalaryBloc>()),
                                                      BlocProvider.value(
                                                          value: ServiceLocator
                                                              .locator
                                                              .get<
                                                                  ScheduleCubic>())
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
                path: '/settings',
                name: 'settingsPage',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsPage()),
              )
            ])
      ],
      errorPageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(child: Text(state.error.toString())),
          )),
      redirect: (context, state) {});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
