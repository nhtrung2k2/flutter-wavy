import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/service/getit/service_locator.dart';

import 'package:wavy/view/pages/baby_sister_detail.dart';
import 'package:wavy/view/pages/home.dart';
import 'package:wavy/view/pages/login.dart';
import 'package:wavy/view/pages/register_baby_sister_id.dart';
import 'package:wavy/view/pages/register_baby_sister_infor.dart';
import 'package:wavy/view/pages/register_baby_sister_schedule.dart';
import 'package:wavy/view/pages/settings_page.dart';
import 'package:wavy/view/pages/splash_page.dart';
import 'package:wavy/view/pages/BaseScreen.dart';

void main() {
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
                child: BlocProvider(
                    lazy: false,
                    create: (context) => LoginBloc(),
                    child: const LoginPage()))),
        ShellRoute(
            navigatorKey: _shellNavigator,
            builder: (context, state, child) => BaseScreen(child: child),
            routes: [
              GoRoute(
                  path: '/home',
                  name: 'homePage',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: HomePage()),
                  routes: [
                    GoRoute(
                        path: 'register_baby_sister_detail',
                        name: 'register_baby_sister_detail',
                        pageBuilder: (context, state) => MaterialPage(
                            key: state.pageKey,
                            child: const BabySisterDetail())),
                    GoRoute(
                      path: 'register-babysister-id',
                      name: 'register-babysister-id',
                      pageBuilder: (context, state) => MaterialPage(
                          key: state.pageKey,
                          child: const RegisterBabySisterId()),
                      routes: [
                        GoRoute(
                            path: 'register_baby_sister_infor',
                            name: "register_baby_sister_infor",
                            pageBuilder: (context, state) => const MaterialPage(
                                child: RegisterBabySisterInforPage(
                                    employee: Employee(
                                        id: '1',
                                        name: "Nguyen Thi Nhan",
                                        age: 18,
                                        city: "Ho Chi Minh",
                                        avatar:
                                            "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"))),
                            routes: [
                              GoRoute(
                                  path: 'register_baby_sister_schedule',
                                  name: 'register_baby_sister_schedule',
                                  pageBuilder: (context, state) => MaterialPage(
                                          child: BlocProvider(
                                        create: (context) => ScheduleCubic(),
                                        child:
                                            const RegisterBabySisterSchedulePage(),
                                      )))
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
