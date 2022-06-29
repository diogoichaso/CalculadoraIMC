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
  void dispose() {//libera a memória das variávies com a finalização do widget
    peso = TextEditingController(text: '');
    altura = TextEditingController(text: '');
    super.dispose();
  }

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
                            color: corResultado,
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
                            '${classificacao}',
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
                      Slider(
                        activeColor: Colors.purple,
                        value: 70,
                        onChanged: (peso){
                          
                        },
                        min: 50,
                        max: 150,
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
                      try {
                        double pesoN = double.parse(peso.text);
                        double alturaN = double.parse(altura.text);
                        print(peso.text);
                        print(altura.text);
                        imc = pesoN / (alturaN * alturaN);
                        print(imc);
                        classificacao = getClassificacaoIMC(imc);
                        print(classificacao);
                        corResultado = getCorIMC(imc);
                        print(corResultado);
                      } on Exception {
                        print('Digite um valor válido');
                        imc = 0;
                        classificacao = '';
                        peso.text = '';
                        altura.text = '';
                      }
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

String getClassificacaoIMC(double imc) {
  if (imc <= 18.5) {
    return 'Abaixo do peso';
  } else if (imc <= 24.9) {
    return 'Peso normal';
  } else if (imc <= 29.9) {
    return 'Sobrepeso';
  } else if (imc <= 34.9) {
    return 'Obesidade grau I';
  } else if (imc <= 39.9) {
    return 'Obesidade grau II';
  } else {
    return 'Obesidade grau III';
  }
}

Color getCorIMC(double imc) {
  if (imc <= 18.5) {
    return Colors.blue;
  } else if (imc <= 24.9) {
    return Colors.green;
  } else if (imc <= 29.9) {
    return Colors.yellow;
  } else if (imc <= 34.9) {
    return Colors.orange;
  } else if (imc <= 39.9) {
    return Color.fromARGB(255, 233, 85, 85);
  } else {
    return Color.fromARGB(255, 244, 54, 54);
  }
}
