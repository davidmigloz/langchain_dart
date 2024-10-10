// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, subtype=lint

part of 'database.dart';

// ignore_for_file: type=lint
class Files extends Table with TableInfo<Files, File> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Files(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
      'metadata', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [id, path, content, metadata];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'files';
  @override
  VerificationContext validateIntegrity(Insertable<File> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('metadata')) {
      context.handle(_metadataMeta,
          metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  File map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return File(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      metadata: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata']),
    );
  }

  @override
  Files createAlias(String alias) {
    return Files(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class File extends DataClass implements Insertable<File> {
  final int id;
  final String path;
  final String? content;
  final String? metadata;
  const File(
      {required this.id, required this.path, this.content, this.metadata});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    return map;
  }

  FilesCompanion toCompanion(bool nullToAbsent) {
    return FilesCompanion(
      id: Value(id),
      path: Value(path),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
    );
  }

  factory File.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return File(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String>(json['path']),
      content: serializer.fromJson<String?>(json['content']),
      metadata: serializer.fromJson<String?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String>(path),
      'content': serializer.toJson<String?>(content),
      'metadata': serializer.toJson<String?>(metadata),
    };
  }

  File copyWith(
          {int? id,
          String? path,
          Value<String?> content = const Value.absent(),
          Value<String?> metadata = const Value.absent()}) =>
      File(
        id: id ?? this.id,
        path: path ?? this.path,
        content: content.present ? content.value : this.content,
        metadata: metadata.present ? metadata.value : this.metadata,
      );
  File copyWithCompanion(FilesCompanion data) {
    return File(
      id: data.id.present ? data.id.value : this.id,
      path: data.path.present ? data.path.value : this.path,
      content: data.content.present ? data.content.value : this.content,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('File(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('content: $content, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, path, content, metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is File &&
          other.id == this.id &&
          other.path == this.path &&
          other.content == this.content &&
          other.metadata == this.metadata);
}

class FilesCompanion extends UpdateCompanion<File> {
  final Value<int> id;
  final Value<String> path;
  final Value<String?> content;
  final Value<String?> metadata;
  const FilesCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.content = const Value.absent(),
    this.metadata = const Value.absent(),
  });
  FilesCompanion.insert({
    this.id = const Value.absent(),
    required String path,
    this.content = const Value.absent(),
    this.metadata = const Value.absent(),
  }) : path = Value(path);
  static Insertable<File> custom({
    Expression<int>? id,
    Expression<String>? path,
    Expression<String>? content,
    Expression<String>? metadata,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
      if (content != null) 'content': content,
      if (metadata != null) 'metadata': metadata,
    });
  }

  FilesCompanion copyWith(
      {Value<int>? id,
      Value<String>? path,
      Value<String?>? content,
      Value<String?>? metadata}) {
    return FilesCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      content: content ?? this.content,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FilesCompanion(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('content: $content, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }
}

class FileEmbeddings extends Table
    with TableInfo<FileEmbeddings, FileEmbedding> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FileEmbeddings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _fileIdMeta = const VerificationMeta('fileId');
  late final GeneratedColumn<int> fileId = GeneratedColumn<int>(
      'file_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _chunkIdMeta =
      const VerificationMeta('chunkId');
  late final GeneratedColumn<int> chunkId = GeneratedColumn<int>(
      'chunk_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  late final GeneratedColumn<int> start = GeneratedColumn<int>(
      'start', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  late final GeneratedColumn<int> end = GeneratedColumn<int>(
      'end', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [id, fileId, chunkId, start, end];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'file_embeddings';
  @override
  VerificationContext validateIntegrity(Insertable<FileEmbedding> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_id')) {
      context.handle(_fileIdMeta,
          fileId.isAcceptableOrUnknown(data['file_id']!, _fileIdMeta));
    } else if (isInserting) {
      context.missing(_fileIdMeta);
    }
    if (data.containsKey('chunk_id')) {
      context.handle(_chunkIdMeta,
          chunkId.isAcceptableOrUnknown(data['chunk_id']!, _chunkIdMeta));
    } else if (isInserting) {
      context.missing(_chunkIdMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FileEmbedding map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FileEmbedding(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fileId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_id'])!,
      chunkId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chunk_id'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start']),
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end']),
    );
  }

  @override
  FileEmbeddings createAlias(String alias) {
    return FileEmbeddings(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FileEmbedding extends DataClass implements Insertable<FileEmbedding> {
  final int id;
  final int fileId;
  final int chunkId;
  final int? start;
  final int? end;
  const FileEmbedding(
      {required this.id,
      required this.fileId,
      required this.chunkId,
      this.start,
      this.end});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_id'] = Variable<int>(fileId);
    map['chunk_id'] = Variable<int>(chunkId);
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<int>(start);
    }
    if (!nullToAbsent || end != null) {
      map['end'] = Variable<int>(end);
    }
    return map;
  }

  FileEmbeddingsCompanion toCompanion(bool nullToAbsent) {
    return FileEmbeddingsCompanion(
      id: Value(id),
      fileId: Value(fileId),
      chunkId: Value(chunkId),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      end: end == null && nullToAbsent ? const Value.absent() : Value(end),
    );
  }

  factory FileEmbedding.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FileEmbedding(
      id: serializer.fromJson<int>(json['id']),
      fileId: serializer.fromJson<int>(json['file_id']),
      chunkId: serializer.fromJson<int>(json['chunk_id']),
      start: serializer.fromJson<int?>(json['start']),
      end: serializer.fromJson<int?>(json['end']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'file_id': serializer.toJson<int>(fileId),
      'chunk_id': serializer.toJson<int>(chunkId),
      'start': serializer.toJson<int?>(start),
      'end': serializer.toJson<int?>(end),
    };
  }

  FileEmbedding copyWith(
          {int? id,
          int? fileId,
          int? chunkId,
          Value<int?> start = const Value.absent(),
          Value<int?> end = const Value.absent()}) =>
      FileEmbedding(
        id: id ?? this.id,
        fileId: fileId ?? this.fileId,
        chunkId: chunkId ?? this.chunkId,
        start: start.present ? start.value : this.start,
        end: end.present ? end.value : this.end,
      );
  FileEmbedding copyWithCompanion(FileEmbeddingsCompanion data) {
    return FileEmbedding(
      id: data.id.present ? data.id.value : this.id,
      fileId: data.fileId.present ? data.fileId.value : this.fileId,
      chunkId: data.chunkId.present ? data.chunkId.value : this.chunkId,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FileEmbedding(')
          ..write('id: $id, ')
          ..write('fileId: $fileId, ')
          ..write('chunkId: $chunkId, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fileId, chunkId, start, end);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FileEmbedding &&
          other.id == this.id &&
          other.fileId == this.fileId &&
          other.chunkId == this.chunkId &&
          other.start == this.start &&
          other.end == this.end);
}

class FileEmbeddingsCompanion extends UpdateCompanion<FileEmbedding> {
  final Value<int> id;
  final Value<int> fileId;
  final Value<int> chunkId;
  final Value<int?> start;
  final Value<int?> end;
  const FileEmbeddingsCompanion({
    this.id = const Value.absent(),
    this.fileId = const Value.absent(),
    this.chunkId = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
  });
  FileEmbeddingsCompanion.insert({
    this.id = const Value.absent(),
    required int fileId,
    required int chunkId,
    this.start = const Value.absent(),
    this.end = const Value.absent(),
  })  : fileId = Value(fileId),
        chunkId = Value(chunkId);
  static Insertable<FileEmbedding> custom({
    Expression<int>? id,
    Expression<int>? fileId,
    Expression<int>? chunkId,
    Expression<int>? start,
    Expression<int>? end,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileId != null) 'file_id': fileId,
      if (chunkId != null) 'chunk_id': chunkId,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
    });
  }

  FileEmbeddingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? fileId,
      Value<int>? chunkId,
      Value<int?>? start,
      Value<int?>? end}) {
    return FileEmbeddingsCompanion(
      id: id ?? this.id,
      fileId: fileId ?? this.fileId,
      chunkId: chunkId ?? this.chunkId,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fileId.present) {
      map['file_id'] = Variable<int>(fileId.value);
    }
    if (chunkId.present) {
      map['chunk_id'] = Variable<int>(chunkId.value);
    }
    if (start.present) {
      map['start'] = Variable<int>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<int>(end.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FileEmbeddingsCompanion(')
          ..write('id: $id, ')
          ..write('fileId: $fileId, ')
          ..write('chunkId: $chunkId, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final Files files = Files(this);
  late final FileEmbeddings fileEmbeddings = FileEmbeddings(this);
  Selectable<File> getFiles() {
    return customSelect('SELECT * FROM files', variables: [], readsFrom: {
      files,
    }).asyncMap(files.mapFromRow);
  }

  Selectable<File> getFileById(int id) {
    return customSelect('SELECT * FROM files WHERE id = ?1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      files,
    }).asyncMap(files.mapFromRow);
  }

  Selectable<File> getFileByPath(String path) {
    return customSelect('SELECT * FROM files WHERE path = ?1', variables: [
      Variable<String>(path)
    ], readsFrom: {
      files,
    }).asyncMap(files.mapFromRow);
  }

  Future<int> insertFile(String path, String? content, String? metadata) {
    return customInsert(
      'INSERT INTO files (path, content, metadata) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(path),
        Variable<String>(content),
        Variable<String>(metadata)
      ],
      updates: {files},
    );
  }

  Future<int> deleteFileById(int id) {
    return customUpdate(
      'DELETE FROM files WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {files},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<FileEmbedding> getFileEmbeddingsByFileId(int fileId) {
    return customSelect('SELECT * FROM file_embeddings WHERE file_id = ?1',
        variables: [
          Variable<int>(fileId)
        ],
        readsFrom: {
          fileEmbeddings,
        }).asyncMap(fileEmbeddings.mapFromRow);
  }

  Future<int> deleteFileEmbeddingByFileId(int id) {
    return customUpdate(
      'DELETE FROM file_embeddings WHERE file_id = ?1',
      variables: [Variable<int>(id)],
      updates: {fileEmbeddings},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<int> getLastId() {
    return customSelect('SELECT last_insert_rowid() AS _c0',
        variables: [],
        readsFrom: {}).map((QueryRow row) => row.read<int>('_c0'));
  }

  Future<int> insertFileEmbedding(
      int fileId, int chunkId, int? start, int? end) {
    return customInsert(
      'INSERT INTO file_embeddings (file_id, chunk_id, start, "end") VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<int>(fileId),
        Variable<int>(chunkId),
        Variable<int>(start),
        Variable<int>(end)
      ],
      updates: {fileEmbeddings},
    );
  }

  Selectable<SearchEmbeddingsResult> searchEmbeddings(Uint8List embedding) {
    return customSelect(
        'SELECT files.id AS fileId, files.path, file_embeddings.start, file_embeddings."end", CAST(chunks.distance AS REAL) AS distance, files.content, files.metadata FROM chunks LEFT JOIN file_embeddings ON file_embeddings.chunk_id = chunks.id LEFT JOIN files ON files.id = file_embeddings.file_id WHERE embedding MATCH ?1 AND k = 20',
        variables: [
          Variable<Uint8List>(embedding)
        ],
        readsFrom: {
          files,
          fileEmbeddings,
        }).map((QueryRow row) => SearchEmbeddingsResult(
          fileId: row.readNullable<int>('fileId'),
          path: row.readNullable<String>('path'),
          start: row.readNullable<int>('start'),
          end: row.readNullable<int>('end'),
          distance: row.read<double>('distance'),
          content: row.readNullable<String>('content'),
          metadata: row.readNullable<String>('metadata'),
        ));
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [files, fileEmbeddings];
}

typedef $FilesCreateCompanionBuilder = FilesCompanion Function({
  Value<int> id,
  required String path,
  Value<String?> content,
  Value<String?> metadata,
});
typedef $FilesUpdateCompanionBuilder = FilesCompanion Function({
  Value<int> id,
  Value<String> path,
  Value<String?> content,
  Value<String?> metadata,
});

class $FilesFilterComposer extends FilterComposer<_$Database, Files> {
  $FilesFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get metadata => $state.composableBuilder(
      column: $state.table.metadata,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $FilesOrderingComposer extends OrderingComposer<_$Database, Files> {
  $FilesOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get path => $state.composableBuilder(
      column: $state.table.path,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get metadata => $state.composableBuilder(
      column: $state.table.metadata,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $FilesTableManager extends RootTableManager<
    _$Database,
    Files,
    File,
    $FilesFilterComposer,
    $FilesOrderingComposer,
    $FilesCreateCompanionBuilder,
    $FilesUpdateCompanionBuilder,
    (File, BaseReferences<_$Database, Files, File>),
    File,
    PrefetchHooks Function()> {
  $FilesTableManager(_$Database db, Files table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $FilesFilterComposer(ComposerState(db, table)),
          orderingComposer: $FilesOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<String?> metadata = const Value.absent(),
          }) =>
              FilesCompanion(
            id: id,
            path: path,
            content: content,
            metadata: metadata,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String path,
            Value<String?> content = const Value.absent(),
            Value<String?> metadata = const Value.absent(),
          }) =>
              FilesCompanion.insert(
            id: id,
            path: path,
            content: content,
            metadata: metadata,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $FilesProcessedTableManager = ProcessedTableManager<
    _$Database,
    Files,
    File,
    $FilesFilterComposer,
    $FilesOrderingComposer,
    $FilesCreateCompanionBuilder,
    $FilesUpdateCompanionBuilder,
    (File, BaseReferences<_$Database, Files, File>),
    File,
    PrefetchHooks Function()>;
typedef $FileEmbeddingsCreateCompanionBuilder = FileEmbeddingsCompanion
    Function({
  Value<int> id,
  required int fileId,
  required int chunkId,
  Value<int?> start,
  Value<int?> end,
});
typedef $FileEmbeddingsUpdateCompanionBuilder = FileEmbeddingsCompanion
    Function({
  Value<int> id,
  Value<int> fileId,
  Value<int> chunkId,
  Value<int?> start,
  Value<int?> end,
});

class $FileEmbeddingsFilterComposer
    extends FilterComposer<_$Database, FileEmbeddings> {
  $FileEmbeddingsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fileId => $state.composableBuilder(
      column: $state.table.fileId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get chunkId => $state.composableBuilder(
      column: $state.table.chunkId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get end => $state.composableBuilder(
      column: $state.table.end,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $FileEmbeddingsOrderingComposer
    extends OrderingComposer<_$Database, FileEmbeddings> {
  $FileEmbeddingsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fileId => $state.composableBuilder(
      column: $state.table.fileId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get chunkId => $state.composableBuilder(
      column: $state.table.chunkId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get end => $state.composableBuilder(
      column: $state.table.end,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $FileEmbeddingsTableManager extends RootTableManager<
    _$Database,
    FileEmbeddings,
    FileEmbedding,
    $FileEmbeddingsFilterComposer,
    $FileEmbeddingsOrderingComposer,
    $FileEmbeddingsCreateCompanionBuilder,
    $FileEmbeddingsUpdateCompanionBuilder,
    (FileEmbedding, BaseReferences<_$Database, FileEmbeddings, FileEmbedding>),
    FileEmbedding,
    PrefetchHooks Function()> {
  $FileEmbeddingsTableManager(_$Database db, FileEmbeddings table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $FileEmbeddingsFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $FileEmbeddingsOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> fileId = const Value.absent(),
            Value<int> chunkId = const Value.absent(),
            Value<int?> start = const Value.absent(),
            Value<int?> end = const Value.absent(),
          }) =>
              FileEmbeddingsCompanion(
            id: id,
            fileId: fileId,
            chunkId: chunkId,
            start: start,
            end: end,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int fileId,
            required int chunkId,
            Value<int?> start = const Value.absent(),
            Value<int?> end = const Value.absent(),
          }) =>
              FileEmbeddingsCompanion.insert(
            id: id,
            fileId: fileId,
            chunkId: chunkId,
            start: start,
            end: end,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $FileEmbeddingsProcessedTableManager = ProcessedTableManager<
    _$Database,
    FileEmbeddings,
    FileEmbedding,
    $FileEmbeddingsFilterComposer,
    $FileEmbeddingsOrderingComposer,
    $FileEmbeddingsCreateCompanionBuilder,
    $FileEmbeddingsUpdateCompanionBuilder,
    (FileEmbedding, BaseReferences<_$Database, FileEmbeddings, FileEmbedding>),
    FileEmbedding,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $FilesTableManager get files => $FilesTableManager(_db, _db.files);
  $FileEmbeddingsTableManager get fileEmbeddings =>
      $FileEmbeddingsTableManager(_db, _db.fileEmbeddings);
}

class SearchEmbeddingsResult {
  final int? fileId;
  final String? path;
  final int? start;
  final int? end;
  final double distance;
  final String? content;
  final String? metadata;
  SearchEmbeddingsResult({
    this.fileId,
    this.path,
    this.start,
    this.end,
    required this.distance,
    this.content,
    this.metadata,
  });
}
