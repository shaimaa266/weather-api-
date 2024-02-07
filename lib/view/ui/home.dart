import 'package:flutter/material.dart';
import 'package:theweather/logic/api/api.dart';
import 'package:theweather/logic/models/response.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherApi get = WeatherApi();
  late String city = 'Mansoura';

  @override
  void initstate() {
    get.getApiData(city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WeatherResponse weatherResponse;

    return Scaffold(
      body: FutureBuilder<WeatherResponse>(
        future: WeatherApi().getApiData(city),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.toMap().toString());
            weatherResponse = snapshot.data!;
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffADD8E6),
                    Colors.indigo,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white30),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: "  Search...."),
                        )),
                  ),
                  Text(
                    weatherResponse.city.name,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  Image.network(
                      'https://openweathermap.org/img/wn/${weatherResponse.list.elementAt(12).weather.first.icon}@2x.png'),
                  Text(
                    weatherResponse.list.elementAt(0).main.temp.toString(),
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.network(
                                'https://openweathermap.org/img/wn/${weatherResponse.list.elementAt(4).weather.first.icon}@2x.png'),
                            Text(
                              weatherResponse.list
                                  .elementAt(4)
                                  .main
                                  .temp
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                                'https://openweathermap.org/img/wn/${weatherResponse.list.elementAt(8).weather.first.icon}@2x.png'),
                            Text(
                              weatherResponse.list
                                  .elementAt(8)
                                  .main
                                  .temp
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.network(
                                'https://openweathermap.org/img/wn/${weatherResponse.list.elementAt(16).weather.first.icon}@2x.png'),
                            Text(
                              weatherResponse.list
                                  .elementAt(16)
                                  .main
                                  .temp
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.network(
                                'https://openweathermap.org/img/wn/${weatherResponse.list.elementAt(22).weather.first.icon}@2x.png'),
                            Text(
                              weatherResponse.list
                                  .elementAt(24)
                                  .main
                                  .temp
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(
                              'https://openweathermap.org/img/wn/${weatherResponse.list.elementAt(30).weather.first.icon}@2x.png',
                            ),
                            Text(
                              weatherResponse.list
                                  .elementAt(32)
                                  .main
                                  .temp
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            print(snapshot.error.toString());
          }
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            ),
          );
        },
      ),
    );
  }
}
