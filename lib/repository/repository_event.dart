part of 'repository_bloc.dart';

abstract class RepositoryEvent {
  RepositoryEvent();
}

class GetUsers extends RepositoryEvent {
  GetUsers();
}

class GetLoggedInUser extends RepositoryEvent {
  GetLoggedInUser(this.email);
  final String email;
}

class GetUserEvents extends RepositoryEvent {
  final int iD;
  GetUserEvents(this.iD);
}
