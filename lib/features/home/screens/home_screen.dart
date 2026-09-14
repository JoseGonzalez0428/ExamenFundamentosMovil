import 'package:flutter/material.dart';
import 'package:miprimeraapp/features/home/models/activity.dart';
import 'package:miprimeraapp/features/home/profile/screens/profile_screen.dart';
import 'package:miprimeraapp/features/home/widgets/interactive_activity_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Activity> activityList = [
    Activity(
      title: "Pasos Diarios",
      subtitle: "Meta: 10 000 pasos",
      trailingText: "7 450",
      icon: Icons.directions_walk,
      iconColor: Colors.orange,
    ),
    Activity(
      title: "Rutina de Fuerza",
      subtitle: "Tren Superior / Pesas",
      trailingText: "Hecho",
      icon: Icons.fitness_center,
      iconColor: Colors.purple,
    ),
    Activity(
      title: "Natación",
      subtitle: "Meta: 1000 metros",
      trailingText: "750 m",
      icon: Icons.pool,
      iconColor: Colors.blue,
    ),
    Activity(
      title: "Ciclismo",
      subtitle: "Meta: 20 km",
      trailingText: "15 km",
      icon: Icons.directions_bike,
      iconColor: Colors.green,
    ),
    Activity(
      title: "Sesión de Box",
      subtitle: "Meta: 45 min",
      trailingText: "30 min",
      icon: Icons.sports_mma,
      iconColor: Colors.red,
    ),
    Activity(
      title: "Desayuno",
      subtitle: "Meta: 500 kcal",
      trailingText: "480 kcal",
      icon: Icons.restaurant,
      iconColor: Colors.amber,
    ),
    Activity(
      title: "Comida",
      subtitle: "Meta: 800 kcal",
      trailingText: "Pendiente",
      icon: Icons.lunch_dining,
      iconColor: Colors.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Text("Panel de actividad física 2"),
        actions:[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Perfil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            
          )
        ]
      ),
      body:
      Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: activityList.length,
          itemBuilder: (context, index) {
            final currentActivity = activityList[index];

            return InteractiveActivityCard(
              activity: currentActivity,
            );
          },
        )
        // //Column(
        //   children: [
        //     Text("Resumen de hoy", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //     const ActivityCard(
        //       title: "Pasos Diarios",
        //       subtitle: "Meta: 10 000 pasos", 
        //       trailingText: "7 450", 
        //       icon: Icons.directions_walk, 
        //       iconColor: Colors.orange
        //     ),
        //     const ActivityCard(
        //       title: "Rutina de Fuerza",
        //       subtitle: "Tren Superior / Pesas", 
        //       trailingText: "Hecho", 
        //       icon: Icons.fitness_center, 
        //       iconColor: Colors.purple
        //     ),
        //     const ActivityCard(
        //       title: "Natación",
        //       subtitle: "Meta: 1000 metros", 
        //       trailingText: "750 m", 
        //       icon: Icons.pool, 
        //       iconColor: Colors.blue
        //     ),
        //     const ActivityCard(
        //       title: "Ciclismo",
        //       subtitle: "Meta: 20 km", 
        //       trailingText: "15 km", 
        //       icon: Icons.directions_bike, 
        //       iconColor: Colors.green
        //     ),
        //     const InteractiveActivityCard(
        //       title: "Pasos Diarios",
        //       subtitle: "Meta: 10 000 pasos",
        //       trailingText: "7 450",
        //       icon: Icons.directions_walk,
        //       iconColor: Colors.orange
        //     ),
        //     const InteractiveActivityCard(
        //       title: "Rutina de Fuerza",
        //       subtitle: "Tren Superior / Pesas",
        //       trailingText: "Hecho",
        //       icon: Icons.fitness_center,
        //       iconColor: Colors.purple
        //     ),
        //     const InteractiveActivityCard(
        //       title: "Natación",
        //       subtitle: "Meta: 1000 metros",
        //       trailingText: "750 m",
        //       icon: Icons.pool,
        //       iconColor: Colors.blue
        //     ),
        //   ]
        // )
        ), 
    );
  }
}