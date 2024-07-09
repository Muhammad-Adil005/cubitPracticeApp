import 'package:fetch_api_with_cubit_app/fetching_api_with_api/cubits/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => UserCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: const Text("User Screen"),
          ),
          body: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.errorMessage != null) {
                return Center(
                  child: Text(
                    'Error: ${state.errorMessage}',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return ListTile(
                      title: Text(
                        'Name: ${user.name}',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      subtitle: Text('Email: ${user.email}'),
                    );
                  },
                );
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              context.read<UserCubit>().fetchUsers();
            },
            tooltip: 'Fetch Users',
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}
