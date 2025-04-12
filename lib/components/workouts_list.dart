import 'package:flutter/material.dart';
import '../models/workout_models.dart';
import 'workout_list_item.dart';

class WorkoutsList extends StatelessWidget {
  final List<Workout> workouts;
  final Function(Workout) onWorkoutTap;

  const WorkoutsList({
    Key? key,
    required this.workouts,
    required this.onWorkoutTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workouts.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return WorkoutListItem(
          workout: workout,
          onTap: () => onWorkoutTap(workout),
        );
      },
    );
  }
}