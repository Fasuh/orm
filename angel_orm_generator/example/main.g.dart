// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class EmployeeMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('employees', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('unique_id');
      table.varChar('first_name');
      table.varChar('last_name');
      table.declare('salary', ColumnType('decimal'));
      table
          .declare('employeer_id', ColumnType('serial'))
          .references('employeers', 'id')
          .onDeleteCascade();
    });
  }

  @override
  down(Schema schema) {
    schema.drop('employees');
  }
}

class EmployeerMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('employeers', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('unique_id');
      table.varChar('first_name');
      table.varChar('last_name');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('employeers', cascade: true);
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class EmployeeQuery extends Query<Employee, EmployeeQueryWhere> {
  EmployeeQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = EmployeeQueryWhere(this);
  }

  @override
  final EmployeeQueryValues values = EmployeeQueryValues();

  EmployeeQueryWhere _where;

  @override
  get casts {
    return {'salary': 'text'};
  }

  @override
  get tableName {
    return 'employees';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name',
      'salary',
      'employeer_id'
    ];
  }

  @override
  EmployeeQueryWhere get where {
    return _where;
  }

  @override
  EmployeeQueryWhere newWhereClause() {
    return EmployeeQueryWhere(this);
  }

  static Employee parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Employee(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        uniqueId: (row[3] as String),
        firstName: (row[4] as String),
        lastName: (row[5] as String),
        salary: double.tryParse(row[6].toString()));
    if (row.length > 8) {
      model = model.copyWith(
          employeer: EmployeerQuery.parseRow(row.skip(8).take(6).toList()));
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  employeerJoin() {
    join('employeers', 'employeer_id', 'id', additionalFields: const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name'
    ]);
  }
}

class EmployeeQueryWhere extends QueryWhere {
  EmployeeQueryWhere(EmployeeQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        uniqueId = StringSqlExpressionBuilder(query, 'unique_id'),
        firstName = StringSqlExpressionBuilder(query, 'first_name'),
        lastName = StringSqlExpressionBuilder(query, 'last_name'),
        salary = NumericSqlExpressionBuilder<double>(query, 'salary'),
        employeerId = NumericSqlExpressionBuilder<int>(query, 'employeer_id');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder uniqueId;

  final StringSqlExpressionBuilder firstName;

  final StringSqlExpressionBuilder lastName;

  final NumericSqlExpressionBuilder<double> salary;

  final NumericSqlExpressionBuilder<int> employeerId;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      uniqueId,
      firstName,
      lastName,
      salary,
      employeerId
    ];
  }
}

class EmployeeQueryValues extends MapQueryValues {
  @override
  get casts {
    return {'salary': 'decimal'};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  String get uniqueId {
    return (values['unique_id'] as String);
  }

  set uniqueId(String value) => values['unique_id'] = value;
  String get firstName {
    return (values['first_name'] as String);
  }

  set firstName(String value) => values['first_name'] = value;
  String get lastName {
    return (values['last_name'] as String);
  }

  set lastName(String value) => values['last_name'] = value;
  double get salary {
    return double.tryParse((values['salary'] as String));
  }

  set salary(double value) => values['salary'] = value.toString();
  int get employeerId {
    return (values['employeer_id'] as int);
  }

  set employeerId(int value) => values['employeer_id'] = value;
  void copyFrom(Employee model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    uniqueId = model.uniqueId;
    firstName = model.firstName;
    lastName = model.lastName;
    salary = model.salary;
    if (model.employeer != null) {
      values['employeer_id'] = model.employeer.id;
    }
  }
}

class EmployeerQuery extends Query<Employeer, EmployeerQueryWhere> {
  EmployeerQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = EmployeerQueryWhere(this);
  }

  @override
  final EmployeerQueryValues values = EmployeerQueryValues();

  EmployeerQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'employeers';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name'
    ];
  }

  @override
  EmployeerQueryWhere get where {
    return _where;
  }

  @override
  EmployeerQueryWhere newWhereClause() {
    return EmployeerQueryWhere(this);
  }

  static Employeer parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Employeer(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        uniqueId: (row[3] as String),
        firstName: (row[4] as String),
        lastName: (row[5] as String));
    if (row.length > 6) {
      model = model.copyWith(
          employees: [EmployeeQuery.parseRow(row.skip(6).take(8).toList())]
              .where((x) => x != null)
              .toList());
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  employeesJoin() {
    join('employees', 'id', 'employeer_id', additionalFields: const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name',
      'salary',
      'employeer_id'
    ]);
  }

  @override
  get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<Employeer>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                employees: (List<_Employee>.from(l.employees ?? [])
                      ..addAll(model.employees ?? []))
                    .fold([], (out, model) {
              var idx = out.indexWhere((m) => m.id == model.id);

              if (idx == -1) {
                return out..add(model);
              }
              return out;
            }));
        }
      });
    });
  }

  @override
  update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<Employeer>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                employees: (List<_Employee>.from(l.employees ?? [])
                      ..addAll(model.employees ?? []))
                    .fold([], (out, model) {
              var idx = out.indexWhere((m) => m.id == model.id);

              if (idx == -1) {
                return out..add(model);
              }
              return out;
            }));
        }
      });
    });
  }

  @override
  delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<Employeer>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                employees: (List<_Employee>.from(l.employees ?? [])
                      ..addAll(model.employees ?? []))
                    .fold([], (out, model) {
              var idx = out.indexWhere((m) => m.id == model.id);

              if (idx == -1) {
                return out..add(model);
              }
              return out;
            }));
        }
      });
    });
  }
}

class EmployeerQueryWhere extends QueryWhere {
  EmployeerQueryWhere(EmployeerQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        uniqueId = StringSqlExpressionBuilder(query, 'unique_id'),
        firstName = StringSqlExpressionBuilder(query, 'first_name'),
        lastName = StringSqlExpressionBuilder(query, 'last_name');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder uniqueId;

  final StringSqlExpressionBuilder firstName;

  final StringSqlExpressionBuilder lastName;

  @override
  get expressionBuilders {
    return [id, createdAt, updatedAt, uniqueId, firstName, lastName];
  }
}

class EmployeerQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  String get uniqueId {
    return (values['unique_id'] as String);
  }

  set uniqueId(String value) => values['unique_id'] = value;
  String get firstName {
    return (values['first_name'] as String);
  }

  set firstName(String value) => values['first_name'] = value;
  String get lastName {
    return (values['last_name'] as String);
  }

  set lastName(String value) => values['last_name'] = value;
  void copyFrom(Employeer model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    uniqueId = model.uniqueId;
    firstName = model.firstName;
    lastName = model.lastName;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Employee extends _Employee {
  Employee(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.uniqueId,
      this.firstName,
      this.lastName,
      this.salary,
      this.employeer});

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  String uniqueId;

  @override
  final String firstName;

  @override
  final String lastName;

  @override
  final double salary;

  @override
  final _Employeer employeer;

  Employee copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String uniqueId,
      String firstName,
      String lastName,
      double salary,
      _Employeer employeer}) {
    return Employee(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uniqueId: uniqueId ?? this.uniqueId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        salary: salary ?? this.salary,
        employeer: employeer ?? this.employeer);
  }

  bool operator ==(other) {
    return other is _Employee &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.uniqueId == uniqueId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.salary == salary &&
        other.employeer == employeer;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      uniqueId,
      firstName,
      lastName,
      salary,
      employeer
    ]);
  }

  @override
  String toString() {
    return "Employee(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, uniqueId=$uniqueId, firstName=$firstName, lastName=$lastName, salary=$salary, employeer=$employeer)";
  }

  Map<String, dynamic> toJson() {
    return EmployeeSerializer.toMap(this);
  }
}

