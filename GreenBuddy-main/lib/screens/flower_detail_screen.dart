// lib/screens/flower_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:app/models/flower.dart';

class FlowerDetailScreen extends StatelessWidget {
  final Flower flower;

  FlowerDetailScreen({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(flower.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('🌸 รายละเอียด: ${flower.details}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('🌡 อุณหภูมิ: ${flower.temperature}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('💧 ความชื้น: ${flower.humidity}',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
