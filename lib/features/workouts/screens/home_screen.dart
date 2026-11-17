import 'package:fit_track_pro/core/storage/local_storage_service.dart';
import 'package:fit_track_pro/features/auth/screens/login_screen.dart';
import 'package:fit_track_pro/features/workouts/models/workout_model.dart';
import 'package:fit_track_pro/features/workouts/screens/add_workout_screen.dart';
import 'package:fit_track_pro/features/workouts/services/local_workout_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocalWorkoutService _dbService = LocalWorkoutService();

  List<WorkoutModel> _workouts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadWorkouts();
  }

  Future<void> _loadWorkouts() async {
    setState(() {
      _isLoading = true;
    });

    final workouts = await _dbService.getWorkouts();

    setState(() {
      _workouts = workouts;
      _isLoading = false;
    });
  }

  void _logout() async {
    final storage = LocalStorageService();
    await storage.deleteToken();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _navigateToAddWorkout() async {
    final newWorkout = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddWorkoutScreen()),
    );

    if (newWorkout != null && newWorkout is WorkoutModel) {
      await _dbService.insertWorkout(newWorkout);
      _loadWorkouts();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Rutina creada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  Future<void> _deleteWorkout(int id, String title) async {
    await _dbService.deleteWorkout(id);

    if (mounted) {
      _loadWorkouts();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Runtina eliminada: ${title}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis entrenamientos"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('¿Cerrar sesión?'),
                  content: Text('Tendras que volver a ingresar tus datos'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ), // TextButton
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Salir',
                        style: TextStyle(color: Colors.white),
                      ),
                    ), // ElevatedButton
                  ],
                ), // AlertDialog
              );
            },
            icon: Icon(Icons.logout),
          ), // IconButton
        ],
      ), // AppBar
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _workouts.isEmpty
          ? Center(child: Text('No tienes rutinas creadas'))
          : ListView.builder(
              itemCount: _workouts.length,
              itemBuilder: (context, index) {
                final workout = _workouts[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.fitness_center)),
                    title: Text(
                      workout.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ), // Text
                    trailing: IconButton(
                      onPressed: () =>
                          _deleteWorkout(workout.localId!, workout.title),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ), // IconButton
                    subtitle: Text(
                      '${workout.category} - ${workout.durationMinutes} min',
                    ), // Text
                  ), // ListTile
                ); // Card
              },
            ), // ListView.builder
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddWorkout,
        child: Icon(Icons.add),
      ),
    ); // Scaffold
  }
}