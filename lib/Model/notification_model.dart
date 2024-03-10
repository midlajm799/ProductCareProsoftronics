class NotificationModel {
 
  String ?notId;
  String notification;
  String time;
  String date;

  NotificationModel(
      { this.notId,
      required this.notification,
      // required this.uid,
      required this.date,
      required this.time});

  Map<String, dynamic> tojson(id) => {
        // "uid": uid,
        "notId": id,
        "notification": notification,
        "time": time,
        "date": date
      };

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        notId: json["notId"],
        notification: json["notification"],
        // uid: json["uid"],
        date: json["date"],
        time: json["time"]);
  }
}
