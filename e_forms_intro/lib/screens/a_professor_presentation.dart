import 'package:flutter/material.dart';

class ProfessorScreen extends StatelessWidget {
  const ProfessorScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  'assets/images/ulisses.gif',
                  width: 200,
                )),
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
}
