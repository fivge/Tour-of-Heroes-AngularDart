import 'package:angular_router/angular_router.dart';

import 'dashboard_component.template.dart' as dashboard_template;
import 'hero_list_component.template.dart' as hero_list_template;
import 'hero_component.template.dart' as hero_template;

const idParam = 'id';

class RoutePaths {
  static final dashboard = RoutePath(path: 'dashboard');
  static final heroes = RoutePath(path: 'heroes');
  static final hero = RoutePath(path: '${heroes.path}/:$idParam');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}

class Routes {
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  // define a route to the heroes component
  static final heroes = RouteDefinition(
    // The heroes RouteDefinition has the following named arguments:
    // routePath: The router matches this path against the URL in the browser address bar (heroes).
    // component: The (factory of the) component that will be activated when this route is navigated to (hero_list_template.HeroListComponentNgFactory).
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );

  static final hero = RouteDefinition(
    // The heroes RouteDefinition has the following named arguments:
    // routePath: The router matches this path against the URL in the browser address bar (heroes).
    // component: The (factory of the) component that will be activated when this route is navigated to (hero_list_template.HeroListComponentNgFactory).
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );

  // The Routes.all field is a list of route definitions.
  static final all = <RouteDefinition>[
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
    dashboard,
    heroes,
    hero,
  ];
}
