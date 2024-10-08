void main() {
  // Caso 1: Nuevo paciente que se registra el día de hoy
  print("========= Caso 1: Nuevo paciente =========");
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

  // Caso 2: Paciente nuevo que alguna vez fue trabajador del hospital
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
  
  paciente2.trabajadorPrevio = true;  // El paciente fue trabajador del hospital
  print(paciente2);

  // Caso 3: Paciente que acaba de fallecer
  print("\n========= Caso 3: Paciente fallecido =========");
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
  
  paciente3.registrarDefuncion();
  print(paciente3);
}

// Enum para el tipo de seguro
enum TipoSeguro { IMSS, ISSSTE, SeguroPopular }

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
    this.isActive = true,
  }) : fechaRegistro = fechaRegistro ?? DateTime.now();

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

// Clase Paciente que hereda de Persona
class Paciente extends Persona {
  String NSS;
  String tipoSeguro;
  String estatusVida; // "Vivo" o "Fallecido"
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
    this.trabajadorPrevio = false,
  }) : super(
          ID: ID,
          name: name,
          firstLastName: firstLastName,
          secondLastName: secondLastName,
          gender: gender,
          birthdate: birthdate,
        ) {
    this.fechaUltimaCita = fechaUltimaCita ?? DateTime.now();
  }

  // Método para registrar la defunción del paciente
  void registrarDefuncion() {
    estatusVida = "Fallecido";
    isActive = false;
  }

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
