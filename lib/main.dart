import 'package:flutter/material.dart';

void main() {
  runApp(DressCodeApp());
}

class DressCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DressCodeGenerator(),
    );
  }
}

class DressCodeGenerator extends StatefulWidget {
  @override
  _DressCodeGeneratorState createState() => _DressCodeGeneratorState();
}

class _DressCodeGeneratorState extends State<DressCodeGenerator> {
  final TextEditingController colorController = TextEditingController();
  String selectedDressType = "Baby Frock";
  String generatedCode = "";

  final Map<String, String> dressTypeCodes = {
    "Baby Frock": "BF",
    "Baby Skirt and Top": "BST",
    "Baby Palazzo and Top": "BPT",
    "Kids Frock": "KF",
    "Anarkali Set": "AS",
    "Top": "TP",
  };

  final Map<String, String> colorCodes = {
    "Red": "RD",
    "Blue": "BL",
    "Green": "GR",
    "Yellow": "YL",
    "Pink": "PK",
    "Black": "BK",
    "White": "WH",
  };

  void generateCode() {
    String dressCode = dressTypeCodes[selectedDressType] ?? "XX";
    String colorCode = colorCodes[colorController.text.trim()] ?? "XX";
    setState(() {
      generatedCode = "ET-$dressCode-$colorCode";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dress Code Generator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedDressType,
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  selectedDressType = value!;
                });
              },
              items: dressTypeCodes.keys.map((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Text(key),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextField(
                controller: colorController,
                decoration: InputDecoration(
                  labelText: "Enter Color (Red, Blue, etc.)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateCode,
              child: Text("Generate Code"),
            ),
            SizedBox(height: 20),
            Text(
              "Generated Code: $generatedCode",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}