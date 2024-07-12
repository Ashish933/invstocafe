import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



abstract class DateTimeUtil {
  static const String mmddyyyy = 'MM-dd-yyyy';
  static const String hhmma = 'hh:mm a';
  static final DateFormat dateFormat1 = DateFormat("yyyy-MM-dd hh:mm a");
  static final DateFormat serverDateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  static final DateFormat bookingDisplayFormat =
  DateFormat("EE MMM dd, yyyy HH:mm");
  static final DateFormat ddMMYYYYHHMMFormat = DateFormat("dd MMM yyyy HH:mm");
  static final DateFormat ddMMYYYYHHMM1Format =
  DateFormat("dd MMM yyyy hh:mm a");
  static final DateFormat yearMonthDayFormat = DateFormat("yyyy-MM-dd");
  static final DateFormat ddMMMFormat = DateFormat("dd MMM");
  static final DateFormat ddMMMYYYYFormat = DateFormat("dd MMM yyyy");
  static final DateFormat hhMMFormat = DateFormat("HH.mm");
  static String monthAndYear(DateTime date) {
    return DateFormat('MMMM, yyyy').format(date);
  }

  static DateTime? parse(String? str) {
    if (str?.isEmpty ?? true) return null;
    return dateFormat1.parse(str!);
  }

  /// used to format date time to string



  static String month(int monthNum) {
    List<String> month = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return month[monthNum - 1];
  }

  /*static DateTime parseDeapartureDateTime(String str) {
    if (str == null || str.isEmpty) return null;
    return DateConstants.yearMonthDayFormat.parse(str);
  }*/

  static DateTime parseDateTime(String str) {
    if (str.isEmpty) return DateTime.now();
    return DateTime.parse(str);
  }









  static String dealDoxDateFormat(String date) {
    return DateFormat("dd/MM/yyyy").format(
      DateTime.parse(date),
    );
  }

  static String formatedTime(TimeOfDay selectedTime) {
    var replacingTime = selectedTime.to24hours();
    // .replacing(
    // hour: selectedTime.hour, minute: selectedTime.minute);

    // String formattedTime = "${replacingTime.hour}:${replacingTime.minute}";

    return replacingTime;
  }

  static String addZeroInMonth(int month) {
    return month < 10 ? "0$month" : "$month";
  }


  static TimeOfDay? stringToTimeOfDay(String? endTime) {
    if (endTime?.isNotEmpty ?? false) {
      List<String> parts = endTime!.split(":");
      int hour = int.parse(parts[0]);
      int min = int.parse(parts[1].split(" ").first);
      return TimeOfDay(hour: hour, minute: min);
    } else {
      return null;
    }
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
