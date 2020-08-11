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
          .declare('employer_id', ColumnType('serial'))
          .references('employers', 'id')
          .onDeleteCascade();
    });
  }

  @override
  down(Schema schema) {
    schema.drop('employees');
  }
}

class EmployerMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('employers', (table) {
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
    schema.drop('employers', cascade: true);
  }
}

class CompanyMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('companies', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('unique_id');
      table.varChar('first_name');
      table.varChar('last_name');
      table
          .declare('employer_id', ColumnType('serial'))
          .references('employers', 'id')
          .onDeleteCascade();
    });
  }

  @override
  down(Schema schema) {
    schema.drop('companies');
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
      'employer_id'
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

  Employee parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Employee(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        uniqueId: (row[3] as String),
        firstName: (row[4] as String),
        lastName: (row[5] as String),
        salary: double.tryParse(row[6].toString()));
    var elements = 8;
    if (row.length > elements && joinNames.contains('employers')) {
      model = model.copyWith(
          employer:
              EmployerQuery().parseRow(row.skip(elements).take(6).toList()));
      elements = elements + 6;
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  joinEmployer() {
    if (joinNames.contains('employers')) return null;
    leftJoin('employers', 'employer_id', 'id', additionalFields: const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name'
    ]);
    joinNames.add('employers');
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
        employerId = NumericSqlExpressionBuilder<int>(query, 'employer_id');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder uniqueId;

  final StringSqlExpressionBuilder firstName;

  final StringSqlExpressionBuilder lastName;

  final NumericSqlExpressionBuilder<double> salary;

  final NumericSqlExpressionBuilder<int> employerId;

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
      employerId
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
  int get employerId {
    return (values['employer_id'] as int);
  }

  set employerId(int value) => values['employer_id'] = value;
  void copyFrom(Employee model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    uniqueId = model.uniqueId;
    firstName = model.firstName;
    lastName = model.lastName;
    salary = model.salary;
    if (model.employer != null) {
      values['employer_id'] = model.employer.id;
    }
  }
}

class EmployerQuery extends Query<Employer, EmployerQueryWhere> {
  EmployerQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = EmployerQueryWhere(this);
  }

  @override
  final EmployerQueryValues values = EmployerQueryValues();

  EmployerQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'employers';
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
  EmployerQueryWhere get where {
    return _where;
  }

  @override
  EmployerQueryWhere newWhereClause() {
    return EmployerQueryWhere(this);
  }

  Employer parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Employer(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        uniqueId: (row[3] as String),
        firstName: (row[4] as String),
        lastName: (row[5] as String));
    var elements = 6;
    if (row.length > elements && joinNames.contains('employees')) {
      model = model.copyWith(
          employes: [
        EmployeeQuery().parseRow(row.skip(elements).take(8).toList())
      ].where((x) => x != null).toList());
      elements = elements + 8;
    }
    if (row.length > elements && joinNames.contains('companies')) {
      model = model.copyWith(
          company:
              CompanyQuery().parseRow(row.skip(elements).take(7).toList()));
      elements = elements + 7;
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  joinEmployes() {
    if (joinNames.contains('employees')) return null;
    leftJoin('employees', 'id', 'employer_id', additionalFields: const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name',
      'salary',
      'employer_id'
    ]);
    joinNames.add('employees');
  }

  joinCompany() {
    if (joinNames.contains('companies')) return null;
    leftJoin('companies', 'id', 'employer_id', additionalFields: const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name',
      'employer_id'
    ]);
    joinNames.add('companies');
  }

  @override
  get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<Employer>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                employes: (List<_Employee>.from(l.employes ?? [])
                      ..addAll(model.employes ?? []))
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
      return result.fold<List<Employer>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                employes: (List<_Employee>.from(l.employes ?? [])
                      ..addAll(model.employes ?? []))
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
      return result.fold<List<Employer>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                employes: (List<_Employee>.from(l.employes ?? [])
                      ..addAll(model.employes ?? []))
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

