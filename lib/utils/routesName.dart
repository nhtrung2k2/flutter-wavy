class RoutesName {
  static final Route splashRoute = Route('spashPage', '/');
  static final Route loginRoute = Route('loginPage', '/login');
  static final Route homeRoute = Route('homePage', '/home');
  static final Route registerbabysisterDetailRoute =
      Route('register_baby_sister_detail', 'register_baby_sister_detail');
  static final Route registerbabysisterIdRoute =
      Route('register-babysister-id', 'register-babysister-id');
  static final Route registerbabysisterInforRoute =
      Route('register_baby_sister_infor', 'register_baby_sister_infor');
  static final Route registerbabysisterScheduleRoute =
      Route('register_baby_sister_schedule', 'register_baby_sister_schedule');
  static final Route registerbabysisterInputSalaryRoute = Route(
      'register_baby_sister_input_salary', 'register_baby_sister_input_salary');

  static final Route registerbabysisterBasicSettingsRoute = Route(
      'register_baby_sister_basic_settings',
      'register_baby_sister_basic_settings');

  // detail
  static final Route basicSettingRoute =
      Route('basic_setting', 'basic_setting');
  static final Route cancelTheContractRoute =
      Route('cancel_the_contract', 'cancel_the_contract');
  static final Route babysisterConfirmTheSchedule =
      Route('babysister_confirm_the_schedule', 'babysister_confirm_the_schedule');
  static final Route babysisterPayment =
      Route('babysister_payment', 'babysister_payment');
  static final Route babysisterReview =
      Route('babysister_review', 'babysister_review');
  static final Route babysisterCostList =
      Route('babysister_cost_list', 'babysister_cost_list');

  //settings
  static final Route settingsRoute = Route('settingsPage', '/settings');
}

class Route {
  final String name;
  final String path;
  Route(this.name, this.path);
}
