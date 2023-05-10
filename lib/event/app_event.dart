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

class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

  final User user;
}
