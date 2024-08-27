part of 'repository_bloc.dart';
abstract class RepositoryEvent {
  RepositoryEvent();
}

class GetUsers extends RepositoryEvent {
  GetUsers();
}