// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../features/categories_list/models/category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryViewModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryViewModelCopyWith<CategoryViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryViewModelCopyWith<$Res> {
  factory $CategoryViewModelCopyWith(
          CategoryViewModel value, $Res Function(CategoryViewModel) then) =
      _$CategoryViewModelCopyWithImpl<$Res, CategoryViewModel>;
  @useResult
  $Res call({String id, String name, DateTime createDate});
}

/// @nodoc
class _$CategoryViewModelCopyWithImpl<$Res, $Val extends CategoryViewModel>
    implements $CategoryViewModelCopyWith<$Res> {
  _$CategoryViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryViewModelImplCopyWith<$Res>
    implements $CategoryViewModelCopyWith<$Res> {
  factory _$$CategoryViewModelImplCopyWith(_$CategoryViewModelImpl value,
          $Res Function(_$CategoryViewModelImpl) then) =
      __$$CategoryViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, DateTime createDate});
}

/// @nodoc
class __$$CategoryViewModelImplCopyWithImpl<$Res>
    extends _$CategoryViewModelCopyWithImpl<$Res, _$CategoryViewModelImpl>
    implements _$$CategoryViewModelImplCopyWith<$Res> {
  __$$CategoryViewModelImplCopyWithImpl(_$CategoryViewModelImpl _value,
      $Res Function(_$CategoryViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createDate = null,
  }) {
    return _then(_$CategoryViewModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$CategoryViewModelImpl implements _CategoryViewModel {
  const _$CategoryViewModelImpl(
      {required this.id, required this.name, required this.createDate});

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime createDate;

  @override
  String toString() {
    return 'CategoryViewModel(id: $id, name: $name, createDate: $createDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryViewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, createDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryViewModelImplCopyWith<_$CategoryViewModelImpl> get copyWith =>
      __$$CategoryViewModelImplCopyWithImpl<_$CategoryViewModelImpl>(
          this, _$identity);
}

abstract class _CategoryViewModel implements CategoryViewModel {
  const factory _CategoryViewModel(
      {required final String id,
      required final String name,
      required final DateTime createDate}) = _$CategoryViewModelImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get createDate;
  @override
  @JsonKey(ignore: true)
  _$$CategoryViewModelImplCopyWith<_$CategoryViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
