class WorkoutGroup {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<Workout> workouts;
  final String emphasis; // e.g., "Superior", "Inferior", etc.
  final DateTime createdAt;

  WorkoutGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.workouts,
    required this.emphasis,
    required this.createdAt,
  });
}

class Workout {
  final String id;
  final String name; // e.g., "Treino A", "Treino B", etc.
  final String description;
  final List<Exercise> exercises;
  final DateTime updatedAt;

  Workout({
    required this.id,
    required this.name,
    required this.description,
    required this.exercises,
    required this.updatedAt,
  });
}

class Exercise {
  final String id;
  final String name;
  final String muscleGroup;
  final int sets;
  final int reps;
  final int? restTime; // in seconds
  final String? notes;

  Exercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.sets,
    required this.reps,
    this.restTime,
    this.notes,
  });
}