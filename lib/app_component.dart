import 'package:angular/angular.dart';

import 'src/hero_list_component.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: './app_component.html',
  styleUrls: ['./app_component.css'],
  directives: [HeroListComponent],
  providers: [ClassProvider(HeroService)],
)
class AppComponent {
  final title = 'Tour of Heroes';
}
