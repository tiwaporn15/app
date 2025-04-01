// lib/screens/flower_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:app/models/flower.dart';
import 'package:app/screens/flower_detail_screen.dart'; // Import หน้าจอรายละเอียด

class FlowerSelectionScreen extends StatefulWidget {
  final String flowerType;
  final List<Flower> flowers;

  FlowerSelectionScreen({required this.flowerType, required this.flowers});

  @override
  _FlowerSelectionScreenState createState() => _FlowerSelectionScreenState();
}

class _FlowerSelectionScreenState extends State<FlowerSelectionScreen> {
  Flower? selectedFlower;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เลือก${widget.flowerType}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Flower>(
              hint: Text('เลือก${widget.flowerType}'),
              value: selectedFlower,
              items: widget.flowers.map((flower) {
                return DropdownMenuItem(
                  value: flower,
                  child: Text(flower.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFlower = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedFlower != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FlowerDetailScreen(flower: selectedFlower!),
                        ),
                      );
                    }
                  : null,
              child: Text('ตกลง'),
            ),
          ],
        ),
      ),
    );
  }
}
