
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
part 'todo_model.g.dart';

const SqfEntityTable todoTable = SqfEntityTable(
  tableName: "todo",
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: false,
  fields: [
    SqfEntityField("title", DbType.text),
    SqfEntityField("isDone", DbType.bool, defaultValue: false),
  ]
);

const SqfEntitySequence sqfEntitySequence = SqfEntitySequence(
  sequenceName: "identity"
);

@SqfEntityBuilder(myDatabaseModel)
const myDatabaseModel = SqfEntityModel(
  modelName: "TodoDatabaseModel",
  databaseName: "todo-database.db",
  sequences: [sqfEntitySequence],
  databaseTables: [todoTable],
);