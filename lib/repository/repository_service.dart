import 'package:dio/dio.dart';

class RepositoryService {
  final dio = Dio();
  final baseUrl =
      'https://questronixcomph.sharepoint.com/sites/SSOPowerApps/_api/web/lists/';
  var options = Options(
    headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCIsImtpZCI6IktRMnRBY3JFN2xCYVZWR0JtYzVGb2JnZEpvNCJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvcXVlc3Ryb25peGNvbXBoLnNoYXJlcG9pbnQuY29tQDkyNmQ4YzNlLWExNDktNDgxZS05MzM5LTkyNjIzYWM1MGNiMyIsImlzcyI6IjAwMDAwMDAxLTAwMDAtMDAwMC1jMDAwLTAwMDAwMDAwMDAwMEA5MjZkOGMzZS1hMTQ5LTQ4MWUtOTMzOS05MjYyM2FjNTBjYjMiLCJpYXQiOjE3MjQ3MzAxOTYsIm5iZiI6MTcyNDczMDE5NiwiZXhwIjoxNzI0ODE2ODk2LCJpZGVudGl0eXByb3ZpZGVyIjoiMDAwMDAwMDEtMDAwMC0wMDAwLWMwMDAtMDAwMDAwMDAwMDAwQDkyNmQ4YzNlLWExNDktNDgxZS05MzM5LTkyNjIzYWM1MGNiMyIsIm5hbWVpZCI6IjViMDdlMTA2LThjZjAtNDM1MS1iZTIwLTkwMjVlZWIzZDc1MkA5MjZkOGMzZS1hMTQ5LTQ4MWUtOTMzOS05MjYyM2FjNTBjYjMiLCJvaWQiOiJjOTU3OWE4Ny0yMjViLTQ0ZjItODAwMS1kZjM4YWIyYzY1NmEiLCJzdWIiOiJjOTU3OWE4Ny0yMjViLTQ0ZjItODAwMS1kZjM4YWIyYzY1NmEiLCJ0cnVzdGVkZm9yZGVsZWdhdGlvbiI6ImZhbHNlIn0.p5mcLjCPCeJpp8nhguTCum7Qfw_1DgjJl--D4CSLoH16wE2cHQNlbjAy7LEejY3W0dok-i6R4o2WKtLkRSFAV9qaHD-clGw896huACewdvPuv7snaQDGusNVZCxMcRJ-esirRFfezY_YscptzktEZd-09N2udnQEBxum1guhKq9WguFiP_g7_nbfsgU05XlWp5u7I4OYzUiEzHF9x3rXrKCGm32RBKsgV7VzhwFINoOvbLsaOESmr14a53E2RByRDaMYgzJcaJS6RoHYCJ9MLeST2An3uCk7Nz9KWmxKA-cAea7OYheamkNDzsrHfCegmj9Vf4_5ZyYAg8UpbCEh-g',
      'Accept': 'application/json;odata=verbose'
    },
  );
  Future<Response<dynamic>> getUsers() {
    return dio.get(
        "https://questronixcomph.sharepoint.com/sites/SSOPowerApps/_api/web/lists/GetByTitle('TeamRoles_v2')/Items?\$expand=Name&\$select=*,Name/EMail",
        options: options);
  }

  Future<Response<dynamic>> getLoggedInUser(String email) {
    return dio.get(
        "https://questronixcomph.sharepoint.com/sites/SSOPowerApps/_api/web/lists/GetByTitle('TeamRoles_v2')/Items?\$expand=Name&\$select=*,Name/EMail&\$filter=Name/EMail eq '$email'",
        options: options);
  }

  Future<Response<dynamic>> getUserEvents(int iD) {
    return dio.get(
        "https://questronixcomph.sharepoint.com/sites/SSOPowerApps/_api/web/lists/GetByTitle('Event_v2')/Items?\$select=*,CreatedBy/ID&\$expand=CreatedBy&\$filter=CreatedById eq '$iD'",
        options: options);
  }

  Future<Response<dynamic>> getEventSchedule(int eventId) {
    return dio.get(
        "https://questronixcomph.sharepoint.com/sites/SSOPowerApps/_api/web/lists/GetByTitle('EventSchedule/Cancellation_v2')/Items?\$select=*,EventID/ID&\$expand=EventID&\$filter=EventIDId eq $eventId",
        options: options);
  }

  Future<Response<dynamic>> getParticipantsOfSchedule(int scheduleId) {
    return dio.get(
        "https://questronixcomph.sharepoint.com/sites/SSOPowerApps/_api/web/lists/GetByTitle('Participants_v2')/Items?\$select=*,ScheduleID/ID&\$expand=ScheduleID&\$filter=ScheduleIDId eq '$scheduleId'");
  }
}
