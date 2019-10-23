import 'package:angular/angular.dart';

import 'src/hero.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: './app_component.html',
  styleUrls: ['./app_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [ClassProvider(HeroService)],
)
class AppComponent implements OnInit {
  final title = 'Tour of Heroes';

  List<Hero> heroes;

  Hero selected;

  final HeroService _heroService;

  AppComponent(this._heroService);

  void ngOnInit() => _getHeroes();
  // void ngOnInit() {
  //   _getHeroes();
  // }

  // void _getHeroes() {
  //   _heroService.getAll().then((heroes) => this.heroes = heroes);
  // }

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
    // heroes = await _heroService.getAllSlowly();
  }

  void onSelect(Hero hero) => selected = hero;
}
