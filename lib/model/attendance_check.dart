
class AttendanceCheck{
  bool isAttendanced;
  DateTime updateTime;
  String status;
  String reason;

  AttendanceCheck({
    required this.isAttendanced,
    required this.updateTime,
    required this.status,
    required this.reason,
  });
}