@generatedSerializable
class Employeer extends _Employeer {
  Employeer(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.uniqueId,
      this.firstName,
      this.lastName,
      List<_Employee> employees})
      : this.employees = List.unmodifiable(employees ?? []);

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  String uniqueId;

  @override
  final String firstName;

  @override
  final String lastName;

  @override
  final List<_Employee> employees;

  Employeer copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String uniqueId,
      String firstName,
      String lastName,
      List<_Employee> employees}) {
    return Employeer(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uniqueId: uniqueId ?? this.uniqueId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        employees: employees ?? this.employees);
  }

  bool operator ==(other) {
    return other is _Employeer &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.uniqueId == uniqueId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        ListEquality<_Employee>(DefaultEquality<_Employee>())
            .equals(other.employees, employees);
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, createdAt, updatedAt, uniqueId, firstName, lastName, employees]);
  }

  @override
  String toString() {
    return "Employeer(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, uniqueId=$uniqueId, firstName=$firstName, lastName=$lastName, employees=$employees)";
  }

  Map<String, dynamic> toJson() {
    return EmployeerSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const EmployeeSerializer employeeSerializer = EmployeeSerializer();

class EmployeeEncoder extends Converter<Employee, Map> {
  const EmployeeEncoder();

  @override
  Map convert(Employee model) => EmployeeSerializer.toMap(model);
}

class EmployeeDecoder extends Converter<Map, Employee> {
  const EmployeeDecoder();

  @override
  Employee convert(Map map) => EmployeeSerializer.fromMap(map);
}

class EmployeeSerializer extends Codec<Employee, Map> {
  const EmployeeSerializer();

  @override
  get encoder => const EmployeeEncoder();
  @override
  get decoder => const EmployeeDecoder();
  static Employee fromMap(Map map) {
    return Employee(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        uniqueId: map['unique_id'] as String,
        firstName: map['first_name'] as String,
        lastName: map['last_name'] as String,
        salary: map['salary'] as double,
        employeer: map['employeer'] != null
            ? EmployeerSerializer.fromMap(map['employeer'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_Employee model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'unique_id': model.uniqueId,
      'first_name': model.firstName,
      'last_name': model.lastName,
      'salary': model.salary,
      'employeer': EmployeerSerializer.toMap(model.employeer)
    };
  }
}

abstract class EmployeeFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    uniqueId,
    firstName,
    lastName,
    salary,
    employeer
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String uniqueId = 'unique_id';

  static const String firstName = 'first_name';

  static const String lastName = 'last_name';

  static const String salary = 'salary';

  static const String employeer = 'employeer';
}

const EmployeerSerializer employeerSerializer = EmployeerSerializer();

class EmployeerEncoder extends Converter<Employeer, Map> {
  const EmployeerEncoder();

  @override
  Map convert(Employeer model) => EmployeerSerializer.toMap(model);
}

class EmployeerDecoder extends Converter<Map, Employeer> {
  const EmployeerDecoder();

  @override
  Employeer convert(Map map) => EmployeerSerializer.fromMap(map);
}

class EmployeerSerializer extends Codec<Employeer, Map> {
  const EmployeerSerializer();

  @override
  get encoder => const EmployeerEncoder();
  @override
  get decoder => const EmployeerDecoder();
  static Employeer fromMap(Map map) {
    return Employeer(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        uniqueId: map['unique_id'] as String,
        firstName: map['first_name'] as String,
        lastName: map['last_name'] as String,
        employees: map['employees'] is Iterable
            ? List.unmodifiable(
                ((map['employees'] as Iterable).whereType<Map>())
                    .map(EmployeeSerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_Employeer model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'unique_id': model.uniqueId,
      'first_name': model.firstName,
      'last_name': model.lastName,
      'employees':
          model.employees?.map((m) => EmployeeSerializer.toMap(m))?.toList()
    };
  }
}

abstract class EmployeerFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    uniqueId,
    firstName,
    lastName,
    employees
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String uniqueId = 'unique_id';

  static const String firstName = 'first_name';

  static const String lastName = 'last_name';

  static const String employees = 'employees';
}
