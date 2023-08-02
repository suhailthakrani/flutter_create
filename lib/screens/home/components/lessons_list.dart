// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_create/models/lesson.dart';
import 'package:flutter_create/widgets/lesson_card.dart';
import '../../../models/program.dart';
import '../../../widgets/program_card.dart';

class LessonsList extends StatelessWidget {
  final List<Lesson> lessons;
  const LessonsList({
    Key? key,
    required this.lessons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return LessonCard(
          lesson: lessons[index],
        );
      },
      separatorBuilder: (_, int index) => const SizedBox(width: 12),
    );
  }
}
