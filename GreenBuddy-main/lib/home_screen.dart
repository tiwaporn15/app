// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US')],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void showCategoryPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "SELECT CATEGORIES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPlantPage(category: 'ต้นไม้'),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/tree.png', width: 30),
                    const SizedBox(width: 10),
                    const Text(
                      "TREE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPlantPage(category: 'ดอกไม้'),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/flower.png', width: 30),
                    const SizedBox(width: 10),
                    const Text(
                      "FLOWER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: const Text("Home", style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm_outlined), label: ''),
        ],
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () => showCategoryPopup(context),
          child: Container(
            margin: const EdgeInsets.all(16),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.brown[800],
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: const Icon(Icons.add, size: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AddPlantPage extends StatefulWidget {
  final String category;
  const AddPlantPage({Key? key, required this.category}) : super(key: key);

  @override
  State<AddPlantPage> createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  final TextEditingController _dateController = TextEditingController();
  Color selectedBorderColor = Colors.black;

  List<String> getTypeList() {
    if (widget.category == 'ต้นไม้') {
      return ['ไม้ยืนต้น', 'ไม้ผล', 'ไม้ประดับ'];
    } else {
      return ['ไม้ดอกประดับ', 'ไม้ดอกกินได้'];
    }
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Add save functionality
            },
            child: const Text('Save', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
        centerTitle: true,
        title: const Text("Add your plant", style: TextStyle(fontSize: 20, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: selectedBorderColor.withOpacity(0.2),
                border: Border.all(color: selectedBorderColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Image.network('https://cdn-icons-png.flaticon.com/512/2909/2909769.png', width: 80),
                  const SizedBox(height: 8),
                  TextField(decoration: buildInputDecoration().copyWith(labelText: 'Name :')),
                  const SizedBox(height: 8),
                  TextField(decoration: buildInputDecoration().copyWith(labelText: 'ชนิด :')),
                  const SizedBox(height: 8),
                  TextField(decoration: buildInputDecoration().copyWith(labelText: 'DD/MM/YY :')),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorCircle(Colors.black),
                _buildColorCircle(Colors.pink),
                _buildColorCircle(Colors.green),
                _buildColorCircle(Colors.yellow),
                _buildColorCircle(Colors.purple),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: buildInputDecoration().copyWith(labelText: widget.category),
              items: getTypeList()
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            TextField(decoration: buildInputDecoration().copyWith(labelText: 'ชื่อต้นไม้')),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: buildInputDecoration().copyWith(
                labelText: 'วันที่เริ่มปลูก',
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  _dateController.text = '${pickedDate.month}/${pickedDate.day}/${pickedDate.year}';
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm_outlined), label: ''),
        ],
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBorderColor = color;
        });
      },
      child: CircleAvatar(backgroundColor: color, radius: 16),
    );
  }
}
