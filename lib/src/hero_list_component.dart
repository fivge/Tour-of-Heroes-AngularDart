import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'routes.dart';
import 'hero_service.dart';
import 'hero.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: './hero_list_component.html',
  styleUrls: ['./hero_list_component.css'],
  directives: [coreDirectives],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  List<Hero> heroes;
  Hero selected;

  final Router _router;
  final HeroService _heroService;

  HeroListComponent(this._heroService, this._router);

  void ngOnInit() => _getHeroes();

  // void _getHeroes() {
  //   _heroService.getAll().then((heroes) => this.heroes = heroes);
  // }

  Future<void> _getHeroes() async =>
      (heroes = await _heroService.getAllSlowly());

  void onSelect(Hero hero) => selected = hero;

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}
