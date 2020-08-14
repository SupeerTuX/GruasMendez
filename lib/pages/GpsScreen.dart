//Screen para visualizacion del gps
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class GpsScreen extends StatefulWidget {
  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(19.040034, -98.2630051),
    zoom: 6.0,
  );
  @override
  _GpsScreenState createState() => _GpsScreenState();
}

class _GpsScreenState extends State<GpsScreen> {
  Location location = Location();
  bool getCoordinates = false;
  var currentLocation;
  var currentAddress;
  Marker marker;
  Circle circle;
  GoogleMapController _googleMapController;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  final Map<String, Marker> _markers = {};
  IconData fabIcon = Icons.gps_fixed;
  Color fabColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu Ubicacion'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: GpsScreen.initialLocation,
            onMapCreated: (controller) {
              _googleMapController = controller;
            },
            markers: _markers.values.toSet(),
          ),
        ),
      ),
      key: scaffoldState,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!getCoordinates) {
            _getLocation().then((value) {
              if (value != null) {
                currentLocation = '${value['lat']},${value['long']}';
                getSetAddress(Coordinates(value['lat'], value['long']))
                    .then((direccion) {
                  if (direccion != null) {
                    currentAddress = direccion;
                    getCoordinates = true;
                  }
                });
              }
            });
          } else {
            //print('Location: $currentLocation');
            //print('Address: $currentAddress');
            HapticFeedback.vibrate();
            Navigator.of(context).pop('$currentAddress, $currentLocation');
          }
          //Navigator.of(context).pop(currentLocation);
        },
        child: Icon(fabIcon),
        backgroundColor: fabColor,
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var loc = <String, double>{'lat': 0.0, 'long': 0.0};
    try {
      LocationData currentLocation = await location.getLocation();
      //print(currentLocation);
      loc['lat'] = currentLocation.latitude;
      loc['long'] = currentLocation.longitude;
      setState(() {
        fabIcon = Icons.save;
        fabColor = Colors.greenAccent;
        _markers.clear();
        final marker = Marker(
          markerId: MarkerId('current_loc'),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          infoWindow: InfoWindow(title: 'Mi Posicion'),
        );
        _markers['Curren Location'] = marker;

        _googleMapController.animateCamera(
          CameraUpdate.newLatLngZoom(
              LatLng(currentLocation.latitude, currentLocation.longitude), 18),
        );
      });
    } catch (e) {
      loc = null;
    }
    return loc;
  }

  Future<String> getSetAddress(Coordinates coordinates) async {
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    if (addresses != null) {
      setState(() {
        getCoordinates = true;
        //print('Direccion: ');
        //print(addresses.first.addressLine);
        scaffoldState.currentState.showSnackBar(new SnackBar(
            content: new Text('Direccion: ${addresses.first.addressLine}')));
      });
    }
    return addresses.first.addressLine;
  }
}