class EmployerQueryWhere extends QueryWhere {
  EmployerQueryWhere(EmployerQuery query)
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

class EmployerQueryValues extends MapQueryValues {
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
  void copyFrom(Employer model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    uniqueId = model.uniqueId;
    firstName = model.firstName;
    lastName = model.lastName;
  }
}

class CompanyQuery extends Query<Company, CompanyQueryWhere> {
  CompanyQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = CompanyQueryWhere(this);
  }

  @override
  final CompanyQueryValues values = CompanyQueryValues();

  CompanyQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'companies';
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
      'employer_id'
    ];
  }

  @override
  CompanyQueryWhere get where {
    return _where;
  }

  @override
  CompanyQueryWhere newWhereClause() {
    return CompanyQueryWhere(this);
  }

  Company parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Company(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        uniqueId: (row[3] as String),
        firstName: (row[4] as String),
        lastName: (row[5] as String));
    var elements = 7;
    if (row.length > elements && joinNames.contains('employers')) {
      model = model.copyWith(
          employer:
              EmployerQuery().parseRow(row.skip(elements).take(6).toList()));
      elements = elements + 6;
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  joinEmployer() {
    if (joinNames.contains('employers')) return null;
    leftJoin('employers', 'employer_id', 'id', additionalFields: const [
      'id',
      'created_at',
      'updated_at',
      'unique_id',
      'first_name',
      'last_name'
    ]);
    joinNames.add('employers');
  }
}

class CompanyQueryWhere extends QueryWhere {
  CompanyQueryWhere(CompanyQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        uniqueId = StringSqlExpressionBuilder(query, 'unique_id'),
        firstName = StringSqlExpressionBuilder(query, 'first_name'),
        lastName = StringSqlExpressionBuilder(query, 'last_name'),
        employerId = NumericSqlExpressionBuilder<int>(query, 'employer_id');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder uniqueId;

  final StringSqlExpressionBuilder firstName;

  final StringSqlExpressionBuilder lastName;

  final NumericSqlExpressionBuilder<int> employerId;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      uniqueId,
      firstName,
      lastName,
      employerId
    ];
  }
}

class CompanyQueryValues extends MapQueryValues {
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
  int get employerId {
    return (values['employer_id'] as int);
  }

  set employerId(int value) => values['employer_id'] = value;
  void copyFrom(Company model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    uniqueId = model.uniqueId;
    firstName = model.firstName;
    lastName = model.lastName;
    if (model.employer != null) {
      values['employer_id'] = model.employer.id;
    }
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
      this.employer});

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
  final _Employer employer;

  Employee copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String uniqueId,
      String firstName,
      String lastName,
      double salary,
      _Employer employer}) {
    return Employee(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uniqueId: uniqueId ?? this.uniqueId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        salary: salary ?? this.salary,
        employer: employer ?? this.employer);
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
        other.employer == employer;
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
      employer
    ]);
  }

  @override
  String toString() {
    return "Employee(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, uniqueId=$uniqueId, firstName=$firstName, lastName=$lastName, salary=$salary, employer=$employer)";
  }

  Map<String, dynamic> toJson() {
    return EmployeeSerializer.toMap(this);
  }
}

@generatedSerializable
class Employer extends _Employer {
  Employer(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.uniqueId,
      this.firstName,
      this.lastName,
      List<_Employee> employes,
      this.company})
      : this.employes = List.unmodifiable(employes ?? []);

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
  final List<_Employee> employes;

  @override
  final _Company company;

  Employer copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String uniqueId,
      String firstName,
      String lastName,
      List<_Employee> employes,
      _Company company}) {
    return Employer(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uniqueId: uniqueId ?? this.uniqueId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        employes: employes ?? this.employes,
        company: company ?? this.company);
  }

  bool operator ==(other) {
    return other is _Employer &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.uniqueId == uniqueId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        ListEquality<_Employee>(DefaultEquality<_Employee>())
            .equals(other.employes, employes) &&
        other.company == company;
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
      employes,
      company
    ]);
  }

  @override
  String toString() {
    return "Employer(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, uniqueId=$uniqueId, firstName=$firstName, lastName=$lastName, employes=$employes, company=$company)";
  }

  Map<String, dynamic> toJson() {
    return EmployerSerializer.toMap(this);
  }
}

