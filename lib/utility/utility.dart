import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsu_bakery/features/language/presentation/bloc/language/language_cubit.dart';
import 'package:hsu_bakery/services/locator.dart';
import 'package:intl/intl.dart';
import '../services/storage.dart';

class Utility {
  final Storage storage = Storage();


  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

///NEED TO USE THIS FOR CAKE MODEL
  // Future<void> saveMemberInfoToStorage(MemberInfoModel memberInfoModel) async {
  //   await storage.saveValue('name', memberInfoModel.name);
  //   await storage.saveValue('expireDate', memberInfoModel.expireDate);
  //   await storage.saveValue('memberType', memberInfoModel.memberType);
  //   await storage.saveValue('email', memberInfoModel.email);
  // }

  static TimeOfDay stringToTimeOfDay(String time) {
    int hh = 0;
    if (time.endsWith('PM')) hh = 12;
    time = time.split(' ')[0];

    return TimeOfDay(
      hour: hh +
          int.parse(time.split(":")[0]) %
              24, // in case of a bad time format entered manually by the user
      minute: int.parse(time.split(":")[1]) % 60,
    );
  }

  static Future<String> getLang() async {
    Storage storage = getIt.call();
    return await storage.readSingleValue('language') ?? 'en';
  }

  static String getText(BuildContext context, String key,
      {bool willListen = true}) {
    return BlocProvider.of<LanguageCubit>(context, listen: willListen)
        .translate(key);
  }

  static String formatDate(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    final inputFormat = DateFormat('d MMM yyyy');

    return inputFormat.format(dateTime);
  }

  static String formatDateMMDDYY(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    final inputFormat = DateFormat('MMMM d, yyyy');

    return inputFormat.format(dateTime);
  }



  String formatInteger(int number) {
    final value = NumberFormat("#,###", "en_US");

    return value.format(number);
  }

  static String formatHourMinute(int value) {
    int length = value.toString().length;
    if (length < 2) {
      return '0$value';
    } else {
      return value.toString();
    }
  }

  static String getPmAm(DayPeriod dayPeriod) {
    if (dayPeriod == DayPeriod.am) {
      return 'AM';
    } else {
      return 'PM';
    }
  }

  static String formatTime(TimeOfDay time) {
    TimeOfDay timeOfDay = time;
    timeOfDay = timeFormat24Hr(timeOfDay);

    return '${formatHourMinute(timeOfDay.hour)}:${formatHourMinute(timeOfDay.minute)} ${getPmAm(time.period)}';
  }

  static String formatDateTimeC(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDateTime =
        DateFormat('dd MMM yyyy hh:mm a').format(dateTime);
    return formattedDateTime;
  }

  static String getFormattedNotiDateTime(String inputDateTime) {
    DateTime dateTime = DateTime.parse(inputDateTime);

    DateFormat outputFormat = DateFormat('dd MMM y\nhh:mm a');

    String outputDate = outputFormat.format(dateTime);
    return outputDate;
  }

  static String formatShortDateTime(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDateTime = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDateTime;
  }

  String formatMonthDay(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDateTime = DateFormat('MMM dd').format(dateTime);
    return formattedDateTime;
  }

  String formatTZTime(DateTime dateTime) {
    final isoFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

    // Format the DateTime object in UTC to ensure it has the 'Z' (Zulu time) suffix
    final formattedDateTime = isoFormat.format(dateTime);

    return formattedDateTime;
  }

  static getStartEndDateForReserve(int period) {
    DateTime now = DateTime.now();

    DateTime endDate = DateTime(now.year, now.month, now.day + period);
    DateTime startDate = DateTime(now.year, now.month, now.day);

    DateFormat format = DateFormat('yyyy-MM-dd');

    return [format.format(startDate), format.format(endDate)];
  }

  static getStartEndDateForPoint(int period) {
    DateTime now = DateTime.now();

    DateTime endDate = now;
    DateTime startDate = DateTime(now.year, now.month, now.day - period);

    DateFormat format = DateFormat('yyyy-MM-dd');

    return [format.format(startDate), format.format(endDate)];
  }

  static timeFormat24Hr(TimeOfDay timeOfDay) {
    int hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    TimeOfDay formattedTime = TimeOfDay(hour: hour, minute: timeOfDay.minute);

    return formattedTime;
  }

  static int changeReservationDateTimeToInt(
      DateTime reservationDate, TimeOfDay reservationTime) {
    String definedIdString =
        "${reservationDate.day}${reservationDate.month}${reservationTime.hour}${reservationTime.minute}";


    return int.parse(definedIdString);
  }




  static String getDifferenceTime(String lastDateTime) {
    DateTime oldDateTime = DateTime.parse(lastDateTime);
    Duration difference = DateTime.now().difference(oldDateTime);

    if (difference.inDays > 7) {
      return getFormattedNotiDateTime(lastDateTime);
    } else if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "Just now";
    }
  }
}
