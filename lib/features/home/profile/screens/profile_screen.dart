import 'package:flutter/material.dart';
import 'package:miprimeraapp/features/home/widgets/activity_card.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Perfil"),
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 40.0, color: Colors.white),
            ),
            const Text("José González", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Divider(
              height: 32.0,       // Espacio vertical total
              thickness: 1.0,     // Grosor sutil de la línea
              indent: 20.0,       // Margen al inicio
              endIndent: 20.0,    // Margen al final
              color: Colors.grey,
            ),
            Row(
              children: const [
                Expanded(
                  child: ActivityCard(
                    title: "Pasos",
                    subtitle: "10k",
                    trailingText: "8.5k",
                    icon: Icons.directions_walk,
                    iconColor: Colors.blue,
                    iconSize: 30.0,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: ActivityCard(
                    title: "Nado",
                    subtitle: "1km",
                    trailingText: "750m",
                    icon: Icons.pool,
                    iconColor: Colors.blue,
                    iconSize: 30.0,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: ()=> Navigator.pop(context), 
              child: Text("Volver")
              )
          ],
        )
      ),
    );
  }
}