@generatedSerializable
class Company extends _Company {
  Company(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.uniqueId,
      this.firstName,
      this.lastName,
      this.employer});

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
  final _Employer employer;

  Company copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String uniqueId,
      String firstName,
      String lastName,
      _Employer employer}) {
    return Company(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uniqueId: uniqueId ?? this.uniqueId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        employer: employer ?? this.employer);
  }

  bool operator ==(other) {
    return other is _Company &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.uniqueId == uniqueId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.employer == employer;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, createdAt, updatedAt, uniqueId, firstName, lastName, employer]);
  }

  @override
  String toString() {
    return "Company(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, uniqueId=$uniqueId, firstName=$firstName, lastName=$lastName, employer=$employer)";
  }

  Map<String, dynamic> toJson() {
    return CompanySerializer.toMap(this);
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
        employer: map['employer'] != null
            ? EmployerSerializer.fromMap(map['employer'] as Map)
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
      'employer': EmployerSerializer.toMap(model.employer)
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
    employer
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String uniqueId = 'unique_id';

  static const String firstName = 'first_name';

  static const String lastName = 'last_name';

  static const String salary = 'salary';

  static const String employer = 'employer';
}

const EmployerSerializer employerSerializer = EmployerSerializer();

class EmployerEncoder extends Converter<Employer, Map> {
  const EmployerEncoder();

  @override
  Map convert(Employer model) => EmployerSerializer.toMap(model);
}

class EmployerDecoder extends Converter<Map, Employer> {
  const EmployerDecoder();

  @override
  Employer convert(Map map) => EmployerSerializer.fromMap(map);
}

class EmployerSerializer extends Codec<Employer, Map> {
  const EmployerSerializer();

  @override
  get encoder => const EmployerEncoder();
  @override
  get decoder => const EmployerDecoder();
  static Employer fromMap(Map map) {
    return Employer(
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
        employes: map['employes'] is Iterable
            ? List.unmodifiable(((map['employes'] as Iterable).whereType<Map>())
                .map(EmployeeSerializer.fromMap))
            : null,
        company: map['company'] != null
            ? CompanySerializer.fromMap(map['company'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_Employer model) {
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
      'employes':
          model.employes?.map((m) => EmployeeSerializer.toMap(m))?.toList(),
      'company': CompanySerializer.toMap(model.company)
    };
  }
}

abstract class EmployerFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    uniqueId,
    firstName,
    lastName,
    employes,
    company
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String uniqueId = 'unique_id';

  static const String firstName = 'first_name';

  static const String lastName = 'last_name';

  static const String employes = 'employes';

  static const String company = 'company';
}

const CompanySerializer companySerializer = CompanySerializer();

class CompanyEncoder extends Converter<Company, Map> {
  const CompanyEncoder();

  @override
  Map convert(Company model) => CompanySerializer.toMap(model);
}

class CompanyDecoder extends Converter<Map, Company> {
  const CompanyDecoder();

  @override
  Company convert(Map map) => CompanySerializer.fromMap(map);
}

class CompanySerializer extends Codec<Company, Map> {
  const CompanySerializer();

  @override
  get encoder => const CompanyEncoder();
  @override
  get decoder => const CompanyDecoder();
  static Company fromMap(Map map) {
    return Company(
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
        employer: map['employer'] != null
            ? EmployerSerializer.fromMap(map['employer'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_Company model) {
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
      'employer': EmployerSerializer.toMap(model.employer)
    };
  }
}

abstract class CompanyFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    uniqueId,
    firstName,
    lastName,
    employer
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String uniqueId = 'unique_id';

  static const String firstName = 'first_name';

  static const String lastName = 'last_name';

  static const String employer = 'employer';
}
