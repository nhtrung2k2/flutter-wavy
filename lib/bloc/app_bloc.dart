// import 'package:bloc/bloc.dart';
// import 'package:wavy/event/app_event.dart';
// import 'package:wavy/repository/user_repository.dart';
// import 'package:wavy/state/app_state.dart';

// class AppBloc extends Bloc<AppEvent, AppState> {
//   final UserRepository _userRepository;
//   AppBloc(UserRepository userRepository)
//       : _userRepository = userRepository,
//         super(AppState.unknow()) {
//     on<AppStarted>(_onAppStated);
//     on<AppLogoutRequested>(_onLogout);
//     on<AppUserChanged>(_onUserChanged);
//   }
//   Future<void> _onAppStated(
//     AppStarted event,
//     Emitter<AppState> emit,
//   ) async {
//     bool? checkauthenticated = await _userRepository.getIsLoggedIn();
//     if (checkauthenticated == null || checkauthenticated == false) {
//       emit(AppState.unauthenticated());
//     }
//     else{
//       emit(AppState.authenticated(user))
//     }
//   }
// }
