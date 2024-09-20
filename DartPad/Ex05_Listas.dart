void main() {
  // Listas (List)

  // La declaracion de una LIST esta limitada por Corchetes [BRACKETS], y cada elemento   de ser individual

  final numeros = [1, 2, 2, 2, 3, 4, 5, 6, 7, 7, 7, 8, 8, 9, 10];

  print("Ejemplo de LIST: $numeros");
  print("Confirmamos el tipo de dato para numeros que es: ${numeros.runtimeType}");
  print("Podemos acceder a cierta informacion de una lista tal como: ");
  print("El tamaño: ${numeros.length}");
  print("""
  Para acceder a los elementos debemos especificar la posicion entre []
  El primer elemento en la primera posicion es: ${numeros[0]}
  El elemento en la segunda posicion es: ${numeros[1]}, siempre respetando la posicion -1
  El ultimo elemento de la lista seria: ${numeros[numeros.length - 1]}
  ----------------------------------------------------------------
  De igual manera existen las siguientes alternativas
  Primer elemento ${numeros.first}
  Ultimo elemento ${numeros.last}
  ----------------------------------------------------------------
  Tambien tendremos acceso a algunos metodos que permiten la transformacion o filtrado del contenido
  Por ejemplo usar REVERSED, para invertir el orden original: ${numeros.reversed}
  Es importamte observar que la funcion reversed ha transformado la LIST original y la retorna como un ITERABLE
  """);

  // Iterables (ITERABLES)
  final numeroAlreves = numeros.reversed;
  print("Los iterables son estructuras de datos que DART y otros lenguajes para optimizar en terminos de velocidad el acceso a los datos y propiedades");
  print("Ejemplo de un ITERABLE: $numeroAlreves");
  print("Confirmamos el tipo de dato para numeros que es: ${numeros.runtimeType}");
  print("De igual manera podemos transformar una LIST en ITERABLE y viceversa");
  print("Convertimos el ITERABLE  a LISTA suando .toList(): ${numeroAlreves.toList()} y revificamos si tipo de dato ${numeroAlreves.toList().runtimeType}");

  //Conjunto de datos (SET)
  //Un SET es una estructura 
  print("""
  Veamos que pasa con los Conjuntos (SET)
  Convertimos el ITERABLE en un SET usando .toSET: ${numeroAlreves.toSet()}
  Podemos visualizar en el resultado que el SET a elminado los duplicados y ahora delimita los datos usando ().
  """);

  // De igual manera podemos realizar operaciones para el filtro de elementos usando .where()
  final numerosMayoresA5 = numeros.where((num) {return num > 5;});

  print("""Hemos filtrado sobre la LIST solo los elementos mayores a 5: 
  Resultado del Filtro: ${numerosMayoresA5}""");
  print("Eliminamos duplicados ... ${numerosMayoresA5.toSet()}");
  
}