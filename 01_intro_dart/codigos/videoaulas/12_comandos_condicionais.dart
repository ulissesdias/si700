enum Disciplinas { SI700, SI202, SI101, SI100 }

void main() {
  var professor = "Pedro";
  print("");
  if (professor == "Ulisses" || professor == "Marco") {
    print("Professor FT/Unicamp");
  } else if (professor == "Pedro") {
    print("Professor Conhecido de algum lugar");
  } else {
    print("Pessoa Desconhecida");
  }

  /*
    Switch --> Pode lidar com tipos não booleanos
  */
  var disciplina = Disciplinas.SI202;
  switch (disciplina) {
    case Disciplinas.SI700:
      print("Ambos os Semestres");
      break;
    case Disciplinas.SI202:
      print("Segundo Semestre");
      break;
    case Disciplinas.SI101:
    case Disciplinas.SI100:
      print("Primeiro Semestre");
      break;
  }
}
