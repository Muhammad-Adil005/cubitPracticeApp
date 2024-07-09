import 'package:equatable/equatable.dart';

import '../models/user.dart';

class UserState extends Equatable {
  final bool loading;
  // final bool? success;
  final String? errorMessage;
  final List<UserModel> users;

  const UserState({
    this.loading = false,
    // this.success = false,
    this.errorMessage,
    this.users = const [],
  });

  UserState copyWith({
    bool? loading,
    // bool? success,
    String? errorMessage,
    List<UserModel>? users,
  }) {
    return UserState(
      loading: loading ?? this.loading,
      // success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        //success,
        errorMessage,
        users,
      ];
}
