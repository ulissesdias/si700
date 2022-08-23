// Exercícios baseados em:
// https://edabit.com/

//////////////////////////////////////////////////
// Crie uma função que retorne True e depois execute o seu
// código. Esse passo inicial é apenas para você entender o que está
// acontecendo.
//////////////////////////////////////////////////
returnTrue(param){
  return true;
}

//////////////////////////////////////////////////
// Crie uma função que, dado um número, retorna true se ele ele é
// menor ou igual a zero.
//
// Exemplo:
// 5  --> False
// 0  --> True
// -3 --> True
//
// Você pode assumir que a função receberá um número. Este exercício
// não está tentando pregar uma peça, ele é realmente fácil.
//////////////////////////////////////////////////
lessThanOrEqualToZero(num) {

}

//////////////////////////////////////////////////
// Crie uma função que recebe um número inteiro como parâmetro e
// retorna "even" para cada número par e "odd" para cada número ímpar.
//
// Exemplo:
// 3   --> "odd"
//
// 146 --> "even"
//
// 19  --> "odd"
//
// Retorne "even" ou "odd" com letras minúsculas.
//////////////////////////////////////////////////
isEvenOrOdd(num){

}

//////////////////////////////////////////////////
// Crie uma função que recebe uma lista de números inteiros e retorna
// o menor número da lista.
//
// Exemplo:
// [34, 15, 88, 2] --> 2
// [34, -345, -1, 100] --> -345
// [7, 7, 7] --> 7
//////////////////////////////////////////////////
findSmallestNumber(lst){

}

//////////////////////////////////////////////////
// Crie uma função que aceita uma lista e retorna o último elemento
// dessa lista.
//
// Exemplo
// [1, 2, 3] --> 3
//
// ['a', 'b', 'c'] --> 'c'
//
// [True, False, True] --> True
//
// [7, 'String', False] --> False
//////////////////////////////////////////////////
getLastItem(lst){

}

//////////////////////////////////////////////////
// Crie uma função que recebe uma lista de números e retorna o maior
// número na lista.
//
// Exemplo:
//
// [4, 5, 1, 3] --> 5
//
// 
// [1000, 1001, -857, 1] --> 1001
//////////////////////////////////////////////////
findLargestNum(lst){

}

//////////////////////////////////////////////////
// Escreva uma função que recebe uma lista de inteiros e retorna a
// soma dos valores absolutos de cada elemento da lista.
//
// Exemplo:
//
// [2, -1, 4, 8, 10] --> 25
//
// [-3, -4, -10, -2, -3] --> 22
//
// [2, 4, 6, 8, 10] --> 30
// 
// [-1] --> 1
//////////////////////////////////////////////////
computeAbsSum(nums) {

}

//////////////////////////////////////////////////
// Crie uma função que recebe uma lista de listas com números
// (inteiros e reais) e retorne uma nova lista com os maiores números
// de cada uma.
//
// Exemplo:
//
// [[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]] --> [7, 90, 2] --> 99
//
// [[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]] --> [-34, -2, 7] --> -29
//
//////////////////////////////////////////////////
findLargestNumsSum(numList){

}

//////////////////////////////////////////////////
// Crie uma função que recebe uma string e devolve o número de
// palavras.
//
// Exemplo:
//
// "Apenas um exemplo de teste" --> 5
// "Isso é um teste" --> 4
// "Teste fácil" --> 2
//
//////////////////////////////////////////////////
getWordCount(txt){

}

//////////////////////////////////////////////////
// Crie uma função que recebe uma string e devolve todas as palavras
// que tenham exatamente 5 letras em um conjunto. 
//
// Exemplo:
// "vozes veladas veludosas vozes" --> {vozes}
// "joão amava teresa que amava raimundo que amava maria" --> {João, Maria}
//////////////////////////////////////////////////
getFiveLetters(txt) {

}

//////////////////////////////////////////////////
// Crie uma função que recebe uma string e verifica se tem o número de
// 'x's igual ao número de 'o's. A sua função retornará "True" ou
// "False".
//
// Exemplo:
//
// "ooxx" --> True
//
// "xooxx" --> False
// 
// "ooxXm" --> True 
//
// "zpzpzpp" --> True 
//
// "zzoo" --> False
//////////////////////////////////////////////////
xo(text){

}

// Retorna true se todos os elementos estiverem em diferentes quantidades.

allElementsDifferent(lst){

}

//////////////////////////////////////////////////
///// Função Principal
//////////////////////////////////////////////////
void main(){
  print(returnTrue(null));
  print(lessThanOrEqualToZero(10) == false);
  print(isEvenOrOdd(10) == "even");
  print(findSmallestNumber([5,2,9]) == 2);
  print(getLastItem(["a",1,true]) == true);
  print(findLargestNum([5,2,9]) == 9);
  print(computeAbsSum([5,-2,9]) == 16);
  print(findLargestNumsSum([[5,2,9],[4,0],[7,10,3]]) == 23);
  print(getWordCount("eu sou a luz das estrelas") == 6);
  print(getFiveLetters("Amo-te tanto, meu amor... não cante") == 2);
  print(xo("xingxaoxang") ==false);
  print(allElementsDifferent([1,1,1,"1","1", 2,2]) == false);
  print(allElementsDifferent([1,1,1,"1","1", 2]) == true);
}
