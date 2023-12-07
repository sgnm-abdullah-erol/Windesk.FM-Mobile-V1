import '../schemas/schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$MaintenancesTask {
  factory Variables$Query$MaintenancesTask({Input$MaintenanceWhere? where}) =>
      Variables$Query$MaintenancesTask._({
        if (where != null) r'where': where,
      });

  Variables$Query$MaintenancesTask._(this._$data);

  factory Variables$Query$MaintenancesTask.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = l$where == null
          ? null
          : Input$MaintenanceWhere.fromJson((l$where as Map<String, dynamic>));
    }
    return Variables$Query$MaintenancesTask._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$MaintenanceWhere? get where =>
      (_$data['where'] as Input$MaintenanceWhere?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$MaintenancesTask<Variables$Query$MaintenancesTask>
      get copyWith => CopyWith$Variables$Query$MaintenancesTask(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$MaintenancesTask) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$where = where;
    return Object.hashAll([_$data.containsKey('where') ? l$where : const {}]);
  }
}

abstract class CopyWith$Variables$Query$MaintenancesTask<TRes> {
  factory CopyWith$Variables$Query$MaintenancesTask(
    Variables$Query$MaintenancesTask instance,
    TRes Function(Variables$Query$MaintenancesTask) then,
  ) = _CopyWithImpl$Variables$Query$MaintenancesTask;

  factory CopyWith$Variables$Query$MaintenancesTask.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MaintenancesTask;

  TRes call({Input$MaintenanceWhere? where});
}

class _CopyWithImpl$Variables$Query$MaintenancesTask<TRes>
    implements CopyWith$Variables$Query$MaintenancesTask<TRes> {
  _CopyWithImpl$Variables$Query$MaintenancesTask(
    this._instance,
    this._then,
  );

  final Variables$Query$MaintenancesTask _instance;

  final TRes Function(Variables$Query$MaintenancesTask) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? where = _undefined}) =>
      _then(Variables$Query$MaintenancesTask._({
        ..._instance._$data,
        if (where != _undefined) 'where': (where as Input$MaintenanceWhere?),
      }));
}

class _CopyWithStubImpl$Variables$Query$MaintenancesTask<TRes>
    implements CopyWith$Variables$Query$MaintenancesTask<TRes> {
  _CopyWithStubImpl$Variables$Query$MaintenancesTask(this._res);

  TRes _res;

  call({Input$MaintenanceWhere? where}) => _res;
}

class Query$MaintenancesTask {
  Query$MaintenancesTask({
    required this.maintenances,
    this.$__typename = 'Query',
  });

