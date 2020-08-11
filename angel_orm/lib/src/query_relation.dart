import '../angel_orm.dart';

class QueryRelation {
  final String name;
  final int length;
  final Query query;

  QueryRelation(this.name, this.length, this.query);
}