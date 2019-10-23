import 'package:angular/angular.dart';

import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: './hero_list_component.html',
  styleUrls: ['./hero_list_component.css'],
  directives: [coreDirectives, HeroComponent],
)
class HeroListComponent implements OnInit {
  final title = 'Tour of Heroes';

  List<Hero> heroes;

  Hero selected;

  final HeroService _heroService;

  HeroListComponent(this._heroService);

  void ngOnInit() => _getHeroes();
  // void ngOnInit() {
  //   _getHeroes();
  // }

  // void _getHeroes() {
  //   _heroService.getAll().then((heroes) => this.heroes = heroes);
  // }

  Future<void> _getHeroes() async {
    // heroes = await _heroService.getAll();
    heroes = await _heroService.getAllSlowly();
  }

  void onSelect(Hero hero) => selected = hero;
}
