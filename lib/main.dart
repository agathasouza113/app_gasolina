import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: GasolinaApp(),
));

class GasolinaApp extends StatefulWidget{
  @override
  _GasolinaAppState createState() => _GasolinaAppState();
}

class _GasolinaAppState extends State<GasolinaApp>{

  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _etanolController = TextEditingController();

  String _resultado = "";
  
static const Color corFundo = Color.fromARGB(255, 255, 255, 255);   
static const Color corCard = Color(0xFF1E1E1E);    
static const Color corPrimaria = Color(0xFFFF5A1F); 
static const Color corSecundaria = Color(0xFFFFC857); 
static const Color corTexto = Color(0xFFFFFFFF);   
static const Color corTextoCinza = Color(0xFFB0B0B0); 
static const Color corBorda = Color(0xFF2A2A2A); 

void _calcular(){
    final double etanol = double.tryParse(_etanolController.text)?? 0.0;
    final double gasolina = double.tryParse(_gasolinaController.text)?? 0.0;
    final double coef = etanol/gasolina;


    if(etanol <= 0 && gasolina <= 0) {
      setState((){
        _resultado = "Informe o valor dos combustíveis";
      });
    }
    
    setState(() {
      _resultado =  'Coeficiente é ${coef.toStringAsFixed(2)}\n'
                    'Abasteça com ${coef <= 0.7 ? 'Etanol' : 'Gasolina'}';
    });
    
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: corFundo,
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
            _buildCampo(controller: _gasolinaController, label: 'Etanol', icone: Icons.gas_meter),
            SizedBox(height: 16),
            //ETANOL
            _buildCampo(controller: _etanolController, label: 'Etanol', icone: Icons.gas_meter),
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
  Widget _buildCampo({
    required TextEditingController controller,
    required String label,
    required IconData icone,
  }) {
    return TextField(
        controller : controller,
    );
  }
}
