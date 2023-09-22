class Cliente{
  String nome;
  int idade;

  Cliente({required this.nome, this.idade = -1});

  String toString(){
    return "$nome,$idade";
  }
}

abstract class ContaCorrente{
  Cliente? _cliente;
  double _saldo = 0;

  ContaCorrente (Cliente cliente, double saldo){
    this._cliente = cliente;
    this._saldo = saldo;
  }

  double get saldo => _saldo;

  set saldo(double valor){
    this._saldo = valor;
  }

  void print_saldo(){
    print(this._saldo);
  }
}

class ContaComum extends ContaCorrente{
  ContaComum(Cliente cliente, double saldo) : super(cliente, saldo);
}

class ContaEspecial extends ContaCorrente{
  double taxaDeJuros;
  /*
  Usando parâmetros posicionais
  */
  ContaEspecial(Cliente cliente, double saldo, double this.taxaDeJuros) : super(cliente, saldo);
}

class Banco{
  Map<int, ContaCorrente> contas = {};

  void addConta(int numero, ContaCorrente conta){
    contas[numero] = conta;
  }

  void transferencia(int numeroOrigem,
    int numeroDestino,
    double valor){    

     if (!contas.containsKey(numeroOrigem)){
       throw "Conta origem não existe";
     }

     if (!contas.containsKey(numeroDestino)){
       throw "Conta destino não existe";
     }

     ContaCorrente contaOrigem = contas[numeroOrigem]!;
     ContaCorrente contaDestino = contas[numeroDestino]!;
    
    if (contaOrigem.saldo >= valor){
      contaDestino.saldo += valor;
      contaOrigem.saldo -= valor;
    } else {
      throw "Saldo insuficiente";
    }    
  }

  printBanco(){
    contas.forEach(
      (k,v){
        print("$k: $v");
      }
    );
  }
}

void main(){
  Cliente u = Cliente(nome : "Ulisses", idade : 40);
  print(u);

  ContaComum ulissesComum = ContaComum(u, 200);
  ContaEspecial ulissesEspecial = ContaEspecial(u, 3000, 10);

  Banco banco = Banco();
  banco.addConta(1, ulissesComum);
  banco.addConta(2, ulissesEspecial);

  banco.printBanco();
  
  banco.transferencia(2,1,10);
}