  factory Query$MaintenancesTask.fromJson(Map<String, dynamic> json) {
    final l$maintenances = json['maintenances'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask(
      maintenances: (l$maintenances as List<dynamic>)
          .map((e) => Query$MaintenancesTask$maintenances.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MaintenancesTask$maintenances> maintenances;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$maintenances = maintenances;
    _resultData['maintenances'] =
        l$maintenances.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$maintenances = maintenances;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$maintenances.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MaintenancesTask) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$maintenances = maintenances;
    final lOther$maintenances = other.maintenances;
    if (l$maintenances.length != lOther$maintenances.length) {
      return false;
    }
    for (int i = 0; i < l$maintenances.length; i++) {
      final l$maintenances$entry = l$maintenances[i];
      final lOther$maintenances$entry = lOther$maintenances[i];
      if (l$maintenances$entry != lOther$maintenances$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask on Query$MaintenancesTask {
  CopyWith$Query$MaintenancesTask<Query$MaintenancesTask> get copyWith =>
      CopyWith$Query$MaintenancesTask(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MaintenancesTask<TRes> {
  factory CopyWith$Query$MaintenancesTask(
    Query$MaintenancesTask instance,
    TRes Function(Query$MaintenancesTask) then,
  ) = _CopyWithImpl$Query$MaintenancesTask;

  factory CopyWith$Query$MaintenancesTask.stub(TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask;

  TRes call({
    List<Query$MaintenancesTask$maintenances>? maintenances,
    String? $__typename,
  });
  TRes maintenances(
      Iterable<Query$MaintenancesTask$maintenances> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances<
                      Query$MaintenancesTask$maintenances>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask<TRes>
    implements CopyWith$Query$MaintenancesTask<TRes> {
  _CopyWithImpl$Query$MaintenancesTask(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask _instance;

  final TRes Function(Query$MaintenancesTask) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? maintenances = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MaintenancesTask(
        maintenances: maintenances == _undefined || maintenances == null
            ? _instance.maintenances
            : (maintenances as List<Query$MaintenancesTask$maintenances>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes maintenances(
          Iterable<Query$MaintenancesTask$maintenances> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances<
                          Query$MaintenancesTask$maintenances>>)
              _fn) =>
      call(
          maintenances: _fn(_instance.maintenances
              .map((e) => CopyWith$Query$MaintenancesTask$maintenances(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask<TRes>
    implements CopyWith$Query$MaintenancesTask<TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask(this._res);

  TRes _res;

  call({
    List<Query$MaintenancesTask$maintenances>? maintenances,
    String? $__typename,
  }) =>
      _res;

  maintenances(_fn) => _res;
}

const documentNodeQueryMaintenancesTask = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MaintenancesTask'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'where')),
        type: NamedTypeNode(
          name: NameNode(value: 'MaintenanceWhere'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'maintenances'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: VariableNode(name: NameNode(value: 'where')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'MaintenancePlan'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'Components'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'willBeAppliedToComponents'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'componentOriginal'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'FacilityStructures'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'willBeAppliedToFacilityStructures'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'facilityStructureOriginal'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'Systems'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'willBeAppliedToSystem'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'SystemOriginal'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'ScheduledBy'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'parentSchedule'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'CheckList'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'hasRegulations'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'name'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'description'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: 'includesOfCheckItems'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'name'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'inputType'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'labels'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'photoRequired'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'description'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'isRequired'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'documentRequired'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: '__typename'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$MaintenancesTask$maintenances {
  Query$MaintenancesTask$maintenances({
    this.id,
    required this.MaintenancePlan,
    required this.ScheduledBy,
    this.$__typename = 'Maintenance',
  });

  factory Query$MaintenancesTask$maintenances.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$MaintenancePlan = json['MaintenancePlan'];
    final l$ScheduledBy = json['ScheduledBy'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances(
      id: (l$id as int?),
      MaintenancePlan: (l$MaintenancePlan as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$MaintenancePlan.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      ScheduledBy: (l$ScheduledBy as List<dynamic>)
          .map((e) => Query$MaintenancesTask$maintenances$ScheduledBy.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int? id;

  final List<Query$MaintenancesTask$maintenances$MaintenancePlan>
      MaintenancePlan;

  final List<Query$MaintenancesTask$maintenances$ScheduledBy> ScheduledBy;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$MaintenancePlan = MaintenancePlan;
    _resultData['MaintenancePlan'] =
        l$MaintenancePlan.map((e) => e.toJson()).toList();
    final l$ScheduledBy = ScheduledBy;
    _resultData['ScheduledBy'] = l$ScheduledBy.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$MaintenancePlan = MaintenancePlan;
    final l$ScheduledBy = ScheduledBy;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$MaintenancePlan.map((v) => v)),
      Object.hashAll(l$ScheduledBy.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MaintenancesTask$maintenances) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$MaintenancePlan = MaintenancePlan;
    final lOther$MaintenancePlan = other.MaintenancePlan;
    if (l$MaintenancePlan.length != lOther$MaintenancePlan.length) {
      return false;
    }
    for (int i = 0; i < l$MaintenancePlan.length; i++) {
      final l$MaintenancePlan$entry = l$MaintenancePlan[i];
      final lOther$MaintenancePlan$entry = lOther$MaintenancePlan[i];
      if (l$MaintenancePlan$entry != lOther$MaintenancePlan$entry) {
        return false;
      }
    }
    final l$ScheduledBy = ScheduledBy;
    final lOther$ScheduledBy = other.ScheduledBy;
    if (l$ScheduledBy.length != lOther$ScheduledBy.length) {
      return false;
    }
    for (int i = 0; i < l$ScheduledBy.length; i++) {
      final l$ScheduledBy$entry = l$ScheduledBy[i];
      final lOther$ScheduledBy$entry = lOther$ScheduledBy[i];
      if (l$ScheduledBy$entry != lOther$ScheduledBy$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances
    on Query$MaintenancesTask$maintenances {
  CopyWith$Query$MaintenancesTask$maintenances<
          Query$MaintenancesTask$maintenances>
      get copyWith => CopyWith$Query$MaintenancesTask$maintenances(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances<TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances(
    Query$MaintenancesTask$maintenances instance,
    TRes Function(Query$MaintenancesTask$maintenances) then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances;

  factory CopyWith$Query$MaintenancesTask$maintenances.stub(TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances;

  TRes call({
    int? id,
    List<Query$MaintenancesTask$maintenances$MaintenancePlan>? MaintenancePlan,
    List<Query$MaintenancesTask$maintenances$ScheduledBy>? ScheduledBy,
    String? $__typename,
  });
  TRes MaintenancePlan(
      Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan<
                      Query$MaintenancesTask$maintenances$MaintenancePlan>>)
          _fn);
  TRes ScheduledBy(
      Iterable<Query$MaintenancesTask$maintenances$ScheduledBy> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy<
                      Query$MaintenancesTask$maintenances$ScheduledBy>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances<TRes>
    implements CopyWith$Query$MaintenancesTask$maintenances<TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances _instance;

  final TRes Function(Query$MaintenancesTask$maintenances) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? MaintenancePlan = _undefined,
    Object? ScheduledBy = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MaintenancesTask$maintenances(
        id: id == _undefined ? _instance.id : (id as int?),
        MaintenancePlan: MaintenancePlan == _undefined ||
                MaintenancePlan == null
            ? _instance.MaintenancePlan
            : (MaintenancePlan
                as List<Query$MaintenancesTask$maintenances$MaintenancePlan>),
        ScheduledBy: ScheduledBy == _undefined || ScheduledBy == null
            ? _instance.ScheduledBy
            : (ScheduledBy
                as List<Query$MaintenancesTask$maintenances$ScheduledBy>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes MaintenancePlan(
          Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan<
                          Query$MaintenancesTask$maintenances$MaintenancePlan>>)
              _fn) =>
      call(
          MaintenancePlan: _fn(_instance.MaintenancePlan.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan(
                e,
                (i) => i,
              ))).toList());

  TRes ScheduledBy(
          Iterable<Query$MaintenancesTask$maintenances$ScheduledBy> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy<
                          Query$MaintenancesTask$maintenances$ScheduledBy>>)
              _fn) =>
      call(
          ScheduledBy: _fn(_instance.ScheduledBy.map(
              (e) => CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances<TRes>
    implements CopyWith$Query$MaintenancesTask$maintenances<TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances(this._res);

  TRes _res;

  call({
    int? id,
    List<Query$MaintenancesTask$maintenances$MaintenancePlan>? MaintenancePlan,
    List<Query$MaintenancesTask$maintenances$ScheduledBy>? ScheduledBy,
    String? $__typename,
  }) =>
      _res;

  MaintenancePlan(_fn) => _res;

  ScheduledBy(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$MaintenancePlan {
  Query$MaintenancesTask$maintenances$MaintenancePlan({
    required this.Components,
    required this.FacilityStructures,
    required this.Systems,
    this.$__typename = 'MaintenanceMain',
  });

  factory Query$MaintenancesTask$maintenances$MaintenancePlan.fromJson(
      Map<String, dynamic> json) {
    final l$Components = json['Components'];
    final l$FacilityStructures = json['FacilityStructures'];
    final l$Systems = json['Systems'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$MaintenancePlan(
      Components: (l$Components as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$MaintenancePlan$Components
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      FacilityStructures: (l$FacilityStructures as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      Systems: (l$Systems as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$MaintenancePlan$Systems
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MaintenancesTask$maintenances$MaintenancePlan$Components>
      Components;

  final List<
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures>
      FacilityStructures;

  final List<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems>
      Systems;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$Components = Components;
    _resultData['Components'] = l$Components.map((e) => e.toJson()).toList();
    final l$FacilityStructures = FacilityStructures;
    _resultData['FacilityStructures'] =
        l$FacilityStructures.map((e) => e.toJson()).toList();
    final l$Systems = Systems;
    _resultData['Systems'] = l$Systems.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$Components = Components;
    final l$FacilityStructures = FacilityStructures;
    final l$Systems = Systems;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$Components.map((v) => v)),
      Object.hashAll(l$FacilityStructures.map((v) => v)),
      Object.hashAll(l$Systems.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MaintenancesTask$maintenances$MaintenancePlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$Components = Components;
    final lOther$Components = other.Components;
    if (l$Components.length != lOther$Components.length) {
      return false;
    }
    for (int i = 0; i < l$Components.length; i++) {
      final l$Components$entry = l$Components[i];
      final lOther$Components$entry = lOther$Components[i];
      if (l$Components$entry != lOther$Components$entry) {
        return false;
      }
    }
    final l$FacilityStructures = FacilityStructures;
    final lOther$FacilityStructures = other.FacilityStructures;
    if (l$FacilityStructures.length != lOther$FacilityStructures.length) {
      return false;
    }
    for (int i = 0; i < l$FacilityStructures.length; i++) {
      final l$FacilityStructures$entry = l$FacilityStructures[i];
      final lOther$FacilityStructures$entry = lOther$FacilityStructures[i];
      if (l$FacilityStructures$entry != lOther$FacilityStructures$entry) {
        return false;
      }
    }
    final l$Systems = Systems;
    final lOther$Systems = other.Systems;
    if (l$Systems.length != lOther$Systems.length) {
      return false;
    }
    for (int i = 0; i < l$Systems.length; i++) {
      final l$Systems$entry = l$Systems[i];
      final lOther$Systems$entry = lOther$Systems[i];
      if (l$Systems$entry != lOther$Systems$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$MaintenancePlan
    on Query$MaintenancesTask$maintenances$MaintenancePlan {
  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan<
          Query$MaintenancesTask$maintenances$MaintenancePlan>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan(
    Query$MaintenancesTask$maintenances$MaintenancePlan instance,
    TRes Function(Query$MaintenancesTask$maintenances$MaintenancePlan) then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan;

  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan;

  TRes call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Components>?
        Components,
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures>?
        FacilityStructures,
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems>? Systems,
    String? $__typename,
  });
  TRes Components(
      Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Components> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
                      Query$MaintenancesTask$maintenances$MaintenancePlan$Components>>)
          _fn);
  TRes FacilityStructures(
      Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
                      Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures>>)
          _fn);
  TRes Systems(
      Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
                      Query$MaintenancesTask$maintenances$MaintenancePlan$Systems>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan<TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan<TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$MaintenancePlan _instance;

  final TRes Function(Query$MaintenancesTask$maintenances$MaintenancePlan)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? Components = _undefined,
    Object? FacilityStructures = _undefined,
    Object? Systems = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MaintenancesTask$maintenances$MaintenancePlan(
        Components: Components == _undefined || Components == null
            ? _instance.Components
            : (Components as List<
                Query$MaintenancesTask$maintenances$MaintenancePlan$Components>),
        FacilityStructures: FacilityStructures == _undefined ||
                FacilityStructures == null
            ? _instance.FacilityStructures
            : (FacilityStructures as List<
                Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures>),
        Systems: Systems == _undefined || Systems == null
            ? _instance.Systems
            : (Systems as List<
                Query$MaintenancesTask$maintenances$MaintenancePlan$Systems>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes Components(
          Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Components> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
                          Query$MaintenancesTask$maintenances$MaintenancePlan$Components>>)
              _fn) =>
      call(
          Components: _fn(_instance.Components.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components(
                e,
                (i) => i,
              ))).toList());

  TRes FacilityStructures(
          Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
                          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures>>)
              _fn) =>
      call(
          FacilityStructures: _fn(_instance.FacilityStructures.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures(
                e,
                (i) => i,
              ))).toList());

  TRes Systems(
          Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
                          Query$MaintenancesTask$maintenances$MaintenancePlan$Systems>>)
              _fn) =>
      call(
          Systems: _fn(_instance.Systems.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan<TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan(
      this._res);

  TRes _res;

  call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Components>?
        Components,
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures>?
        FacilityStructures,
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems>? Systems,
    String? $__typename,
  }) =>
      _res;

  Components(_fn) => _res;

  FacilityStructures(_fn) => _res;

  Systems(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$MaintenancePlan$Components {
  Query$MaintenancesTask$maintenances$MaintenancePlan$Components({
    required this.willBeAppliedToComponents,
    this.$__typename = 'Components',
  });

  factory Query$MaintenancesTask$maintenances$MaintenancePlan$Components.fromJson(
      Map<String, dynamic> json) {
    final l$willBeAppliedToComponents = json['willBeAppliedToComponents'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$MaintenancePlan$Components(
      willBeAppliedToComponents: (l$willBeAppliedToComponents as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents>
      willBeAppliedToComponents;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$willBeAppliedToComponents = willBeAppliedToComponents;
    _resultData['willBeAppliedToComponents'] =
        l$willBeAppliedToComponents.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$willBeAppliedToComponents = willBeAppliedToComponents;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$willBeAppliedToComponents.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$MaintenancePlan$Components) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$willBeAppliedToComponents = willBeAppliedToComponents;
    final lOther$willBeAppliedToComponents = other.willBeAppliedToComponents;
    if (l$willBeAppliedToComponents.length !=
        lOther$willBeAppliedToComponents.length) {
      return false;
    }
    for (int i = 0; i < l$willBeAppliedToComponents.length; i++) {
      final l$willBeAppliedToComponents$entry = l$willBeAppliedToComponents[i];
      final lOther$willBeAppliedToComponents$entry =
          lOther$willBeAppliedToComponents[i];
      if (l$willBeAppliedToComponents$entry !=
          lOther$willBeAppliedToComponents$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$MaintenancePlan$Components
    on Query$MaintenancesTask$maintenances$MaintenancePlan$Components {
  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
          Query$MaintenancesTask$maintenances$MaintenancePlan$Components>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components(
    Query$MaintenancesTask$maintenances$MaintenancePlan$Components instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$MaintenancePlan$Components)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components;

  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components;

  TRes call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents>?
        willBeAppliedToComponents,
    String? $__typename,
  });
  TRes willBeAppliedToComponents(
      Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
                      Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$MaintenancePlan$Components
      _instance;

  final TRes Function(
      Query$MaintenancesTask$maintenances$MaintenancePlan$Components) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? willBeAppliedToComponents = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MaintenancesTask$maintenances$MaintenancePlan$Components(
        willBeAppliedToComponents: willBeAppliedToComponents == _undefined ||
                willBeAppliedToComponents == null
            ? _instance.willBeAppliedToComponents
            : (willBeAppliedToComponents as List<
                Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes willBeAppliedToComponents(
          Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
                          Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents>>)
              _fn) =>
      call(
          willBeAppliedToComponents: _fn(_instance.willBeAppliedToComponents
              .map((e) =>
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components(
      this._res);

  TRes _res;

  call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents>?
        willBeAppliedToComponents,
    String? $__typename,
  }) =>
      _res;

  willBeAppliedToComponents(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents {
  Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents({
    this.componentOriginal,
    this.$__typename = 'Component',
  });

  factory Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents.fromJson(
      Map<String, dynamic> json) {
    final l$componentOriginal = json['componentOriginal'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents(
      componentOriginal: (l$componentOriginal as Map<String, dynamic>?),
      $__typename: (l$$__typename as String),
    );
  }

  final Map<String, dynamic>? componentOriginal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$componentOriginal = componentOriginal;
    _resultData['componentOriginal'] = l$componentOriginal;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$componentOriginal = componentOriginal;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$componentOriginal,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$componentOriginal = componentOriginal;
    final lOther$componentOriginal = other.componentOriginal;
    if (l$componentOriginal != lOther$componentOriginal) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents
    on Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents {
  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
          Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents(
    Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents
        instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents;

  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents;

  TRes call({
    Map<String, dynamic>? componentOriginal,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents
      _instance;

  final TRes Function(
          Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? componentOriginal = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents(
        componentOriginal: componentOriginal == _undefined
            ? _instance.componentOriginal
            : (componentOriginal as Map<String, dynamic>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Components$willBeAppliedToComponents(
      this._res);

  TRes _res;

  call({
    Map<String, dynamic>? componentOriginal,
    String? $__typename,
  }) =>
      _res;
}

class Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures {
  Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures({
    required this.willBeAppliedToFacilityStructures,
    this.$__typename = 'FacilityStructures',
  });

  factory Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures.fromJson(
      Map<String, dynamic> json) {
    final l$willBeAppliedToFacilityStructures =
        json['willBeAppliedToFacilityStructures'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures(
      willBeAppliedToFacilityStructures: (l$willBeAppliedToFacilityStructures
              as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures>
      willBeAppliedToFacilityStructures;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$willBeAppliedToFacilityStructures =
        willBeAppliedToFacilityStructures;
    _resultData['willBeAppliedToFacilityStructures'] =
        l$willBeAppliedToFacilityStructures.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$willBeAppliedToFacilityStructures =
        willBeAppliedToFacilityStructures;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$willBeAppliedToFacilityStructures.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$willBeAppliedToFacilityStructures =
        willBeAppliedToFacilityStructures;
    final lOther$willBeAppliedToFacilityStructures =
        other.willBeAppliedToFacilityStructures;
    if (l$willBeAppliedToFacilityStructures.length !=
        lOther$willBeAppliedToFacilityStructures.length) {
      return false;
    }
    for (int i = 0; i < l$willBeAppliedToFacilityStructures.length; i++) {
      final l$willBeAppliedToFacilityStructures$entry =
          l$willBeAppliedToFacilityStructures[i];
      final lOther$willBeAppliedToFacilityStructures$entry =
          lOther$willBeAppliedToFacilityStructures[i];
      if (l$willBeAppliedToFacilityStructures$entry !=
          lOther$willBeAppliedToFacilityStructures$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures
    on Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures {
  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures(
    Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures
        instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures;

  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures;

  TRes call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures>?
        willBeAppliedToFacilityStructures,
    String? $__typename,
  });
  TRes willBeAppliedToFacilityStructures(
      Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
                      Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures
      _instance;

  final TRes Function(
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? willBeAppliedToFacilityStructures = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures(
        willBeAppliedToFacilityStructures: willBeAppliedToFacilityStructures ==
                    _undefined ||
                willBeAppliedToFacilityStructures == null
            ? _instance.willBeAppliedToFacilityStructures
            : (willBeAppliedToFacilityStructures as List<
                Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes willBeAppliedToFacilityStructures(
          Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
                          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures>>)
              _fn) =>
      call(
          willBeAppliedToFacilityStructures: _fn(
              _instance.willBeAppliedToFacilityStructures.map((e) =>
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures(
      this._res);

  TRes _res;

  call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures>?
        willBeAppliedToFacilityStructures,
    String? $__typename,
  }) =>
      _res;

  willBeAppliedToFacilityStructures(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures {
  Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures({
    this.facilityStructureOriginal,
    this.$__typename = 'FacilityStructure',
  });

  factory Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures.fromJson(
      Map<String, dynamic> json) {
    final l$facilityStructureOriginal = json['facilityStructureOriginal'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures(
      facilityStructureOriginal:
          (l$facilityStructureOriginal as Map<String, dynamic>?),
      $__typename: (l$$__typename as String),
    );
  }

  final Map<String, dynamic>? facilityStructureOriginal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$facilityStructureOriginal = facilityStructureOriginal;
    _resultData['facilityStructureOriginal'] = l$facilityStructureOriginal;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$facilityStructureOriginal = facilityStructureOriginal;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$facilityStructureOriginal,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$facilityStructureOriginal = facilityStructureOriginal;
    final lOther$facilityStructureOriginal = other.facilityStructureOriginal;
    if (l$facilityStructureOriginal != lOther$facilityStructureOriginal) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures
    on Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures {
  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures(
    Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures
        instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures;

  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures;

  TRes call({
    Map<String, dynamic>? facilityStructureOriginal,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures
      _instance;

  final TRes Function(
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? facilityStructureOriginal = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures(
        facilityStructureOriginal: facilityStructureOriginal == _undefined
            ? _instance.facilityStructureOriginal
            : (facilityStructureOriginal as Map<String, dynamic>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$FacilityStructures$willBeAppliedToFacilityStructures(
      this._res);

  TRes _res;

  call({
    Map<String, dynamic>? facilityStructureOriginal,
    String? $__typename,
  }) =>
      _res;
}

class Query$MaintenancesTask$maintenances$MaintenancePlan$Systems {
  Query$MaintenancesTask$maintenances$MaintenancePlan$Systems({
    required this.willBeAppliedToSystem,
    this.$__typename = 'Systems',
  });

  factory Query$MaintenancesTask$maintenances$MaintenancePlan$Systems.fromJson(
      Map<String, dynamic> json) {
    final l$willBeAppliedToSystem = json['willBeAppliedToSystem'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$MaintenancePlan$Systems(
      willBeAppliedToSystem: (l$willBeAppliedToSystem as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem>
      willBeAppliedToSystem;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$willBeAppliedToSystem = willBeAppliedToSystem;
    _resultData['willBeAppliedToSystem'] =
        l$willBeAppliedToSystem.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$willBeAppliedToSystem = willBeAppliedToSystem;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$willBeAppliedToSystem.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$MaintenancePlan$Systems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$willBeAppliedToSystem = willBeAppliedToSystem;
    final lOther$willBeAppliedToSystem = other.willBeAppliedToSystem;
    if (l$willBeAppliedToSystem.length != lOther$willBeAppliedToSystem.length) {
      return false;
    }
    for (int i = 0; i < l$willBeAppliedToSystem.length; i++) {
      final l$willBeAppliedToSystem$entry = l$willBeAppliedToSystem[i];
      final lOther$willBeAppliedToSystem$entry =
          lOther$willBeAppliedToSystem[i];
      if (l$willBeAppliedToSystem$entry != lOther$willBeAppliedToSystem$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems
    on Query$MaintenancesTask$maintenances$MaintenancePlan$Systems {
  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
          Query$MaintenancesTask$maintenances$MaintenancePlan$Systems>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems(
    Query$MaintenancesTask$maintenances$MaintenancePlan$Systems instance,
    TRes Function(Query$MaintenancesTask$maintenances$MaintenancePlan$Systems)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems;

  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems;

  TRes call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem>?
        willBeAppliedToSystem,
    String? $__typename,
  });
  TRes willBeAppliedToSystem(
      Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
                      Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$MaintenancePlan$Systems _instance;

  final TRes Function(
      Query$MaintenancesTask$maintenances$MaintenancePlan$Systems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? willBeAppliedToSystem = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MaintenancesTask$maintenances$MaintenancePlan$Systems(
        willBeAppliedToSystem: willBeAppliedToSystem == _undefined ||
                willBeAppliedToSystem == null
            ? _instance.willBeAppliedToSystem
            : (willBeAppliedToSystem as List<
                Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes willBeAppliedToSystem(
          Iterable<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
                          Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem>>)
              _fn) =>
      call(
          willBeAppliedToSystem: _fn(_instance.willBeAppliedToSystem.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems(
      this._res);

  TRes _res;

  call({
    List<Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem>?
        willBeAppliedToSystem,
    String? $__typename,
  }) =>
      _res;

  willBeAppliedToSystem(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem {
  Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem({
    this.SystemOriginal,
    this.$__typename = 'System',
  });

  factory Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem.fromJson(
      Map<String, dynamic> json) {
    final l$SystemOriginal = json['SystemOriginal'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem(
      SystemOriginal: (l$SystemOriginal as Map<String, dynamic>?),
      $__typename: (l$$__typename as String),
    );
  }

  final Map<String, dynamic>? SystemOriginal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$SystemOriginal = SystemOriginal;
    _resultData['SystemOriginal'] = l$SystemOriginal;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$SystemOriginal = SystemOriginal;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$SystemOriginal,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$SystemOriginal = SystemOriginal;
    final lOther$SystemOriginal = other.SystemOriginal;
    if (l$SystemOriginal != lOther$SystemOriginal) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem
    on Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem {
  CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
          Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem(
    Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem
        instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem;

  factory CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem;

  TRes call({
    Map<String, dynamic>? SystemOriginal,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem
      _instance;

  final TRes Function(
          Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? SystemOriginal = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem(
        SystemOriginal: SystemOriginal == _undefined
            ? _instance.SystemOriginal
            : (SystemOriginal as Map<String, dynamic>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$MaintenancePlan$Systems$willBeAppliedToSystem(
      this._res);

  TRes _res;

  call({
    Map<String, dynamic>? SystemOriginal,
    String? $__typename,
  }) =>
      _res;
}

class Query$MaintenancesTask$maintenances$ScheduledBy {
  Query$MaintenancesTask$maintenances$ScheduledBy({
    required this.parentSchedule,
    this.$__typename = 'Schedule',
  });

  factory Query$MaintenancesTask$maintenances$ScheduledBy.fromJson(
      Map<String, dynamic> json) {
    final l$parentSchedule = json['parentSchedule'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$ScheduledBy(
      parentSchedule: (l$parentSchedule as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule>
      parentSchedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$parentSchedule = parentSchedule;
    _resultData['parentSchedule'] =
        l$parentSchedule.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$parentSchedule = parentSchedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$parentSchedule.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MaintenancesTask$maintenances$ScheduledBy) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$parentSchedule = parentSchedule;
    final lOther$parentSchedule = other.parentSchedule;
    if (l$parentSchedule.length != lOther$parentSchedule.length) {
      return false;
    }
    for (int i = 0; i < l$parentSchedule.length; i++) {
      final l$parentSchedule$entry = l$parentSchedule[i];
      final lOther$parentSchedule$entry = lOther$parentSchedule[i];
      if (l$parentSchedule$entry != lOther$parentSchedule$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$ScheduledBy
    on Query$MaintenancesTask$maintenances$ScheduledBy {
  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy<
          Query$MaintenancesTask$maintenances$ScheduledBy>
      get copyWith => CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy<TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy(
    Query$MaintenancesTask$maintenances$ScheduledBy instance,
    TRes Function(Query$MaintenancesTask$maintenances$ScheduledBy) then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy;

  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy;

  TRes call({
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule>?
        parentSchedule,
    String? $__typename,
  });
  TRes parentSchedule(
      Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
                      Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy<TRes>
    implements CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy<TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$ScheduledBy _instance;

  final TRes Function(Query$MaintenancesTask$maintenances$ScheduledBy) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? parentSchedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MaintenancesTask$maintenances$ScheduledBy(
        parentSchedule: parentSchedule == _undefined || parentSchedule == null
            ? _instance.parentSchedule
            : (parentSchedule as List<
                Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes parentSchedule(
          Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
                          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule>>)
              _fn) =>
      call(
          parentSchedule: _fn(_instance.parentSchedule.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy<TRes>
    implements CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy<TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy(this._res);

  TRes _res;

  call({
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule>?
        parentSchedule,
    String? $__typename,
  }) =>
      _res;

  parentSchedule(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule {
  Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule({
    required this.CheckList,
    this.$__typename = 'Schedule',
  });

  factory Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule.fromJson(
      Map<String, dynamic> json) {
    final l$CheckList = json['CheckList'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule(
      CheckList: (l$CheckList as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList>
      CheckList;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$CheckList = CheckList;
    _resultData['CheckList'] = l$CheckList.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$CheckList = CheckList;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$CheckList.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$CheckList = CheckList;
    final lOther$CheckList = other.CheckList;
    if (l$CheckList.length != lOther$CheckList.length) {
      return false;
    }
    for (int i = 0; i < l$CheckList.length; i++) {
      final l$CheckList$entry = l$CheckList[i];
      final lOther$CheckList$entry = lOther$CheckList[i];
      if (l$CheckList$entry != lOther$CheckList$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule
    on Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule {
  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule(
    Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule;

  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule;

  TRes call({
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList>?
        CheckList,
    String? $__typename,
  });
  TRes CheckList(
      Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
                      Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule
      _instance;

  final TRes Function(
      Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? CheckList = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule(
        CheckList: CheckList == _undefined || CheckList == null
            ? _instance.CheckList
            : (CheckList as List<
                Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes CheckList(
          Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
                          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList>>)
              _fn) =>
      call(
          CheckList: _fn(_instance.CheckList.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule(
      this._res);

  TRes _res;

  call({
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList>?
        CheckList,
    String? $__typename,
  }) =>
      _res;

  CheckList(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList {
  Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList({
    required this.name,
    this.id,
    required this.hasRegulations,
    required this.includesOfCheckItems,
    this.$__typename = 'CheckList',
  });

  factory Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$id = json['id'];
    final l$hasRegulations = json['hasRegulations'];
    final l$includesOfCheckItems = json['includesOfCheckItems'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList(
      name: (l$name as String),
      id: (l$id as int?),
      hasRegulations: (l$hasRegulations as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      includesOfCheckItems: (l$includesOfCheckItems as List<dynamic>)
          .map((e) =>
              Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final int? id;

  final List<
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations>
      hasRegulations;

  final List<
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems>
      includesOfCheckItems;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$hasRegulations = hasRegulations;
    _resultData['hasRegulations'] =
        l$hasRegulations.map((e) => e.toJson()).toList();
    final l$includesOfCheckItems = includesOfCheckItems;
    _resultData['includesOfCheckItems'] =
        l$includesOfCheckItems.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$id = id;
    final l$hasRegulations = hasRegulations;
    final l$includesOfCheckItems = includesOfCheckItems;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$id,
      Object.hashAll(l$hasRegulations.map((v) => v)),
      Object.hashAll(l$includesOfCheckItems.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$hasRegulations = hasRegulations;
    final lOther$hasRegulations = other.hasRegulations;
    if (l$hasRegulations.length != lOther$hasRegulations.length) {
      return false;
    }
    for (int i = 0; i < l$hasRegulations.length; i++) {
      final l$hasRegulations$entry = l$hasRegulations[i];
      final lOther$hasRegulations$entry = lOther$hasRegulations[i];
      if (l$hasRegulations$entry != lOther$hasRegulations$entry) {
        return false;
      }
    }
    final l$includesOfCheckItems = includesOfCheckItems;
    final lOther$includesOfCheckItems = other.includesOfCheckItems;
    if (l$includesOfCheckItems.length != lOther$includesOfCheckItems.length) {
      return false;
    }
    for (int i = 0; i < l$includesOfCheckItems.length; i++) {
      final l$includesOfCheckItems$entry = l$includesOfCheckItems[i];
      final lOther$includesOfCheckItems$entry = lOther$includesOfCheckItems[i];
      if (l$includesOfCheckItems$entry != lOther$includesOfCheckItems$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList
    on Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList {
  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList(
    Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList
        instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList;

  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList;

  TRes call({
    String? name,
    int? id,
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations>?
        hasRegulations,
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems>?
        includesOfCheckItems,
    String? $__typename,
  });
  TRes hasRegulations(
      Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
                      Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations>>)
          _fn);
  TRes includesOfCheckItems(
      Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems> Function(
              Iterable<
                  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
                      Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems>>)
          _fn);
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList
      _instance;

  final TRes Function(
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? id = _undefined,
    Object? hasRegulations = _undefined,
    Object? includesOfCheckItems = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        id: id == _undefined ? _instance.id : (id as int?),
        hasRegulations: hasRegulations == _undefined || hasRegulations == null
            ? _instance.hasRegulations
            : (hasRegulations as List<
                Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations>),
        includesOfCheckItems: includesOfCheckItems == _undefined ||
                includesOfCheckItems == null
            ? _instance.includesOfCheckItems
            : (includesOfCheckItems as List<
                Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes hasRegulations(
          Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
                          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations>>)
              _fn) =>
      call(
          hasRegulations: _fn(_instance.hasRegulations.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations(
                e,
                (i) => i,
              ))).toList());

  TRes includesOfCheckItems(
          Iterable<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems> Function(
                  Iterable<
                      CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
                          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems>>)
              _fn) =>
      call(
          includesOfCheckItems: _fn(_instance.includesOfCheckItems.map((e) =>
              CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList(
      this._res);

  TRes _res;

  call({
    String? name,
    int? id,
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations>?
        hasRegulations,
    List<Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems>?
        includesOfCheckItems,
    String? $__typename,
  }) =>
      _res;

  hasRegulations(_fn) => _res;

  includesOfCheckItems(_fn) => _res;
}

class Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations {
  Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations({
    required this.name,
    this.id,
    required this.description,
    this.$__typename = 'Regulation',
  });

  factory Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$id = json['id'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations(
      name: (l$name as String),
      id: (l$id as int?),
      description: (l$description as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final int? id;

  final String description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$id = id;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$id,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations
    on Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations {
  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations(
    Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations
        instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations;

  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations;

  TRes call({
    String? name,
    int? id,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations
      _instance;

  final TRes Function(
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? id = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        id: id == _undefined ? _instance.id : (id as int?),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$hasRegulations(
      this._res);

  TRes _res;

  call({
    String? name,
    int? id,
    String? description,
    String? $__typename,
  }) =>
      _res;
}

class Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems {
  Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems({
    this.id,
    required this.name,
    this.inputType,
    required this.labels,
    this.photoRequired,
    required this.description,
    this.isRequired,
    this.documentRequired,
    this.$__typename = 'CheckItem',
  });

  factory Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$inputType = json['inputType'];
    final l$labels = json['labels'];
    final l$photoRequired = json['photoRequired'];
    final l$description = json['description'];
    final l$isRequired = json['isRequired'];
    final l$documentRequired = json['documentRequired'];
    final l$$__typename = json['__typename'];
    return Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems(
      id: (l$id as int?),
      name: (l$name as String),
      inputType: (l$inputType as String?),
      labels: (l$labels as List<dynamic>).map((e) => (e as String)).toList(),
      photoRequired: (l$photoRequired as bool?),
      description: (l$description as String),
      isRequired: (l$isRequired as bool?),
      documentRequired: (l$documentRequired as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? id;

  final String name;

  final String? inputType;

  final List<String> labels;

  final bool? photoRequired;

  final String description;

  final bool? isRequired;

  final bool? documentRequired;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$inputType = inputType;
    _resultData['inputType'] = l$inputType;
    final l$labels = labels;
    _resultData['labels'] = l$labels.map((e) => e).toList();
    final l$photoRequired = photoRequired;
    _resultData['photoRequired'] = l$photoRequired;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$isRequired = isRequired;
    _resultData['isRequired'] = l$isRequired;
    final l$documentRequired = documentRequired;
    _resultData['documentRequired'] = l$documentRequired;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$inputType = inputType;
    final l$labels = labels;
    final l$photoRequired = photoRequired;
    final l$description = description;
    final l$isRequired = isRequired;
    final l$documentRequired = documentRequired;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$inputType,
      Object.hashAll(l$labels.map((v) => v)),
      l$photoRequired,
      l$description,
      l$isRequired,
      l$documentRequired,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$inputType = inputType;
    final lOther$inputType = other.inputType;
    if (l$inputType != lOther$inputType) {
      return false;
    }
    final l$labels = labels;
    final lOther$labels = other.labels;
    if (l$labels.length != lOther$labels.length) {
      return false;
    }
    for (int i = 0; i < l$labels.length; i++) {
      final l$labels$entry = l$labels[i];
      final lOther$labels$entry = lOther$labels[i];
      if (l$labels$entry != lOther$labels$entry) {
        return false;
      }
    }
    final l$photoRequired = photoRequired;
    final lOther$photoRequired = other.photoRequired;
    if (l$photoRequired != lOther$photoRequired) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$isRequired = isRequired;
    final lOther$isRequired = other.isRequired;
    if (l$isRequired != lOther$isRequired) {
      return false;
    }
    final l$documentRequired = documentRequired;
    final lOther$documentRequired = other.documentRequired;
    if (l$documentRequired != lOther$documentRequired) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems
    on Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems {
  CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems>
      get copyWith =>
          CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
    TRes> {
  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems(
    Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems
        instance,
    TRes Function(
            Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems)
        then,
  ) = _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems;

  factory CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems.stub(
          TRes res) =
      _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems;

  TRes call({
    int? id,
    String? name,
    String? inputType,
    List<String>? labels,
    bool? photoRequired,
    String? description,
    bool? isRequired,
    bool? documentRequired,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
            TRes> {
  _CopyWithImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems(
    this._instance,
    this._then,
  );

  final Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems
      _instance;

  final TRes Function(
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? inputType = _undefined,
    Object? labels = _undefined,
    Object? photoRequired = _undefined,
    Object? description = _undefined,
    Object? isRequired = _undefined,
    Object? documentRequired = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems(
        id: id == _undefined ? _instance.id : (id as int?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        inputType: inputType == _undefined
            ? _instance.inputType
            : (inputType as String?),
        labels: labels == _undefined || labels == null
            ? _instance.labels
            : (labels as List<String>),
        photoRequired: photoRequired == _undefined
            ? _instance.photoRequired
            : (photoRequired as bool?),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        isRequired: isRequired == _undefined
            ? _instance.isRequired
            : (isRequired as bool?),
        documentRequired: documentRequired == _undefined
            ? _instance.documentRequired
            : (documentRequired as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
        TRes>
    implements
        CopyWith$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems<
            TRes> {
  _CopyWithStubImpl$Query$MaintenancesTask$maintenances$ScheduledBy$parentSchedule$CheckList$includesOfCheckItems(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? inputType,
    List<String>? labels,
    bool? photoRequired,
    String? description,
    bool? isRequired,
    bool? documentRequired,
    String? $__typename,
  }) =>
      _res;
}
