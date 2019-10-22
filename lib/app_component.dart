import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'src/here.dart';
import 'src/mock_heroes.dart';

@Component(
  selector: 'my-app',
  templateUrl: './app_component.html',
  styleUrls: ['./app_component.css'],
  directives: [coreDirectives, formDirectives],
)
class AppComponent {
  final title = 'Tour of Heroes';

  // Hero hero = Hero(52788, 'Windstorm');
  List<Hero> heroes = mockHeroes;

  Hero selected = Hero(null, null);

  void onSelect(Hero hero) => selected = hero;
}
