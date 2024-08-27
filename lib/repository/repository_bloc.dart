import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ssoattendance/repository/repository_service.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  RepositoryBloc(): super(RepositoryInitState())  {
    RepositoryService repositoryService = RepositoryService();
    on<GetUsers>((event, emit) async{
      try {
        final users = await repositoryService.getUsers();
        print('DATA $users');
        emit(GetUsersSuccessState(users));
      } catch (e) {
        emit(RepositoryFailedState('Error: $e'));
      }
    },);

    on<GetLoggedInUser>((event, emit) async {
      try {
        final raw = await repositoryService.getLoggedInUser(event.email);
        final user =jsonDecode(raw.toString());
        print('USEREMAIL ${user['d']['results'][0]['Name']['EMail']}');
        print('USERID ${user['d']['results'][0]['NameId']}');
        emit(GetLoggedInUserState(event.email, 49));
      } catch (e) {
        emit(RepositoryFailedState('Error: $e'));
      }
    },);
  }
}