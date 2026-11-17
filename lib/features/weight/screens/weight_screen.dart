import 'package:fit_track_pro/features/weight/models/weight_model.dart';
import 'package:fit_track_pro/features/weight/screens/add_weight_screen.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  List<WeightModel> registros = [];

  Future<void> _navigateToAddWeight() async {
    final newWeight = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddWeightScreen()),
    );

    if (newWeight != null && newWeight is WeightModel) {
      setState(() {
        registros.add(newWeight);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registro de peso agregado exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi peso"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: registros.isEmpty
          ? Center(child: Text('No hay registros'))
          : ListView.builder(
              itemCount: registros.length,
              itemBuilder: (context, index) {
                final registro = registros[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.monitor_weight)),
                    title: Text(
                      '${registro.pesoKilos} kg',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(registro.fecha),
                  ),
                );
              },
            ), // ListView.builder
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddWeight,
        child: Icon(Icons.add),
      ),
    );
  }
}