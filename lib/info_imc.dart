import 'package:flutter/material.dart';

class InfoIMC extends StatelessWidget {
  InfoIMC({
    @required this.corResultado = Colors.black,
    @required this.imc = 0,
    @required this.classificacao = '',
  });
  final Color corResultado;
  final double imc;
  final String classificacao;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(
              fontSize: 42,
              color: corResultado,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '${classificacao}',
            style: TextStyle(
              fontSize: 20,
              color: corResultado,
            ),
          ),
        ],
      ),
    );
  }
}
