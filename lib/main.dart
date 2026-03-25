import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: GasolinaApp(),
));

class GasolinaApp extends StatelessWidget{
  String _resultado = "";
  void _calcular(){

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de combustível"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            //ELEMENTOS/WIDGET
            Text(
              "Encontre qual combstível vale mais a pena",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 36),

            Text(
              "Informe o preço dos combustíveis",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            //GASOLINA
            TextField(
              decoration: InputDecoration(
                labelText: "Valor da Gasolina:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            //ETANOL
            TextField(
              decoration: InputDecoration(
                labelText: "Valor do Etanol:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: _calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 36),
            Text(
              _resultado,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}