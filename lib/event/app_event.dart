import '../model/User.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class AppStarted extends AppEvent {
  const AppStarted();
}

class AppLogined extends AppEvent {
  const AppLogined();
}
