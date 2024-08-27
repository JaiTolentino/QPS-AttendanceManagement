import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ssoattendance/models/event.dart';
import 'package:ssoattendance/models/schedule.dart';
import 'package:ssoattendance/repository/repository_service.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  RepositoryBloc() : super(RepositoryInitState()) {
    RepositoryService repositoryService = RepositoryService();
    on<GetUsers>(
      (event, emit) async {
        try {
          final users = await repositoryService.getUsers();
          // print('DATA $users');
          emit(GetUsersSuccessState(users));
        } catch (e) {
          emit(RepositoryFailedState('Error: $e'));
        }
      },
    );

    on<GetLoggedInUser>(
      (event, emit) async {
        try {
          final raw = await repositoryService.getLoggedInUser(event.email);
          final user = jsonDecode(raw.toString());

          // print('USEREMAIL ${user['d']['results'][0]['Name']['EMail']}');
          // print('USERID ${user['d']['results'][0]['NameId']}');
          emit(
            GetLoggedInUserState(
              user['d']['results'][0]['Name']['EMail'] as String,
              user['d']['results'][0]['NameId'] as int,
            ),
          );
        } catch (e) {
          emit(RepositoryFailedState('Error: $e'));
        }
      },
    );
    on<GetUserEvents>(
      (event, emit) async {
        try {
          final raw = await repositoryService.getUserEvents(event.iD);
          final userRawEvents =
              jsonDecode(raw.toString())['d']['results'] as List;

          final futures = userRawEvents.map((eventDetails) async {
            final schedules = await repositoryService
                .getEventSchedule(int.parse(eventDetails['ID'].toString()));
            final schedule =
                jsonDecode(schedules.toString())['d']['results'] as List;

            return Event(
              eventDetails['Name'].toString(),
              eventDetails['EventType'].toString(),
              eventDetails['Subunit'].toString(),
              schedule
                  .map((scheduleData) => Schedule(
                        scheduleData['StartDateandTime'].toString(),
                        scheduleData['EndDateandTime'].toString(),
                        scheduleData['Venue'].toString(),
                        scheduleData['Status'].toString(),
                      ))
                  .toList(),
            );
          });

          final userEvents = await Future.wait(futures);
          emit(GetUserEventsState(userEvents));
        } catch (e) {
          print(e);
          emit(RepositoryFailedState('Error getting events:'));
        }
      },
    );
  }
}
