import 'dart:convert';

ServerError serverErrorFromJson(String str) => ServerError.fromJson(json.decode(str));


class ServerError {
  String? dateTime;
  String? httpStatus;
  String? message;

  ServerError({
    this.dateTime,
    this.httpStatus,
    this.message,
  });

  factory ServerError.fromJson(Map<String, dynamic> json) => ServerError(
    dateTime: json["dateTime"],
    httpStatus: json["httpStatus"],
    message: json["message"],
  );

}