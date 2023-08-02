import 'dart:convert';
import 'package:flutter_create/models/lesson.dart';
import 'package:flutter_create/models/program.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';



class ApiService {
  static const String baseUrl = 'https://632017e19f82827dcf24a655.mockapi.io/api';
  static const String programsUrl ='$baseUrl/programs';
  static const String lessonsUrl = '$baseUrl/lessons';

  Future<ProgramModel> fetchPrograms() async {
    try {
      final response = await http.get(Uri.parse(programsUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        ProgramModel programModel = ProgramModel.fromJson(jsonData);
        return programModel;
      } else {
        throw Exception('[Error with Code -> ${response.statusCode}]: $response');
      }
    } catch (error) {
      throw Exception('[Failed to fetch programs]: $error');
    }
  }

  Future<LessonModel> fetchLessons() async {
    try {
      final response = await http.get(Uri.parse(lessonsUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        LessonModel lessonModel = LessonModel.fromJson(jsonData);
        return lessonModel;
      } else {
        throw Exception('[Error with Code -> ${response.statusCode}]: $response');
      }
    } catch (error) {
      throw Exception('[Failed to fetch lessons]: $error');
    }
  }


  // Just used here to convert date and time in desired format
  String formatDateTimeString(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDate = DateFormat('MMM d, EEEE').format(dateTime);
  String formattedTime = DateFormat('hh:mm a').format(dateTime);

  return '$formattedDate at $formattedTime';
}
}
