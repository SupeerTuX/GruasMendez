import 'package:mrd_interfaz/models/Temas.dart';

class CardCustomContent {
  String _titulo;
  String _subtitulo;
  String _tooltip;

  CardCustomTheme _theme;

  CardCustomContent({
    String titulo,
    String subtitulo,
    String tooltip,
    CardCustomTheme theme,
  }) {
    this._titulo = titulo;
    this._subtitulo = subtitulo;
    this._tooltip = tooltip;

    this._theme = theme;
  }

  String get titulo => _titulo;
  set titulo(String titulo) => this._titulo = titulo;

  String get subtitulo => _subtitulo;
  set subtitulo(String subtitulo) => this._subtitulo = subtitulo;

  String get tooltip => _tooltip;
  set tooltip(String tooltip) => this._tooltip = tooltip;

  CardCustomTheme get theme => _theme;
  set theme(CardCustomTheme theme) => this._theme = theme;
}

//Contenido de para cliente screen

CardCustomContent fechaHoraContenido = CardCustomContent(
  titulo: 'Fecha y Hola',
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
  tooltip: '',
  theme: themeFail,
);

CardCustomContent carroceriaSinGolpes = CardCustomContent(
  titulo: 'Carroceria Sin Golpes',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent parrilla = CardCustomContent(
  titulo: 'Parrilla',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent faros = CardCustomContent(
  titulo: 'Faros',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent cofre = CardCustomContent(
  titulo: 'Cofre',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent parabrisas = CardCustomContent(
  titulo: 'Parabrisas',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent limpiadores = CardCustomContent(
  titulo: 'Limpiadores',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent emblemas = CardCustomContent(
  titulo: 'Emblemas',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent portezuelaIzquierda = CardCustomContent(
  titulo: 'Portesuela Izquierda',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent cristalLatIzquierda = CardCustomContent(
  titulo: 'Cristal Lat Izquierdo',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent medallon = CardCustomContent(
  titulo: 'Medallon',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent cajuela = CardCustomContent(
  titulo: 'Cajuela',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent defensaTrasera = CardCustomContent(
  titulo: 'Defensa Trasera',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent portezuelaDerecha = CardCustomContent(
  titulo: 'Portezuela Derecha',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent cristalLatDerecho = CardCustomContent(
  titulo: 'Cristal Lat Derecho',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent antenas = CardCustomContent(
  titulo: 'Antenas',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent espejos = CardCustomContent(
  titulo: 'Espejos',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent taponesRuedas = CardCustomContent(
  titulo: 'Tapones Ruedas',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent taponGasolina = CardCustomContent(
  titulo: 'Tapon De Gasolina',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent salpicaderaDerecha = CardCustomContent(
  titulo: 'Salpicadera Derecha',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent salpicaderaIzquierda = CardCustomContent(
  titulo: 'Salpicadera Izquierda',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

//#########################################
//Contenido para las tarjetas de interioir
//#########################################

CardCustomContent tablero = CardCustomContent(
  titulo: 'Tablero',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent volante = CardCustomContent(
  titulo: 'Volante',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent radio = CardCustomContent(
  titulo: 'Radio',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent equipoDeSonido = CardCustomContent(
  titulo: 'Equipo De Sonido',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent encendedor = CardCustomContent(
  titulo: 'Encendedor',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent espejo = CardCustomContent(
  titulo: 'Espejo',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent asientos = CardCustomContent(
  titulo: 'Asientos',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent tapetesDeAlfombra = CardCustomContent(
  titulo: 'Tapetes De Alfombra',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent tapetesDeHule = CardCustomContent(
  titulo: 'Tapetes De Alfombra',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent extintor = CardCustomContent(
  titulo: 'Extintor',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent gatoManeral = CardCustomContent(
  titulo: 'Gato Y Maneral',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent trianguloDeSeguridad = CardCustomContent(
  titulo: 'Triangulo De Seguridad',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent bocinas = CardCustomContent(
  titulo: 'Bocinas',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent luces = CardCustomContent(
  titulo: 'Luces',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent tag = CardCustomContent(
  titulo: 'Tag',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent vialPass = CardCustomContent(
  titulo: 'Vial Pass',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent simCard = CardCustomContent(
  titulo: 'Sim Card',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

//#########################################
//Contenido para las tarjetas de motor
//#########################################
CardCustomContent radiador = CardCustomContent(
  titulo: 'Radiador',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent motoventilador = CardCustomContent(
  titulo: 'Motoventilador',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent alternador = CardCustomContent(
  titulo: 'Alternador',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent cableDeBujias = CardCustomContent(
  titulo: 'Cable De Bujias',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent depurador = CardCustomContent(
  titulo: 'Depurador',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent carburador = CardCustomContent(
  titulo: 'Carburador',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent filtroDeAire = CardCustomContent(
  titulo: 'Filtro De Aire',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent inyectores = CardCustomContent(
  titulo: 'Inyectores',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent compresor = CardCustomContent(
  titulo: 'Compresor',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent computadora = CardCustomContent(
  titulo: 'Computadora',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);

CardCustomContent bateria = CardCustomContent(
  titulo: 'Bateria',
  subtitulo: 'Seleccione una opcion',
  tooltip: '',
  theme: themeFail,
);
