import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraIMC(),
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController peso = TextEditingController(text: '');
  TextEditingController altura = TextEditingController(text: '');
  double imc = 0;
  String classificacao = '';
  Color corResultado = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        width: double.infinity, //garante um tamanho que pegue a tela toda
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imc == 0
                  ? Text(
                      'Informe os valores de peso e altura',
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    )
                  : Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(
                            width: 10,
                            color: Colors.green,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${imc.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 42,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Peso normal',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Seu peso'),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 75,
                        child: TextField(
                          controller: peso,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixText: 'kg'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Column(
                    children: [
                      Text('Sua altura'),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 75,
                        child: TextField(
                          controller: altura,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixText: 'm'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      double pesoN = double.parse(peso.text);
                    double alturaN = double.parse(altura.text);
                    print(peso.text);
                    print(altura.text);
                    imc = pesoN / (alturaN * alturaN);
                    print(imc);  
                    });
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                  //style: TextButton.styleFrom(
                  //backgroundColor: Colors.purple
                ),
              ),
            ]),
      ),
    );
  }
}
