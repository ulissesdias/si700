import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class CompleteView1 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            /*
            Maneira clássica de adicionar uma
            borda. Vamos simplesmente circular
            as bordas do container.
            */
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              // Fazendo a borda circular.
              borderRadius: BorderRadius.circular(15),

              // Colocando borda em todos os lados.
              border: Border.all(
                color: Colors.black,
                width: 4.0,
              ),
            ),
            // Arredondando também a imagem.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'http://servicosweb.cnpq.br/wspessoa/servletrecuperafoto?tipo=1&id=K4713818T8'),
            ),
          ),
          const Text("Prof. Ulisses  Dias",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 2, // Default is one
              )),
          const Text(
            "Professor de Programação para Dispositivos Móveis da Faculdade de Tecnologia da Unicamp. A plataforma de desenvolvimento é o Flutter",
            style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  String getCode() {
    return """Escreva algo parecido por conta própria
""";
  }
}
