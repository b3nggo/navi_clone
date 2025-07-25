// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TabItemsTable extends TabItems with TableInfo<$TabItemsTable, TabItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _layoutIdMeta = const VerificationMeta(
    'layoutId',
  );
  @override
  late final GeneratedColumn<String> layoutId = GeneratedColumn<String>(
    'layout_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, layoutId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tab_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<TabItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('layout_id')) {
      context.handle(
        _layoutIdMeta,
        layoutId.isAcceptableOrUnknown(data['layout_id']!, _layoutIdMeta),
      );
    } else if (isInserting) {
      context.missing(_layoutIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TabItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      layoutId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}layout_id'],
      )!,
    );
  }

  @override
  $TabItemsTable createAlias(String alias) {
    return $TabItemsTable(attachedDatabase, alias);
  }
}

class TabItem extends DataClass implements Insertable<TabItem> {
  final int id;
  final String name;
  final String layoutId;
  const TabItem({required this.id, required this.name, required this.layoutId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['layout_id'] = Variable<String>(layoutId);
    return map;
  }

  TabItemsCompanion toCompanion(bool nullToAbsent) {
    return TabItemsCompanion(
      id: Value(id),
      name: Value(name),
      layoutId: Value(layoutId),
    );
  }

  factory TabItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      layoutId: serializer.fromJson<String>(json['layoutId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'layoutId': serializer.toJson<String>(layoutId),
    };
  }

  TabItem copyWith({int? id, String? name, String? layoutId}) => TabItem(
    id: id ?? this.id,
    name: name ?? this.name,
    layoutId: layoutId ?? this.layoutId,
  );
  TabItem copyWithCompanion(TabItemsCompanion data) {
    return TabItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      layoutId: data.layoutId.present ? data.layoutId.value : this.layoutId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TabItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('layoutId: $layoutId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, layoutId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.layoutId == this.layoutId);
}

class TabItemsCompanion extends UpdateCompanion<TabItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> layoutId;
  const TabItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.layoutId = const Value.absent(),
  });
  TabItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String layoutId,
  }) : name = Value(name),
       layoutId = Value(layoutId);
  static Insertable<TabItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? layoutId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (layoutId != null) 'layout_id': layoutId,
    });
  }

  TabItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? layoutId,
  }) {
    return TabItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      layoutId: layoutId ?? this.layoutId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (layoutId.present) {
      map['layout_id'] = Variable<String>(layoutId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('layoutId: $layoutId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TabItemsTable tabItems = $TabItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tabItems];
}

typedef $$TabItemsTableCreateCompanionBuilder =
    TabItemsCompanion Function({
      Value<int> id,
      required String name,
      required String layoutId,
    });
typedef $$TabItemsTableUpdateCompanionBuilder =
    TabItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> layoutId,
    });

class $$TabItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TabItemsTable> {
  $$TabItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get layoutId => $composableBuilder(
    column: $table.layoutId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TabItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TabItemsTable> {
  $$TabItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get layoutId => $composableBuilder(
    column: $table.layoutId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TabItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TabItemsTable> {
  $$TabItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get layoutId =>
      $composableBuilder(column: $table.layoutId, builder: (column) => column);
}

class $$TabItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TabItemsTable,
          TabItem,
          $$TabItemsTableFilterComposer,
          $$TabItemsTableOrderingComposer,
          $$TabItemsTableAnnotationComposer,
          $$TabItemsTableCreateCompanionBuilder,
          $$TabItemsTableUpdateCompanionBuilder,
          (TabItem, BaseReferences<_$AppDatabase, $TabItemsTable, TabItem>),
          TabItem,
          PrefetchHooks Function()
        > {
  $$TabItemsTableTableManager(_$AppDatabase db, $TabItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TabItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TabItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TabItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> layoutId = const Value.absent(),
              }) => TabItemsCompanion(id: id, name: name, layoutId: layoutId),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String layoutId,
              }) => TabItemsCompanion.insert(
                id: id,
                name: name,
                layoutId: layoutId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TabItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TabItemsTable,
      TabItem,
      $$TabItemsTableFilterComposer,
      $$TabItemsTableOrderingComposer,
      $$TabItemsTableAnnotationComposer,
      $$TabItemsTableCreateCompanionBuilder,
      $$TabItemsTableUpdateCompanionBuilder,
      (TabItem, BaseReferences<_$AppDatabase, $TabItemsTable, TabItem>),
      TabItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TabItemsTableTableManager get tabItems =>
      $$TabItemsTableTableManager(_db, _db.tabItems);
}
