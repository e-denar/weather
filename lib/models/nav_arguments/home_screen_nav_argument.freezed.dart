// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_nav_argument.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenNavArgument {
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenNavArgumentCopyWith<HomeScreenNavArgument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenNavArgumentCopyWith<$Res> {
  factory $HomeScreenNavArgumentCopyWith(HomeScreenNavArgument value,
          $Res Function(HomeScreenNavArgument) then) =
      _$HomeScreenNavArgumentCopyWithImpl<$Res, HomeScreenNavArgument>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class _$HomeScreenNavArgumentCopyWithImpl<$Res,
        $Val extends HomeScreenNavArgument>
    implements $HomeScreenNavArgumentCopyWith<$Res> {
  _$HomeScreenNavArgumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeScreenNavArgumentCopyWith<$Res>
    implements $HomeScreenNavArgumentCopyWith<$Res> {
  factory _$$_HomeScreenNavArgumentCopyWith(_$_HomeScreenNavArgument value,
          $Res Function(_$_HomeScreenNavArgument) then) =
      __$$_HomeScreenNavArgumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$_HomeScreenNavArgumentCopyWithImpl<$Res>
    extends _$HomeScreenNavArgumentCopyWithImpl<$Res, _$_HomeScreenNavArgument>
    implements _$$_HomeScreenNavArgumentCopyWith<$Res> {
  __$$_HomeScreenNavArgumentCopyWithImpl(_$_HomeScreenNavArgument _value,
      $Res Function(_$_HomeScreenNavArgument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_HomeScreenNavArgument(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_HomeScreenNavArgument implements _HomeScreenNavArgument {
  const _$_HomeScreenNavArgument({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'HomeScreenNavArgument(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeScreenNavArgument &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeScreenNavArgumentCopyWith<_$_HomeScreenNavArgument> get copyWith =>
      __$$_HomeScreenNavArgumentCopyWithImpl<_$_HomeScreenNavArgument>(
          this, _$identity);
}

abstract class _HomeScreenNavArgument implements HomeScreenNavArgument {
  const factory _HomeScreenNavArgument({required final User user}) =
      _$_HomeScreenNavArgument;

  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_HomeScreenNavArgumentCopyWith<_$_HomeScreenNavArgument> get copyWith =>
      throw _privateConstructorUsedError;
}
