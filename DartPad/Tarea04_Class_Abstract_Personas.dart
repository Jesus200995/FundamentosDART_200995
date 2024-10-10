void main() {
  // ========= Caso de Prueba 1: Nuevo paciente registrado hoy =========
  print("========= Caso 1: Nuevo paciente registrado hoy =========");
  final paciente1 = Paciente(
    personaID: 1,
    nss: "123456789",
    tipoSeguro: "IMSS",
    fechaUltimaCita: DateTime.now(),
    estatusMedico: "Estable",
    estatusVida: "Vivo",
    estatus: true,
    fechaRegistro: DateTime.now(),
    fechaActualizacion: DateTime.now(),
    titulo: "Dr.",
    nombre: "Carlos",
    primerApellido: "Hernández",
    segundoApellido: "Gómez",
    curp: "HEGC900510HDFLRL01",
    genero: "M",
    grupoSanguineo: "O+",
    fechaNacimiento: DateTime(1990, 5, 10),
  );

  print(paciente1);
  paciente1.actualizarEstatusMedico("En tratamiento"); // Actualiza el estatus médico
  print("Información después de actualizar estatus médico:\n${paciente1}\n"); // Muestra la información actualizada

  // ========= Caso de Prueba 2: Paciente que fue trabajador del hospital =========
  print("========= Caso 2: Paciente que fue trabajador del hospital =========");
  final paciente2 = Paciente(
    personaID: 2,
    nss: "987654321",
    tipoSeguro: "ISSSTE",
    fechaUltimaCita: DateTime.now(),
    estatusMedico: "En tratamiento",
    estatusVida: "Vivo",
    estatus: true,
    fechaRegistro: DateTime.now(),
    fechaActualizacion: DateTime.now(),
    titulo: "Lic.",
    nombre: "Marta",
    primerApellido: "López",
    segundoApellido: "Ramírez",
    curp: "LORM850225MDFLRT01",
    genero: "F",
    grupoSanguineo: "A+",
    fechaNacimiento: DateTime(1985, 2, 25),
  );

  print(paciente2);

  // ========= Caso de Prueba 3: Paciente que acaba de fallecer =========
  print("========= Caso 3: Paciente que acaba de fallecer =========");
  final paciente3 = Paciente(
    personaID: 3,
    nss: "1122334455",
    tipoSeguro: "Seguro Popular",
    fechaUltimaCita: DateTime.now(),
    estatusMedico: "Crítico",
    estatusVida: "Vivo",
    estatus: true,
    fechaRegistro: DateTime.now(),
    fechaActualizacion: DateTime.now(),
    titulo: "Ing.",
    nombre: "Luis",
    primerApellido: "Pérez",
    segundoApellido: "Martínez",
    curp: "PEML750530HDFLRL02",
    genero: "M",
    grupoSanguineo: "B+",
    fechaNacimiento: DateTime(1975, 11, 30),
  );

  paciente3.registrarDefuncion(); // Llamamos al método para registrar defunción
  print("Información después de registrar defunción:\n${paciente3}\n");
}

// ========= 1. Definición de la Clase Abstracta <Persona> =========
// Clase abstracta Persona
abstract class Persona {
  int personaID; // ID de la persona
  String titulo; // Título de la persona (ej. Dr., Lic.)
  String nombre; // Nombre de la persona
  String primerApellido; // Primer apellido de la persona
  String? segundoApellido; // Segundo apellido de la persona (opcional)
  String curp; // CURP de la persona
  String genero; // Género de la persona
  String grupoSanguineo; // Grupo sanguíneo de la persona
  DateTime fechaNacimiento; // Fecha de nacimiento de la persona
  bool estatus; // true = activo, false = inactivo
  DateTime fechaRegistro; // Fecha de registro de la persona
  DateTime fechaActualizacion; // Fecha de actualización de los datos de la persona

  // Constructor de la clase Persona
  Persona({
    required this.personaID,
    required this.titulo,
    required this.nombre,
    required this.primerApellido,
    this.segundoApellido,
    required this.curp,
    required this.genero,
    required this.grupoSanguineo,
    required this.fechaNacimiento,
    this.estatus = true,
    DateTime? fechaRegistro,
    DateTime? fechaActualizacion,
  })  : fechaRegistro = fechaRegistro ?? DateTime.now(), // Fecha de registro actual por defecto
        fechaActualizacion = fechaActualizacion ?? DateTime.now(); // Fecha de actualización actual por defecto

  // Método para mostrar la información de la persona
  @override
  String toString() {
    String formateDate = "${fechaNacimiento.day.toString().padLeft(2, '0')}/" +
        "${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}";
    String formateCreateDate = "${fechaRegistro.day.toString().padLeft(2, '0')}/" +
        "${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} " +
        "${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}";
    String formateUpdateDate = "${fechaActualizacion.day.toString().padLeft(2, '0')}/" +
        "${fechaActualizacion.month.toString().padLeft(2, '0')}/${fechaActualizacion.year} " +
        "${fechaActualizacion.hour.toString().padLeft(2, '0')}:${fechaActualizacion.minute.toString().padLeft(2, '0')}";

    return """
    --------------------------------------------------------------
    DATOS DE LA PERSONA
    --------------------------------------------------------------
    ID: $personaID
    Título: $titulo
    Nombre: $nombre $primerApellido ${segundoApellido ?? ''} 
    CURP: $curp
    Género: $genero
    Grupo Sanguíneo: $grupoSanguineo
    Fecha de Nacimiento: $formateDate
    Estatus: ${estatus ? 'Activo' : 'Inactivo'}
    Fecha de Registro: $formateCreateDate
    Fecha de Actualización: $formateUpdateDate
    --------------------------------------------------------------
    """;
  }
}

