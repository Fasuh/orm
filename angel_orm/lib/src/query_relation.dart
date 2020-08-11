import '../angel_orm.dart';

class QueryRelation<T> {
  final String name;
  final int length;
  final T Function<T>(List<dynamic>) query;

  QueryRelation(this.name, this.length, this.query);
}