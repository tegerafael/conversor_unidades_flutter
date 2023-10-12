import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  @override
  _Conversor createState() => _Conversor();
}

class _Conversor extends State<Conversor> {
  String category = 'Comprimento';
  double inputValue = 0.0;
  double result = 0.0;

 final Map<String, Map<String, double>> conversions = {
  'Comprimento': {
    'Metro': 1.0,
    'Centímetro': 100.0,
    'Milímetro': 1000.0,
  },
  'Massa': {
    'Quilograma': 1.0,
    'Grama': 1000.0,
    'Miligrama': 1000000.0,
  },
  'Tempo': {
    'Segundo': 1.0,
    'Minuto': 1 / 60,
    'Hora': 1 / 3600,
  },
};

  List<String> categories = ['Comprimento', 'Massa', 'Tempo'];
  List<String> units = [];
  String selectedUnit = '';

  @override
  void initState() {
    super.initState();
    units = conversions[category]!.keys.toList();
    selectedUnit = units[0];
  }

  void updateResult() {
    setState(() {
      result = inputValue * conversions[category]![selectedUnit]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor Universal de Unidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: category,
              onChanged: (String? newCategory) {
                setState(() {
                  category = newCategory!;
                  units = conversions[category]!.keys.toList();
                  selectedUnit = units[0];
                  updateResult();
                });
              },
              items: categories.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                  updateResult();
                });
              },
              decoration: InputDecoration(
                labelText: 'Valor',
              ),
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: selectedUnit,
              onChanged: (String? newUnit) {
                setState(() {
                  selectedUnit = newUnit!;
                  updateResult();
                });
              },
              items: units.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text('Valor convertido: $result', style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}