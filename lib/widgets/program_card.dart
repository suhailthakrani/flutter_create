// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/program_model.dart';

class ProgramCard extends StatelessWidget {
  final Program program;
  const ProgramCard({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
          Image.asset("assets/pd1.png"),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  program.category.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Flexible(
                  child: Text(
                    program.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "${program.lessons} lessons",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
