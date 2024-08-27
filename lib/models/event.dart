import 'package:ssoattendance/models/schedule.dart';

class Event {
  Event(this.eventTitle, this.eventType, this.subUnit, this.schedules);
  String eventTitle;
  String eventType;
  String subUnit;
  List<Schedule> schedules;
}
