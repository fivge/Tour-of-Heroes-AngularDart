import 'dart:convert';

import 'package:http/http.dart';

import 'hero.dart';
import 'mock_heroes.dart';

class HeroService {
  static const domain =
      'http://117.50.44.72:7300/mock/5db15aa332798327f525e29e';
  // static const _heroesUrl = '$domain/api/heroes';
  static const _heroesUrl = 'api/heroes'; // URL to web API
  static final _headers = {'Content-Type': 'application/json'};

  final Client _http;

  HeroService(this._http);

  Future<List<Hero>> getAll() async {
    try {
      final response = await _http.get(_heroesUrl);
      final heroes = (_extractData(response) as List)
          .map((json) => Hero.fromJson(json))
          .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Hero>> getAllSlowly() =>
      Future.delayed(Duration(seconds: 0, milliseconds: 300), getAll);

  Future<Hero> get(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Hero> create(String name) async {
    try {
      final response = await _http.post(_heroesUrl,
          headers: _headers, body: json.encode({'name': name}));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Hero> update(Hero hero) async {
    try {
      final url = '$_heroesUrl/${hero.id}';
      final response =
          await _http.put(url, headers: _headers, body: json.encode(hero));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      final url = '$_heroesUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Hero>> getHeroes() async {
    return mockHeroes;
  }

  Future<List<Hero>> getHeroesSlowly() {
    return Future.delayed(Duration(seconds: 0, milliseconds: 300), getAll);
  }

  Future<Hero> getHero(int id) async {
    return (await getHeroes()).firstWhere((hero) => hero.id == id);
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}
