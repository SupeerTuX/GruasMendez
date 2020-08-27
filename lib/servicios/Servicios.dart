import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mrd_interfaz/models/DataModel.dart';

Future<int> sendImages({Map rutas, Map data}) async {
  var uri = Uri.parse(
      'https://consulta.ustgm.net/mrd/public/api/multiupload/${data['Folio']}/${data['Region']}');

  var request = http.MultipartRequest('Post', uri);

  var img1 = await http.MultipartFile.fromPath('example2[]', rutas['img1']);
  var img2 = await http.MultipartFile.fromPath('example2[]', rutas['img2']);
  var img3 = await http.MultipartFile.fromPath('example2[]', rutas['img3']);
  var img4 = await http.MultipartFile.fromPath('example2[]', rutas['img4']);
  var img5 = await http.MultipartFile.fromPath('example2[]', rutas['img5']);
  var img6 = await http.MultipartFile.fromPath('example2[]', rutas['img6']);
  var img7 = await http.MultipartFile.fromPath('example2[]', rutas['img7']);
  var img8 = await http.MultipartFile.fromPath('example2[]', rutas['img8']);

  request.files.add(img1);
  request.files.add(img2);
  request.files.add(img3);
  request.files.add(img4);
  request.files.add(img5);
  request.files.add(img6);
  request.files.add(img7);
  request.files.add(img8);

  Map<String, String> headers = {'Content-Type': 'image/jpg'};
  request.headers.addAll(headers);

  var response = await request.send();
  if (response.statusCode == 201 || response.statusCode == 200) {
    validacionReporte['Fotos'] = true;
    return 201;
  } else {
    validacionReporte['Fotos'] = false;
    throw Exception('Failed to load images');
    //return response.statusCode;
  }
}

Future<int> sendData(Map data) async {
  final http.Response response = await http.post(
    'https://consulta.ustgm.net/mrd/public/api/reporte',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    validacionReporte['Datos'] = true;
    return response.statusCode;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    validacionReporte['Datos'] = false;
    return response.statusCode;
  }
}
