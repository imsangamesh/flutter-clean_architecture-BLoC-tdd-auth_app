import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../widgets/add_user_dialog.dart';
import '../widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() {
    context.read<AuthCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('state.message')),
          );
        } else if (state is UserCreated) {
          getUsers();
        }
      },
      builder: (context, state) {
        if (state is GettingUsers) {
          return const Loader('Fetching Users');
        }
        if (state is CreatingUser) {
          return const Loader('Creating User');
        }
        if (state is UsersLoaded) {
          return Scaffold(
            body: Center(
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (_, i) {
                  final user = state.users[i];
                  return ListTile(
                    leading: Image.network(user.avatar),
                    title: Text(user.name),
                    subtitle: Text(user.createdAt.substring(0, 10)),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (_) => AddUserDialog(nameController),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add User'),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
