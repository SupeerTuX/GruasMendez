import 'package:mrd_interfaz/models/DataModel.dart';

const int MAXCHAR_80MM = 47;

class Ticket {
  //Lista de strings del ticket
  List<String> list = [];
  List<String> listBody = [];
  List<String> listFooter = [];

  Ticket() {
    list.add('-----------------------------------------------');
    list.add('INVENTARIO DEL VEHICULO Y ACUSE DE RECIBO');
    list.add('-----------------------------------------------');
    list.add('REPORTE: ${mapCliente['Folio']} - ${mapCliente['Fecha']}');
    list.add('DIRECCION DE RECEPCION: ${mapCliente['Direccion']}');
    list.add('MOTIVO INVENTARIO: ${mapCliente['MotivoInventario']}');
    list.add(
        'Marca Vehiculo: ${mapCliente['VahiculoMarca']} - Tipo: ${mapCliente['Tipo']}');
    list.add('Modelo: ${mapCliente['Modelo']} - Color: ${mapCliente['Color']}');
    list.add(
        'Placas: ${mapCliente['Placas']} - NoSerie: ${mapCliente['NoSerie']}');
    list.add('Conductor/Propietario: ${mapCliente['NombreConductor']}');
    list.add(
        'Llaves: ${mapCliente['Llaves']} - Tel: ${mapCliente['Telefono']}');
    list.add(
        'Grua: ${mapCliente['Grua']} - Clave Operador: ${mapCliente['ClaveOperador']}');
    list.add('Autoridad/Solicitante: ${mapCliente['Solicitante']}');
    list.add('-----------------------------------------------');
    list.add('ESTADO EN EL QUE SE RECIVE EL VEHICULO');
    list.add('-----------------------------------------------');

    //Lista contenido del ticket
    listBody.add('   <-------------- EXTERIOR -------------->   ');
    listBody.add(
        'Defensa Delantera      -----> ${mapExterior['DefensaDelantera']}');
    listBody.add(
        'Carroceria Sin Golpes  -----> ${mapExterior['CarroceriaSinGolpes']}');
    listBody.add('Parrilla               -----> ${mapExterior['Parrilla']}');
    listBody.add('Faros                  -----> ${mapExterior['Faros']}');
    listBody.add('Cofre                  -----> ${mapExterior['Cofre']}');
    listBody.add('Parabrisas             -----> ${mapExterior['Parabrisas']}');
    listBody.add('Limpiadores            -----> ${mapExterior['Limpiadores']}');
    listBody.add('Emblemas               -----> ${mapExterior['Emblemas']}');
    listBody
        .add('Portezuela Izq.        -----> ${mapExterior['PortezuelaIzq']}');
    listBody
        .add('Cristal Lat. Izq.      -----> ${mapExterior['CristalLatIzq']}');
    listBody.add('Medallon               -----> ${mapExterior['Medallon']}');
    listBody.add('Cajuela                -----> ${mapExterior['Cajuela']}');
    listBody
        .add('Defensa Trasera        -----> ${mapExterior['DefensaTrasera']}');
    listBody
        .add('Portezuela Der.        -----> ${mapExterior['PortezuelaDer']}');
    listBody
        .add('Cristal Lat. Der.      -----> ${mapExterior['CristalLatDer']}');
    listBody.add('Antenas                -----> ${mapExterior['Antenas']}');
    listBody.add('Espejos                -----> ${mapExterior['Espejos']}');
    listBody
        .add('Tapones Ruedas         -----> ${mapExterior['TaponesRuedas']}');
    listBody
        .add('Tapon De Gasolina      -----> ${mapExterior['TaponGasolina']}');
    listBody
        .add('Salpicadera Der.       -----> ${mapExterior['SalpicaderaDer']}');
    listBody
        .add('Salpicadera Izq.       -----> ${mapExterior['SalpicaderaIzq']}');

    //Interior
    listBody.add('   <-------------- INTERIOR -------------->   ');
    listBody.add('Tablero                -----> ${mapInterior['Tablero']}');
    listBody.add('Volante                -----> ${mapInterior['Volante']}');
    listBody.add('Radio                  -----> ${mapInterior['Radio']}');
    listBody
        .add('Equipo De Sonido       -----> ${mapInterior['EquipoSonido']}');
    listBody.add('Encendedor             -----> ${mapInterior['Encendedor']}');
    listBody.add('Espejo                 -----> ${mapInterior['Espejo']}');
    listBody.add('Asientos               -----> ${mapInterior['Asientos']}');
    listBody
        .add('Tapetes De Alfombra    -----> ${mapInterior['TapetesAlfombra']}');
    listBody.add('Tapetes De Hule        -----> ${mapInterior['TapetesHule']}');
    listBody.add('Extintor               -----> ${mapInterior['Extintor']}');
    listBody
        .add('Gato Y Maneral         -----> ${mapInterior['GatoYManeral']}');
    listBody.add(
        'Triangulo De Seguridad -----> ${mapInterior['TrianguloDeSeguridad']}');
    listBody.add('Bocinas                -----> ${mapInterior['Bocinas']}');
    listBody.add('Luces                  -----> ${mapInterior['Luces']}');
    listBody.add('Tag                    -----> ${mapInterior['Tag']}');
    listBody.add('Vial Pass              -----> ${mapInterior['VialPass']}');
    listBody.add('Sim Card               -----> ${mapInterior['SimCard']}');

    //Motor
    listBody.add('    <--------------- MOTOR --------------->    ');
    listBody.add('Radiador               -----> ${mapMotor['Radiador']}');
    listBody.add('Motoventilador         -----> ${mapMotor['Motoventilador']}');
    listBody.add('Alternador             -----> ${mapMotor['Alternador']}');
    listBody.add('Cable De Bujias        -----> ${mapMotor['CableDeBujias']}');
    listBody.add('Depurador              -----> ${mapMotor['Depurador']}');
    listBody.add('Carburador             -----> ${mapMotor['Carburador']}');
    listBody.add('Filtro De Aire         -----> ${mapMotor['FiltroAire']}');
    listBody.add('Inyectores             -----> ${mapMotor['Inyectores']}');
    listBody.add('Compresor              -----> ${mapMotor['Compresor']}');
    listBody.add('Computadora            -----> ${mapMotor['Computadora']}');
    listBody.add('Bateria                -----> ${mapMotor['Bateria']}');

    //Footer
    listFooter.add('MOTOR MARCA: ${mapMotor['MarcaMotor']}');
    listFooter.add('LLANTAS MARCA: ${mapInterior['MarcaLlantas']}');
    listFooter.add(
        'MEDIDA: ${mapInterior['MedidaLlantas']} - CANTIDAD: ${mapInterior['CantidadLlantas']}');

    listFooter.add('TANQUE DE GASOLINA: ${mapMotor['TanqueGasolina']}%');
    listFooter.add(
        'ATENCION: Porfavor recoja sus objetos personales que se encuentren en el vehiculo ya que la empresa no se hace responsable de ellos');
    listFooter.add('CARGA CONSISTE EN: ${mapMotor['CargaConsistente']}');
    listFooter.add('OBSERVACIONES: ${mapMotor['Observaciones']}');
    listFooter.add(' ');
    listFooter.add('_______________________________________________');
    listFooter.add(
        'NOMBRE Y FIRMA DE LA PERSONA QUE ENTREGA VEHICULO DE CONFORMIDAD');
    listFooter.add(' ');
    listFooter.add('_______________________________________________');
    listFooter.add('NOMBRE Y FIRMA DEL OFICIAL QUE INTERVINO');
    listFooter.add(' ');
    listFooter.add('_______________________________________________');
    listFooter
        .add('NOMBRE Y FIRMA DE OPERADOR QUE RECIBE VEHICULO DE CONFORMIDAD');
  }

  List<String> get textHeader => list;
  List<String> get textBody => listBody;
  List<String> get textFooter => listFooter;

  testString() {
    print('-----------------------------------------------');
    list.forEach((element) {
      //print(center(element, 47, ' '));
      //print(format47Char(element));
      List sublist = [];
      sublist = format47Char(element);
      sublist.forEach((e) {
        print(e);
      });
    });
  }

  List<String> format47Char(String str) {
    List<String> list = new List();
    bool next = false;

    list.add(str);

    if (str.length <= MAXCHAR_80MM) return list;

    while (!next) {
      String buffer = list.last;
      int bk = buffer.lastIndexOf(' ', MAXCHAR_80MM);
      list.last = buffer.substring(0, bk);
      list.add(buffer.substring(bk));
      if (list.last.length < MAXCHAR_80MM) next = true;
    }
    return list;
  }
}
