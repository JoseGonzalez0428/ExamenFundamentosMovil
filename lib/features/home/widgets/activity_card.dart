import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget{
  final String title;
  final String subtitle;
  final String trailingText;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  const ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailingText,
    required this.icon,
    required this.iconColor,
    this.iconSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: iconSize, color: iconColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(trailingText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}