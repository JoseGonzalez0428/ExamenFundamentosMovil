import 'package:flutter/material.dart';
import 'package:miprimeraapp/features/home/details/screens/detail_screen.dart';
import 'package:miprimeraapp/features/home/models/activity.dart';

class InteractiveActivityCard extends StatefulWidget {
  final Activity activity;

  const InteractiveActivityCard({
    super.key,
    required this.activity,
  });
  
  @override
  State<InteractiveActivityCard> createState() => _InteractiveActivityCardState();
}

class _InteractiveActivityCardState extends State<InteractiveActivityCard> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCompleted ? Colors.green.shade100 : Colors.white,
      elevation: 4,
      child: ListTile(
        leading: widget.activity.icon != null
            ? Icon(widget.activity.icon, size: 40, color: widget.activity.iconColor ?? Colors.black)
            : null,
        title: Text(widget.activity.title),
        subtitle: Text(isCompleted ? 'Completada' : 'Pendiente de Completar'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(activity: widget.activity),
            ),
          );
        },
        trailing: IconButton(
          onPressed: () {
            setState(() {
              isCompleted = !isCompleted;
            });
          }, 
          icon: Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}