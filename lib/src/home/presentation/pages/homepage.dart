import 'package:farm_app/src/home/presentation/widgets/custom_painter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  DatabaseReference lightRef = FirebaseDatabase.instance.ref('Light');
  DatabaseReference soilRef = FirebaseDatabase.instance.ref('moisture');
  DatabaseReference tempRef = FirebaseDatabase.instance.ref('temp');
  DatabaseReference waterRef = FirebaseDatabase.instance.ref('water');
  DatabaseReference humidityRef = FirebaseDatabase.instance.ref('humidity');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Farm'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                    stream: tempRef.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomPaint(
                          foregroundPainter: CircleProgress(
                              double.parse(
                                  snapshot.data!.snapshot.value.toString()),
                              true,
                              100),
                          child: SizedBox(
                            width: 190,
                            height: 190,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Temperature'),
                                  Text(
                                    // '${tempAnimation.value.toInt()}',
                                    snapshot.data!.snapshot.value.toString(),
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '°C',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                    stream: humidityRef.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomPaint(
                          foregroundPainter: CircleProgress(
                              double.parse(
                                  snapshot.data!.snapshot.value.toString()),
                              false,
                              100),
                          child: SizedBox(
                            width: 190,
                            height: 190,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Humidity'),
                                  Text(
                                    // '${tempAnimation.value.toInt()}',
                                    snapshot.data!.snapshot.value.toString(),
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '%',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                    stream: waterRef.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomPaint(
                          foregroundPainter: CircleProgress(
                              double.parse(snapshot.data!.snapshot.value
                                          .toString()
                                          .split(',')[1]) >
                                      100
                                  ? 100
                                  : double.parse(snapshot.data!.snapshot.value
                                              .toString()
                                              .split(',')[1]) <
                                          0
                                      ? 0
                                      : double.parse(snapshot
                                          .data!.snapshot.value
                                          .toString()
                                          .split(',')[1]),
                              false,
                              100),
                          child: SizedBox(
                            width: 190,
                            height: 190,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Water Level'),
                                  Text(
                                    // '${tempAnimation.value.toInt()}',
                                    double.parse(snapshot.data!.snapshot.value
                                                .toString()
                                                .split(',')[1]) >
                                            100
                                        ? '100'
                                        : double.parse(snapshot
                                                    .data!.snapshot.value
                                                    .toString()
                                                    .split(',')[1]) <
                                                0
                                            ? '0'
                                            : snapshot.data!.snapshot.value
                                                .toString()
                                                .split(',')[1],
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '%',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              Expanded(
                child: StreamBuilder<DatabaseEvent>(
                    stream: soilRef.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomPaint(
                          foregroundPainter: CircleProgress(
                              double.parse(snapshot.data!.snapshot.value
                                  .toString()
                                  .split(',')[1]),
                              true,
                              100),
                          child: SizedBox(
                            width: 190,
                            height: 190,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Soil Moisture'),
                                  Text(
                                    // '${tempAnimation.value.toInt()}',
                                    snapshot.data!.snapshot.value
                                        .toString()
                                        .split(',')[1],
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '%',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ],
          ),
          Center(
            child: StreamBuilder<DatabaseEvent>(
                stream: lightRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomPaint(
                      foregroundPainter: CircleProgress(
                          double.parse(snapshot.data!.snapshot.value
                              .toString()
                              .substring(0, 3)),
                          true,
                          100),
                      child: SizedBox(
                        width: 190,
                        height: 190,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Amount of Light'),
                              Text(
                                // '${tempAnimation.value.toInt()}',
                                snapshot.data!.snapshot.value
                                    .toString()
                                    .substring(0, 3),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else
                    return CircularProgressIndicator();
                }),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Text('Irrigate Farm'),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Text('Refill Water Tank'),
                    ),
                    onPressed: () {},
                  ))
            ],
          )
        ]),
      )),
    );
  }
}
