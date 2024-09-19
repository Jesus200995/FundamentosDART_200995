void main() {
  // Práctica 05: Tipos de datos Dinámicos (Dynamic-Comodín)
  dynamic errorMessage;
  
  print(""" 
  ________
  El valor inicial de errorMessage es: $errorMessage 
  Que por defecto permite establecer valores nulos
  ________""");
  
  errorMessage = "El usuario y la contraseña no coincide";
  print(""" 
  ________
  El nuevo valor de errorMessage es: $errorMessage 
  En este caso le fue asignado un String
  ________""");
  
  errorMessage = 404;
  print(""" 
  ________
  El nuevo valor de errorMessage es: $errorMessage 
  En algunos sistemas los errores son controlados por un código numérico
  ________""");
  
  errorMessage = false;
  print(""" 
  ________
  El nuevo valor de errorMessage es: $errorMessage 
  Cuando el sistema funciona correctamente el mensaje de error puede ser FALSO
  ________""");
  
  errorMessage = [400, 404, 500, 502, 505];
  print(""" 
  ________
  El nuevo valor de errorMessage es: $errorMessage 
  En caso de que el sistema detecte varios errores podría agregarlos a una lista
  ________""");
  
  errorMessage = {125, "Usuario no encontrado", true, -1025.16, 'A'};
  print(""" 
  ________
  El nuevo valor de errorMessage es: $errorMessage 
  O incluso como un conjunto (SET) de datos
  ________""");
  
  errorMessage = () => true;
  print(""" 
  ________
  El nuevo valor de errorMessage es: $errorMessage 
  Que en este caso es el resultado de una función
  ________""");
}
