class TestModel {
  //Datos
  String ruta;
  String titulo;

  //Constructor
  TestModel({this.ruta, this.titulo});

  String getRuta() {
    return ruta;
  }

  String getTitulo() {
    return titulo;
  }
}

/*
class ClienteDataModel {
  //Datos
  String marcaVehiculo;
  String modeloVehiculo;
  String placasVehiculo;
  String tipoVehiculo;
  String colorVehiculo;

  String getMarcaVehiculo() {
    return marcaVehiculo;
  }

  setMarcaVehiculo(String value) {
    marcaVehiculo = value;
  }

  setModeloVehiculo(String value) {
    modeloVehiculo = value;
  }

  String getModeloVehiculo() {
    return modeloVehiculo;
  }
}
*/
