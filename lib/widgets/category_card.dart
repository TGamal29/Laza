import 'package:flutter/material.dart';

class CategotyCard extends StatelessWidget {
  const CategotyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFF5F6FA),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          'Beauty',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
