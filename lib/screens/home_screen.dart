import 'package:flutter/material.dart';
import '../models/workout_models.dart';
import '../components/workout_groups_grid.dart';
import '../components/workouts_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data for demonstration
  // In a real app, this would come from an API or local database
  late List<WorkoutGroup> workoutGroups;
  
  @override
  void initState() {
    super.initState();
    // Initialize mock data
    _initializeMockData();
  }

  void _initializeMockData() {
    // Example workout exercises
    final exercises1 = [
      Exercise(
        id: '1',
        name: 'Supino Reto',
        muscleGroup: 'Peitoral',
        sets: 4,
        reps: 10,
        restTime: 60,
      ),
      Exercise(
        id: '2',
        name: 'Puxada Frontal',
        muscleGroup: 'Costas',
        sets: 4,
        reps: 12,
        restTime: 60,
      ),
      Exercise(
        id: '3',
        name: 'Elevação Lateral',
        muscleGroup: 'Ombros',
        sets: 3,
        reps: 15,
        restTime: 45,
      ),
    ];
    
    final exercises2 = [
      Exercise(
        id: '4',
        name: 'Crucifixo',
        muscleGroup: 'Peitoral',
        sets: 3,
        reps: 12,
        restTime: 60,
      ),
      Exercise(
        id: '5',
        name: 'Remada Curvada',
        muscleGroup: 'Costas',
        sets: 4,
        reps: 10,
        restTime: 60,
      ),
      Exercise(
        id: '6',
        name: 'Rosca Direta',
        muscleGroup: 'Bíceps',
        sets: 3,
        reps: 12,
        restTime: 45,
      ),
    ];
    
    final exercises3 = [
      Exercise(
        id: '7',
        name: 'Agachamento',
        muscleGroup: 'Quadríceps',
        sets: 4,
        reps: 10,
        restTime: 90,
      ),
      Exercise(
        id: '8',
        name: 'Leg Press',
        muscleGroup: 'Quadríceps',
        sets: 4,
        reps: 12,
        restTime: 90,
      ),
      Exercise(
        id: '9',
        name: 'Stiff',
        muscleGroup: 'Posterior de coxa',
        sets: 3,
        reps: 12,
        restTime: 60,
      ),
    ];

    // Example workouts
    final workoutsA = [
      Workout(
        id: '1',
        name: 'Treino A',
        description: 'Peito, Costas e Ombro',
        exercises: exercises1,
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Workout(
        id: '2',
        name: 'Treino B',
        description: 'Pernas e Abdômen',
        exercises: exercises3,
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Workout(
        id: '3',
        name: 'Treino C',
        description: 'Bíceps, Tríceps e Antebraço',
        exercises: exercises2,
        updatedAt: DateTime.now(),
      ),
    ];
    
    final workoutsB = [
      Workout(
        id: '4',
        name: 'Treino A',
        description: 'Quadríceps e Glúteos',
        exercises: exercises3,
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Workout(
        id: '5',
        name: 'Treino B',
        description: 'Posterior e Panturrilhas',
        exercises: exercises3,
        updatedAt: DateTime.now(),
      ),
    ];

    // Example workout groups
    workoutGroups = [
      WorkoutGroup(
        id: '1',
        name: 'Hipertrofia Superior',
        description: 'Treino focado em ganho de massa muscular na parte superior',
        imageUrl: 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
        workouts: workoutsA,
        emphasis: 'Superior',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      WorkoutGroup(
        id: '2',
        name: 'Foco nas Pernas',
        description: 'Treino intenso para desenvolvimento das pernas',
        imageUrl: 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
        workouts: workoutsB,
        emphasis: 'Inferior',
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
    ];
    
    // Uncomment to test with only one workout group
    // workoutGroups = [workoutGroups[0]];
  }

  void _onWorkoutGroupTap(WorkoutGroup workoutGroup) {
    // In a real app, this would navigate to a detail screen
    // For now, let's just print to console
    print('Workout Group Tapped: ${workoutGroup.name}');
  }
  
  void _onWorkoutTap(Workout workout) {
    // In a real app, this would navigate to a workout detail screen
    // For now, let's just print to console
    print('Workout Tapped: ${workout.name}');
  }

  @override
  Widget build(BuildContext context) {
    final hasMultipleGroups = workoutGroups.length > 1;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          hasMultipleGroups ? 'Meus Grupos de Treino' : workoutGroups[0].name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            // In a real app, this would refresh data from a backend
            setState(() {
              _initializeMockData();
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 16, bottom: 80),
            child: hasMultipleGroups
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Escolha seu grupo de treino',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      WorkoutGroupsGrid(
                        workoutGroups: workoutGroups,
                        onWorkoutGroupTap: _onWorkoutGroupTap,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                workoutGroups[0].emphasis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Ênfase',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Seus treinos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      WorkoutsList(
                        workouts: workoutGroups[0].workouts,
                        onWorkoutTap: _onWorkoutTap,
                      ),
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement functionality to add a new workout or workout group
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}