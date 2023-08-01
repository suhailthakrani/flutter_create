// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/program_model.dart';
import '../../../widgets/program_card.dart';

class ProgramsList extends StatelessWidget {
  final List<Program> programs;
  const ProgramsList({
    Key? key,
    required this.programs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: programs.length,
      itemBuilder: (context, index) {
        return ProgramCard(
          program: programs[index],
        );
      },
      separatorBuilder: (_, int index) => const SizedBox(width: 12),
    );
  }
}
