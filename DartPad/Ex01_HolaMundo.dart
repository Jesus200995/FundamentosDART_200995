void main(){
  var myName = 'Jesus';
  String myLastName = "Gomez";
  final int myDNI = 200995;
  late final int myAge;

  myName = "Jesus R";
  print ('Hola $myName $myLastName, tu matricula es $myDNI y tu edad aun no la conozco porque no se cuando naciste.');
  
// Interpolando el valor de las variables con métodos de manipulación o transformación
print('\nHola, ${myName.toUpperCase()} ${myLastName.toUpperCase()}, tu matrícula es: $myDNI y tu edad aún no la conozco, por que no se cuando naciste.');
}