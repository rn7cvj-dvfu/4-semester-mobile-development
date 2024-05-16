// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../features/tasks/tasks_list/models/task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskViewModel {
  String get id => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskViewModelCopyWith<TaskViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskViewModelCopyWith<$Res> {
  factory $TaskViewModelCopyWith(
          TaskViewModel value, $Res Function(TaskViewModel) then) =
      _$TaskViewModelCopyWithImpl<$Res, TaskViewModel>;
  @useResult
  $Res call(
      {String id,
      String categoryId,
      String title,
      String description,
      bool isCompleted,
      bool isFavourite,
      DateTime createdAt});
}

/// @nodoc
class _$TaskViewModelCopyWithImpl<$Res, $Val extends TaskViewModel>
    implements $TaskViewModelCopyWith<$Res> {
  _$TaskViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? title = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? isFavourite = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskViewModelImplCopyWith<$Res>
    implements $TaskViewModelCopyWith<$Res> {
  factory _$$TaskViewModelImplCopyWith(
          _$TaskViewModelImpl value, $Res Function(_$TaskViewModelImpl) then) =
      __$$TaskViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String categoryId,
      String title,
      String description,
      bool isCompleted,
      bool isFavourite,
      DateTime createdAt});
}

/// @nodoc
class __$$TaskViewModelImplCopyWithImpl<$Res>
    extends _$TaskViewModelCopyWithImpl<$Res, _$TaskViewModelImpl>
    implements _$$TaskViewModelImplCopyWith<$Res> {
  __$$TaskViewModelImplCopyWithImpl(
      _$TaskViewModelImpl _value, $Res Function(_$TaskViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? title = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? isFavourite = null,
    Object? createdAt = null,
  }) {
    return _then(_$TaskViewModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TaskViewModelImpl implements _TaskViewModel {
  const _$TaskViewModelImpl(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.description,
      this.isCompleted = false,
      this.isFavourite = false,
      required this.createdAt});

  @override
  final String id;
  @override
  final String categoryId;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final bool isFavourite;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TaskViewModel(id: $id, categoryId: $categoryId, title: $title, description: $description, isCompleted: $isCompleted, isFavourite: $isFavourite, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskViewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, title,
      description, isCompleted, isFavourite, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskViewModelImplCopyWith<_$TaskViewModelImpl> get copyWith =>
      __$$TaskViewModelImplCopyWithImpl<_$TaskViewModelImpl>(this, _$identity);
}

abstract class _TaskViewModel implements TaskViewModel {
  const factory _TaskViewModel(
      {required final String id,
      required final String categoryId,
      required final String title,
      required final String description,
      final bool isCompleted,
      final bool isFavourite,
      required final DateTime createdAt}) = _$TaskViewModelImpl;

  @override
  String get id;
  @override
  String get categoryId;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get isCompleted;
  @override
  bool get isFavourite;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TaskViewModelImplCopyWith<_$TaskViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
