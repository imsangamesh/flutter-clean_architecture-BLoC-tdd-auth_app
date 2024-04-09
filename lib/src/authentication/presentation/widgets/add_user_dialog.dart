import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog(this.nameController, {super.key});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'username',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  const avatar =
                      'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/678.jpg';
                  final name = nameController.text.trim();
                  context.read<AuthCubit>().createUser(
                        createdAt: DateTime.now().toIso8601String(),
                        name: name,
                        avatar: avatar,
                      );

                  nameController.clear();
                  Navigator.pop(context);
                },
                child: const Text('Create User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
