import 'dart:convert';
import 'package:flutter_create/models/lesson_model.dart';
import 'package:flutter_create/models/program_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';



class ApiService {
  final String programsUrl =
      'https://632017e19f82827dcf24a655.mockapi.io/api/programs';
  final String lessonsUrl =
      'https://632017e19f82827dcf24a655.mockapi.io/api/lessons';

  Future<ProgramModel> fetchPrograms() async {
    try {
      final response = await http.get(Uri.parse(programsUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        ProgramModel programModel = ProgramModel.fromJson(jsonData);
        print(programModel);
        return programModel;
      } else {
        throw Exception('Failed to load programs: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch programs: $error');
    }
  }

  Future<LessonModel> fetchLessons() async {
    try {
      final response = await http.get(Uri.parse(lessonsUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        LessonModel lessonModel = LessonModel.fromJson(jsonData);
        print(lessonModel.items.first.createdAt);
        return lessonModel;
      } else {
        throw Exception('Failed to load lessons: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch lessons: $error');
    }
  }


  //
  String formatDateTimeString(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDate = DateFormat('MMM d, EEEE').format(dateTime);
  String formattedTime = DateFormat('hh:mm a').format(dateTime);

  return '$formattedDate at $formattedTime';
}
}
