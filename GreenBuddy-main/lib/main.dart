import 'package:flutter/material.dart';
import 'package:app/home_screen.dart'; // หรือพาธไปยังหน้าจอเริ่มต้นของคุณ

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ข้อมูลพืช', // หรือชื่อแอปพลิเคชันของคุณ
      theme: ThemeData(
        primarySwatch: Colors.green, // หรือธีมสีที่คุณต้องการ
      ),
      home: const HomePage(), // หรือ Widget เริ่มต้นที่คุณต้องการแสดง
    );
  }
}