// ========= 2. Definición de la Clase <Paciente> =========
// Clase Paciente que hereda de Persona
class Paciente extends Persona {
  // ========= 3. Declaración de las Propiedades de la Clase <Paciente> =========
  String nss; // Número de Seguro Social
  String tipoSeguro; // Tipo de Seguro
  DateTime fechaUltimaCita; // Fecha de la última cita
  String estatusMedico; // Estatus médico del paciente
  String estatusVida; // Estatus de vida del paciente (Vivo, Finado, Coma, Vegetativo)
  
  // Constructor de la clase Paciente
  Paciente({
    required int personaID,
    required this.nss,
    required this.tipoSeguro,
    required this.fechaUltimaCita,
    required this.estatusMedico,
    required this.estatusVida,
    required bool estatus,
    required DateTime fechaRegistro,
    required DateTime fechaActualizacion,
    required String titulo,
    required String nombre,
    required String primerApellido,
    String? segundoApellido,
    required String curp,
    required String genero,
    required String grupoSanguineo,
    required DateTime fechaNacimiento,
  }) : super(
          personaID: personaID,
          titulo: titulo,
          nombre: nombre,
          primerApellido: primerApellido,
          segundoApellido: segundoApellido,
          curp: curp,
          genero: genero,
          grupoSanguineo: grupoSanguineo,
          fechaNacimiento: fechaNacimiento,
          estatus: estatus,
          fechaRegistro: fechaRegistro,
          fechaActualizacion: fechaActualizacion,
        );

  // ========= 5. Métodos CRUD de la Clase <Paciente, Persona> =========
  
  // Método para actualizar el estatus médico del paciente
  void actualizarEstatusMedico(String nuevoEstatus) {
    estatusMedico = nuevoEstatus;
    fechaActualizacion = DateTime.now(); // Actualiza la fecha de modificación
  }

  // Método para registrar la cita más reciente
  void registrarCita(DateTime fechaCita) {
    fechaUltimaCita = fechaCita;
    fechaActualizacion = DateTime.now(); // Actualiza la fecha de modificación
  }

  // Método para obtener información del paciente
  Map<String, dynamic> obtenerInformacion() {
    return {
      "Persona_ID": personaID,
      "NSS": nss,
      "Tipo de Seguro": tipoSeguro,
      "Estatus Médico": estatusMedico,
      "Estatus de Vida": estatusVida,
      "Fecha de Última Cita": fechaUltimaCita,
      "Estatus": estatus,
    };
  }

  // Método para eliminar al paciente (marcar como inactivo)
  void eliminarPaciente() {
    estatus = false; // Cambia el estado a inactivo
    fechaActualizacion = DateTime.now(); // Actualiza la fecha de modificación
  }

  // Sobrescritura de la función para registrar defunción
  void registrarDefuncion() {
    estatusVida = "Finado"; // Cambia el estatus de vida a finado
    eliminarPaciente(); // Marca al paciente como inactivo
  }

  // Sobreescritura del método toString para mostrar información del paciente
  @override
  String toString() {
    String formateUltimaCita = "${fechaUltimaCita.day.toString().padLeft(2, '0')}/" +
        "${fechaUltimaCita.month.toString().padLeft(2, '0')}/${fechaUltimaCita.year} " +
        "${fechaUltimaCita.hour.toString().padLeft(2, '0')}:${fechaUltimaCita.minute.toString().padLeft(2, '0')}";

    String formateCreateDate = "${fechaRegistro.day.toString().padLeft(2, '0')}/" +
        "${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} " +
        "${fechaRegistro.hour.toString().padLeft(2, '0')}:${fechaRegistro.minute.toString().padLeft(2, '0')}";
    String formateUpdateDate = "${fechaActualizacion.day.toString().padLeft(2, '0')}/" +
        "${fechaActualizacion.month.toString().padLeft(2, '0')}/${fechaActualizacion.year} " +
        "${fechaActualizacion.hour.toString().padLeft(2, '0')}:${fechaActualizacion.minute.toString().padLeft(2, '0')}";

    return """
    --------------------------------------------------------------
    DATOS DEL PACIENTE
    --------------------------------------------------------------
    Persona ID: $personaID
    NSS: $nss
    Tipo de Seguro: $tipoSeguro
    Estatus Médico: $estatusMedico
    Estatus de Vida: $estatusVida
    Fecha de Última Cita: $formateUltimaCita
    Estatus: ${estatus ? 'Activo' : 'Inactivo'}
    Fecha de Registro: $formateCreateDate
    Fecha de Actualización: $formateUpdateDate
    --------------------------------------------------------------
    """;
  }
}
