import 'package:mrd_interfaz/models/Temas.dart';

enum SingingCharacter { si, no }

class CardCustomContent {
  String _titulo;
  String _subtitulo;
  String _tooltip;
  String _key;
  bool _fieldNumeric;
  SingingCharacter _opcion;

  CardCustomTheme _theme;

  CardCustomContent({
    String titulo,
    String subtitulo,
    String tooltip,
    String key,
    SingingCharacter opcion,
    bool fieldNumeric,
    CardCustomTheme theme,
  }) {
    this._titulo = titulo;
    this._subtitulo = subtitulo;
    this._tooltip = tooltip;
    this._key = key;
    this._opcion = opcion;
    this._fieldNumeric = fieldNumeric;

    this._theme = theme;
  }

  String get titulo => _titulo;
  set titulo(String titulo) => this._titulo = titulo;

  String get subtitulo => _subtitulo;
  set subtitulo(String subtitulo) => this._subtitulo = subtitulo;

  String get tooltip => _tooltip;
  set tooltip(String tooltip) => this._tooltip = tooltip;

  String get key => _key;
  set key(String key) => this._key = key;

  SingingCharacter get opcion => _opcion;
  set opcion(SingingCharacter opcion) => this._opcion = opcion;

  bool get fieldNumeric => _fieldNumeric;
  set fieldNumeric(bool fieldNumeric) => this._fieldNumeric = fieldNumeric;

  CardCustomTheme get theme => _theme;
  set theme(CardCustomTheme theme) => this._theme = theme;
}

//Contenido de para cliente screen

CardCustomContent fechaHoraContenido = CardCustomContent(
  titulo: 'Fecha y Hora',
  subtitulo: 'No se ha ingresado la fecha y hora',
  tooltip: 'Capture la fecha y la hora',
  theme: themeFail,
);

CardCustomContent direccionContenido = CardCustomContent(
  titulo: 'Direccion',
  subtitulo: 'Capture la direccion del arrastre',
  tooltip: 'Capture la ubicacion',
  theme: themeFail,
);

CardCustomContent inventarioContenido = CardCustomContent(
  titulo: 'Motivo de inventario',
  subtitulo: 'Capture el motivo del inventario',
  tooltip: 'Elija el motivo del inventario',
  theme: themeFail,
);

//#########################################
//Contenido para las tarjetas exterior
//#########################################

