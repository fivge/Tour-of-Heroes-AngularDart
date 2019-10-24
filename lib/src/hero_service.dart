import 'hero.dart';
import 'mock_heroes.dart';

class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;

  Future<List<Hero>> getAllSlowly() =>
      Future.delayed(Duration(seconds: 0, milliseconds: 300), getAll);

  Future<Hero> get(int id) async =>
      (await getAll()).firstWhere((hero) => hero.id == id);

  Future<List<Hero>> getHeroes() async {
    return mockHeroes;
  }

  Future<List<Hero>> getHeroesSlowly() {
    return Future.delayed(Duration(seconds: 0, milliseconds: 300), getAll);
  }

  Future<Hero> getHero(int id) async {
    return (await getHeroes()).firstWhere((hero) => hero.id == id);
  }
}
