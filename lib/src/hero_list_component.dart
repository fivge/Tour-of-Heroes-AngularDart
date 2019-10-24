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

  Future<void> _getHeroes() async => (heroes = await _heroService.getAll());

  void onSelect(Hero hero) => selected = hero;

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));

  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) {
      return null;
    }
    heroes.add(await _heroService.create(name)); // FIXME: 此处逻辑待优化
    selected = null;
  }

  Future<void> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero); // FIXME: 此处逻辑待优化
    if (selected == hero) selected = null;
  }
}
