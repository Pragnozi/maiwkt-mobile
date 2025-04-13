import 'package:flutter/material.dart';
import '../models/workout_models.dart';
import 'workout_group_card.dart';

class WorkoutGroupsGrid extends StatelessWidget {
  final List<WorkoutGroup> workoutGroups;
  final Function(WorkoutGroup) onWorkoutGroupTap;

  const WorkoutGroupsGrid({
    super.key,
    required this.workoutGroups,
    required this.onWorkoutGroupTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemCount: workoutGroups.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final workoutGroup = workoutGroups[index];
          return WorkoutGroupCard(
            workoutGroup: workoutGroup,
            onTap: () => onWorkoutGroupTap(workoutGroup),
          );
        },
      ),
    );
  }
}