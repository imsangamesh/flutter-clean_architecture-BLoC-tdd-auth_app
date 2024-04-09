part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CreateUserEvent extends AuthEvent {
  const CreateUserEvent({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}

class GetUsersEvent extends AuthEvent {
  const GetUsersEvent();
}
