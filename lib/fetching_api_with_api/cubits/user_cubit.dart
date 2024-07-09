import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fetch_api_with_cubit_app/fetching_api_with_api/models/user.dart';

import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  void fetchUsers() async {
    try {
      emit(state.copyWith(loading: true));

      Dio dio = Dio();
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/users");

      if (response.statusCode == 200) {
        final users = response.data
            .map<UserModel>((item) => UserModel.fromJson(item))
            .toList();
        emit(state.copyWith(loading: false, users: users));
      } else {
        emit(
          state.copyWith(
            errorMessage: "Error loading users: ${response.data.toString()}",
            loading: false,
          ),
        );
      }
    } catch (e) {
      print('e : $e');
      emit(
        state.copyWith(
          errorMessage: "Error loading users: ${e.toString()}",
          loading: false,
        ),
      );
    }
  }
}
