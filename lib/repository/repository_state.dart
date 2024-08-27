part of 'repository_bloc.dart';

abstract class RepositoryState {
  RepositoryState();
}

class GetUsersSuccessState extends RepositoryState {
  final Response<dynamic> users;
  GetUsersSuccessState(this.users);
}

class GetLoggedInUser extends RepositoryState{
  final String email;
  final int Id;
  GetLoggedInUser(this.email, this.Id);
}

class RepositoryInitState extends RepositoryState {
  RepositoryInitState();
}

class RepositoryFailedState extends RepositoryState{
  RepositoryFailedState();
}