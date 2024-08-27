part of 'repository_bloc.dart';

abstract class RepositoryState {
  RepositoryState();
}

class GetUsersSuccessState extends RepositoryState {
  final Response<dynamic> users;
  GetUsersSuccessState(this.users);
}

class GetLoggedInUserState extends RepositoryState {
  final String email;
  final int Id;
  GetLoggedInUserState(this.email, this.Id);
}

class RepositoryInitState extends RepositoryState {
  RepositoryInitState();
}

class RepositoryFailedState extends RepositoryState {
  final String message;
  RepositoryFailedState(this.message);
}

class GetUserEventsState extends RepositoryState {
  final List<Event> events;
  GetUserEventsState(this.events);
}