CardCustomContent defensaDelantera = CardCustomContent(
  titulo: 'Defensa Delantera',
  subtitulo: 'Seleccione una opcion',
  key: 'DefensaDelantera',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent carroceriaSinGolpes = CardCustomContent(
  titulo: 'Carroceria Sin Golpes',
  subtitulo: 'Seleccione una opcion',
  key: 'CarroceriaSinGolpes',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent parrilla = CardCustomContent(
  titulo: 'Parrilla',
  subtitulo: 'Seleccione una opcion',
  key: 'Parrilla',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent cofre = CardCustomContent(
  titulo: 'Cofre',
  subtitulo: 'Seleccione una opcion',
  key: 'Cofre',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent parabrisas = CardCustomContent(
  titulo: 'Parabrisas',
  subtitulo: 'Seleccione una opcion',
  key: 'Parabrisas',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent limpiadores = CardCustomContent(
  titulo: 'Limpiadores',
  subtitulo: 'Seleccione una opcion',
  key: 'Limpiadores',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent emblemas = CardCustomContent(
  titulo: 'Emblemas',
  subtitulo: 'Seleccione una opcion',
  key: 'Emblemas',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent portezuelaIzquierda = CardCustomContent(
  titulo: 'Puerta Delantera Izquierda',
  subtitulo: 'Seleccione una opcion',
  key: 'PortezuelaIzq',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent cristalLatIzquierda = CardCustomContent(
  titulo: 'Retrovisor Lat Izquierdo',
  subtitulo: 'Seleccione una opcion',
  key: 'CristalLatIzq',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent medallon = CardCustomContent(
  titulo: 'Medallon',
  subtitulo: 'Seleccione una opcion',
  key: 'Medallon',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent cajuela = CardCustomContent(
  titulo: 'Cajuela',
  subtitulo: 'Seleccione una opcion',
  key: 'Cajuela',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent defensaTrasera = CardCustomContent(
  titulo: 'Defensa Trasera',
  subtitulo: 'Seleccione una opcion',
  key: 'DefensaTrasera',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent portezuelaDerecha = CardCustomContent(
  titulo: 'Puerta Delantera Derecha.',
  subtitulo: 'Seleccione una opcion',
  key: 'PortezuelaDer',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent cristalLatDerecho = CardCustomContent(
  titulo: 'Retrovisor Lat Derecho',
  subtitulo: 'Seleccione una opcion',
  key: 'CristalLatDer',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent antenas = CardCustomContent(
  titulo: 'Antenas',
  subtitulo: 'Seleccione una opcion',
  key: 'Antenas',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent espejos = CardCustomContent(
  titulo: 'Espejos',
  subtitulo: 'Seleccione una opcion',
  key: 'Espejos',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent taponesRuedas = CardCustomContent(
  titulo: 'Tapones De Ruedas',
  subtitulo: 'Seleccione una opcion',
  key: 'TaponesRuedas',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent taponGasolina = CardCustomContent(
  titulo: 'Tapon De Gasolina',
  subtitulo: 'Seleccione una opcion',
  key: 'TaponGasolina',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent salpicaderaDerecha = CardCustomContent(
  titulo: 'Salpicadera Derecha',
  subtitulo: 'Seleccione una opcion',
  key: 'SalpicaderaDer',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent salpicaderaIzquierda = CardCustomContent(
  titulo: 'Salpicadera Izquierda',
  subtitulo: 'Seleccione una opcion',
  key: 'SalpicaderaIzq',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent puertaTraseraDer = CardCustomContent(
  titulo: 'Puerta Trasera Derecha',
  subtitulo: 'Seleccione una opcion',
  key: 'PuertaTraseraDer',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent puertaTraseraIzq = CardCustomContent(
  titulo: 'Puerta Trasera Izquierda',
  subtitulo: 'Seleccione una opcion',
  key: 'PuertaTraseraIzq',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent faroDerecho = CardCustomContent(
  titulo: 'Faro Derecho',
  subtitulo: 'Seleccione una opcion',
  key: 'FaroDerecho',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent faroIzquierdo = CardCustomContent(
  titulo: 'Faro Izquierdo',
  subtitulo: 'Seleccione una opcion',
  key: 'FaroIzquierdo',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent calaveraDerecha = CardCustomContent(
  titulo: 'Calavera Derecha',
  subtitulo: 'Seleccione una opcion',
  key: 'CalaveraDerecha',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent calaveraIzquierda = CardCustomContent(
  titulo: 'Calavera Izquierda',
  subtitulo: 'Seleccione una opcion',
  key: 'CalaveraIzquierda',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent reflejantes = CardCustomContent(
  titulo: 'Reflejantes',
  subtitulo: 'Seleccione una opcion',
  key: 'Reflejantes',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);
//#########################################
//Contenido para las tarjetas de interioir
//#########################################

CardCustomContent tablero = CardCustomContent(
  titulo: 'Tablero',
  subtitulo: 'Seleccione una opcion',
  key: 'Tablero',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent volante = CardCustomContent(
  titulo: 'Volante',
  subtitulo: 'Seleccione una opcion',
  key: 'Volante',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent radio = CardCustomContent(
  titulo: 'Radio',
  subtitulo: 'Seleccione una opcion',
  key: 'Radio',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent equipoDeSonido = CardCustomContent(
  titulo: 'Equipo De Sonido',
  subtitulo: 'Seleccione una opcion',
  key: 'EquipoSonido',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent encendedor = CardCustomContent(
  titulo: 'Encendedor',
  subtitulo: 'Seleccione una opcion',
  key: 'Encendedor',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent espejo = CardCustomContent(
  titulo: 'Espejo Retrovisor',
  subtitulo: 'Seleccione una opcion',
  key: 'Espejo',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent asientos = CardCustomContent(
  titulo: 'Asientos',
  subtitulo: 'Seleccione una opcion',
  key: 'Asientos',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent tapetesDeAlfombra = CardCustomContent(
  titulo: 'Tapetes De Alfombra',
  subtitulo: 'Seleccione una opcion',
  key: 'TapetesAlfombra',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent tapetesDeHule = CardCustomContent(
  titulo: 'Tapetes De Hule',
  subtitulo: 'Seleccione una opcion',
  key: 'TapetesHule',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent extintor = CardCustomContent(
  titulo: 'Extintor',
  subtitulo: 'Seleccione una opcion',
  key: 'Extintor',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent gatoManeral = CardCustomContent(
  titulo: 'Gato Y Maneral',
  subtitulo: 'Seleccione una opcion',
  key: 'GatoYManeral',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent trianguloDeSeguridad = CardCustomContent(
  titulo: 'Triangulo De Seguridad',
  subtitulo: 'Seleccione una opcion',
  key: 'TrianguloDeSeguridad',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent bocinas = CardCustomContent(
  titulo: 'Bocinas',
  subtitulo: 'Seleccione una opcion',
  key: 'Bocinas',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent luces = CardCustomContent(
  titulo: 'Luces',
  subtitulo: 'Seleccione una opcion',
  key: 'Luces',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent tag = CardCustomContent(
  titulo: 'Tag',
  subtitulo: 'Seleccione una opcion',
  key: 'Tag',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent vialPass = CardCustomContent(
  titulo: 'Vial Pass',
  subtitulo: 'Seleccione una opcion',
  key: 'VialPass',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent simCard = CardCustomContent(
  titulo: 'Sim Card',
  subtitulo: 'Seleccione una opcion',
  key: 'SimCard',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

//#########################################
//Contenido para las tarjetas de motor
//#########################################
CardCustomContent radiador = CardCustomContent(
  titulo: 'Radiador',
  subtitulo: 'Seleccione una opcion',
  key: 'Radiador',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent motoventilador = CardCustomContent(
  titulo: 'Motoventilador',
  subtitulo: 'Seleccione una opcion',
  key: 'Motoventilador',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent alternador = CardCustomContent(
  titulo: 'Alternador',
  subtitulo: 'Seleccione una opcion',
  key: 'Alternador',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent cableDeBujias = CardCustomContent(
  titulo: 'Cable De Bujias',
  subtitulo: 'Seleccione una opcion',
  key: 'CableDeBujias',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent depurador = CardCustomContent(
  titulo: 'Depurador',
  subtitulo: 'Seleccione una opcion',
  key: 'Depurador',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent carburador = CardCustomContent(
  titulo: 'Carburador',
  subtitulo: 'Seleccione una opcion',
  key: 'Carburador',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent filtroDeAire = CardCustomContent(
  titulo: 'Filtro De Aire',
  subtitulo: 'Seleccione una opcion',
  key: 'FiltroAire',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent inyectores = CardCustomContent(
  titulo: 'Inyectores',
  subtitulo: 'Seleccione una opcion',
  key: 'Inyectores',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: true,
  theme: themeOk,
);

CardCustomContent compresor = CardCustomContent(
  titulo: 'Compresor',
  subtitulo: 'Seleccione una opcion',
  key: 'Compresor',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent computadora = CardCustomContent(
  titulo: 'Computadora',
  subtitulo: 'Seleccione una opcion',
  key: 'Computadora',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);

CardCustomContent bateria = CardCustomContent(
  titulo: 'Bateria',
  subtitulo: 'Seleccione una opcion',
  key: 'Bateria',
  tooltip: '',
  opcion: SingingCharacter.si,
  fieldNumeric: false,
  theme: themeOk,
);
