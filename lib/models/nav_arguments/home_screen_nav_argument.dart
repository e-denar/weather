import 'package:freezed_annotation/freezed_annotation.dart';

import '../user.dart';

part 'home_screen_nav_argument.freezed.dart';

@freezed
class HomeScreenNavArgument with _$HomeScreenNavArgument {
  const factory HomeScreenNavArgument({
    required User user,
  }) = _HomeScreenNavArgument;
}
