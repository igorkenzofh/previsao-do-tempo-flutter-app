import 'package:clima/services/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // TODO 10: Criar variaveis de lat e long

  // TODO 1: Dps de importar o package geolocation, criar função para pegar a loc
  // TODO 3: Deu erro no 'await', adicionar 'async'

  // TODO 6: Pegar a loc quando a tela iniciar sem apertar nenhum botao
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );

    // TODO 12: Mudei la pro location screen
    // double temperature = decodeData['main']['temp'];
    // int condition = decodedData['weather'][0]['id'];
    // String cityName = decodeData['name'];
  }

  // void getData() async {
  //   double temperature = decodeData['main']['temp'];
  //   int condition = decodedData['weather'][0]['id'];
  //   String cityName = decodeData['name'];
  //
  //   print(temperature);
  //   print(condition);
  //   print(cityname);
  // }

  // http.Response response = await http.get(
  //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

  // if (response.statusCode == 200) {
  //   String data = response.body;
  //     var temperature = jsonDecode(data)['main']['temp'];
  //     print(temperature);
  //
  //     var weather = jsonDecode(data)['weather'][0]['id'];
  //     print(weather);
  //
  //     var cityName = jsonDecode(data)['name'];
  //     print(cityName);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       // TODO 5: Chamar função
      //       getLocation();
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
