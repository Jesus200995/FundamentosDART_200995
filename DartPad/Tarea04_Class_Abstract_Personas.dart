void main() {
  // ========= Caso de Prueba 1: Nuevo paciente registrado hoy =========
  print("========= Caso 1: Nuevo paciente registrado hoy =========");
  final paciente1 = Paciente(
    ID: 1,
    name: "Carlos",
    firstLastName: "Hernández",
    secondLastName: "Gómez",
    gender: "Hombre",
    birthdate: DateTime(1990, 5, 10),
    NSS: "123456789",
    tipoSeguro: "IMSS",
    estatusVida: "Vivo",
    estatusMedico: "Estable",
  );
  
  print(paciente1);

  // ========= Caso de Prueba 2: Paciente que fue trabajador del hospital =========
  print("\n========= Caso 2: Paciente que fue trabajador del hospital =========");
  final paciente2 = Paciente(
    ID: 2,
    name: "Marta",
    firstLastName: "López",
    secondLastName: "Ramírez",
    gender: "Mujer",
    birthdate: DateTime(1985, 2, 25),
    NSS: "987654321",
    tipoSeguro: "ISSSTE",
    estatusVida: "Vivo",
    estatusMedico: "En tratamiento",
  );
  
  paciente2.trabajadorPrevio = true; // Marcamos como trabajador previo
  print(paciente2);

  // ========= Caso de Prueba 3: Paciente que acaba de fallecer =========
  print("\n========= Caso 3: Paciente que acaba de fallecer =========");
  final paciente3 = Paciente(
    ID: 3,
    name: "Luis",
    firstLastName: "Pérez",
    secondLastName: "Martínez",
    gender: "Hombre",
    birthdate: DateTime(1975, 11, 30),
    NSS: "1122334455",
    tipoSeguro: "Seguro Popular",
    estatusVida: "Vivo",
    estatusMedico: "Crítico",
  );
  
  paciente3.registrarDefuncion(); // Llamamos al método para registrar defunción
  print(paciente3);
}

// ========= 1. Definición de la Clase Abstracta Persona =========
// Clase abstracta Persona
abstract class Persona {
  int ID;
  String name;
  String firstLastName;
  String? secondLastName;
  String gender;
  DateTime birthdate;
  DateTime fechaRegistro;
  bool isActive;

  Persona({
    required this.ID,
    required this.name,
    required this.firstLastName,
    this.secondLastName,
    required this.gender,
    required this.birthdate,
    DateTime? fechaRegistro,
    this.isActive = true, // Se inicializa por defecto como "activo"
  }) : fechaRegistro = fechaRegistro ?? DateTime.now(); // Fecha de registro actual por defecto

  @override
  String toString() {
    String formateDate = "${birthdate.day.toString().padLeft(2, '0')}/" +
        "${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";
    String formateCreateDate = "${fechaRegistro.day.toString().padLeft(2, '0')}/" +
        "${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year}";

    return """
    --------------------------------------------------------------
    DATOS DE LA PERSONA
    --------------------------------------------------------------
    ID: $ID
    Nombre: $name $firstLastName $secondLastName
    Género: $gender
    Fecha de Nacimiento: $formateDate
    Activo: $isActive
    Fecha de Registro: $formateCreateDate
    --------------------------------------------------------------
    """;
  }
}

// ========= 2. Definición de la Clase Paciente =========
// Clase Paciente que hereda de Persona
class Paciente extends Persona {
  // ========= 3. Declaración de las Propiedades de Paciente =========
  String NSS;
  String tipoSeguro;
  String estatusVida;
  String estatusMedico;
  DateTime? fechaUltimaCita;
  bool trabajadorPrevio;

  Paciente({
    required int ID,
    required String name,
    required String firstLastName,
    String? secondLastName,
    required String gender,
    required DateTime birthdate,
    required this.NSS,
    required this.tipoSeguro,
    required this.estatusVida,
    required this.estatusMedico,
    DateTime? fechaUltimaCita,
    this.trabajadorPrevio = false, // Por defecto, el paciente no fue trabajador del hospital
  }) : super(
          ID: ID,
          name: name,
          firstLastName: firstLastName,
          secondLastName: secondLastName,
          gender: gender,
          birthdate: birthdate,
        ) {
    // ========= 4. Sobrescritura de las Propiedades =========
    // Fecha de última cita se inicializa con la fecha actual por defecto
    this.fechaUltimaCita = fechaUltimaCita ?? DateTime.now();
  }

  // ========= 6. Sobrescritura de la Función registrarDefuncion() =========
  // Método para registrar la defunción del paciente
  void registrarDefuncion() {
    estatusVida = "Fallecido";
    isActive = false; // Cambia el estado de la persona a "inactivo"
  }

  // ========= Sobrescritura del método toString() para mostrar datos de paciente =========
  @override
  String toString() {
    String baseInfo = super.toString();
    String formateUltimaCita = "${fechaUltimaCita?.day.toString().padLeft(2, '0')}/" +
        "${fechaUltimaCita?.month.toString().padLeft(2, '0')}/${fechaUltimaCita?.year}";
    String trabajadorInfo = trabajadorPrevio ? "Sí" : "No";

    return """
    $baseInfo
    --------------------------------------------------------------
    DATOS DEL PACIENTE
    --------------------------------------------------------------
    NSS: $NSS
    Tipo de Seguro: $tipoSeguro
    Estatus de Vida: $estatusVida
    Estatus Médico: $estatusMedico
    Fecha de Última Cita: $formateUltimaCita
    Trabajador Previo: $trabajadorInfo
    --------------------------------------------------------------
    """;
  }
}
