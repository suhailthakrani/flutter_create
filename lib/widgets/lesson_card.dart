// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_create/models/lesson_model.dart';
import 'package:flutter_create/services/api_service.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  const LessonCard({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final convertedDate = ApiService().formatDateTimeString(lesson.createdAt);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: width * 0.68,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 5),
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade100,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/pd1.png',
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.category.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Flexible(
                  child: Text(
                    lesson.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      convertedDate,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    if (lesson.locked)
                      InkWell(
                        onTap: () {
                          // Perform action on Locked Lesson
                        },
                        child: const Icon(
                          Icons.lock_outline,
                        ),
                      )
                    else
                      const SizedBox()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
