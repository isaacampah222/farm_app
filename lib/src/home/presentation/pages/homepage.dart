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
  DatabaseReference irrigate = FirebaseDatabase.instance.ref('irrigate');
  DatabaseReference fillTank = FirebaseDatabase.instance.ref('fillTank');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Smart Farm',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                Expanded(
                  child: StreamBuilder<DatabaseEvent>(
                      stream: tempRef.onValue,
                      builder: (context, snapshot) {
                        Color arcColor;
                        if (snapshot.hasData) {
                          if (double.parse(
                                  snapshot.data!.snapshot.value.toString()) >
                              30) {
                            arcColor = Colors.red;
                          } else if (double.parse(snapshot.data!.snapshot.value
                                      .toString()) >
                                  26 &&
                              double.parse(snapshot.data!.snapshot.value
                                      .toString()) <
                                  30) {
                            arcColor = Colors.yellow;
                          } else if (double.parse(
                                  snapshot.data!.snapshot.value.toString()) <
                              20) {
                            arcColor = Colors.red;
                          } else {
                            arcColor = Colors.green;
                          }
                          return CustomPaint(
                            foregroundPainter: CircleProgress(
                                double.parse(
                                    snapshot.data!.snapshot.value.toString()),
                                true,
                                100,
                                arcColor),
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
                        Color arcColor;
                        if (snapshot.hasData) {
                          if (double.parse(
                                  snapshot.data!.snapshot.value.toString()) >
                              80) {
                            arcColor = Colors.red;
                          } else if (double.parse(snapshot.data!.snapshot.value
                                      .toString()) >
                                  60 &&
                              double.parse(snapshot.data!.snapshot.value
                                      .toString()) <
                                  80) {
                            arcColor = Colors.yellow;
                          } else if (double.parse(
                                  snapshot.data!.snapshot.value.toString()) <
                              40) {
                            arcColor = Colors.red;
                          } else {
                            arcColor = Colors.green;
                          }
                          return CustomPaint(
                            foregroundPainter: CircleProgress(
                                double.parse(
                                    snapshot.data!.snapshot.value.toString()),
                                false,
                                100,
                                arcColor),
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
                        Color arcColor;
                        if (snapshot.hasData) {
                          if (double.parse(snapshot.data!.snapshot.value
                                  .toString()
                                  .split(',')[1]) >
                              70) {
                            arcColor = Colors.green;
                          } else if (double.parse(snapshot.data!.snapshot.value
                                  .toString()
                                  .split(',')[1]) >
                              40) {
                            arcColor = Colors.yellow;
                          } else {
                            arcColor = Colors.red;
                          }
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
                                100,
                                arcColor),
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
                        Color arcColor;
                        if (snapshot.hasData) {
                          if (100 -
                                  double.parse(snapshot.data!.snapshot.value
                                      .toString()
                                      .split(',')[1]) <
                              40) {
                            arcColor = Colors.red;
                          } else if (double.parse(snapshot.data!.snapshot.value
                                  .toString()
                                  .split(',')[1]) <
                              50) {
                            arcColor = Colors.yellow;
                          }
                          // else if (double.parse(
                          //         snapshot.data!.snapshot.value.toString()) <
                          //     40) {
                          //   arcColor = Colors.red;
                          // }
                          else {
                            arcColor = Colors.green;
                          }
                          return CustomPaint(
                            foregroundPainter: CircleProgress(
                                100 -
                                    double.parse(snapshot.data!.snapshot.value
                                        .toString()
                                        .split(',')[1]),
                                true,
                                100,
                                arcColor),
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
                                      (100 -
                                              double.parse(snapshot
                                                  .data!.snapshot.value
                                                  .toString()
                                                  .split(',')[1]
                                                  .substring(0, 3)))
                                          .toString(),
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
                      Color arcColor;
                      if (snapshot.hasData) {
                        if (double.parse(snapshot.data!.snapshot.value
                                .toString()
                                .substring(0, 3)) >
                            50) {
                          arcColor = Colors.red;
                        } else if (double.parse(snapshot.data!.snapshot.value
                                .toString()
                                .substring(0, 3)) >
                            30) {
                          arcColor = Colors.yellow;
                        } else if (double.parse(snapshot.data!.snapshot.value
                                .toString()
                                .substring(0, 3)) <
                            3) {
                          arcColor = Colors.red;
                        } else {
                          arcColor = Colors.green;
                        }
                        return CustomPaint(
                            foregroundPainter: CircleProgress(
                                double.parse(snapshot.data!.snapshot.value
                                    .toString()
                                    .substring(0, 3)),
                                true,
                                100,
                                arcColor),
                            child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                      Text('Amount of Light'),
                                      Text(
                                        // '${tempAnimation.value.toInt()}',
                                        snapshot.data!.snapshot.value
                                            .toString()
                                            .substring(0, 3),
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '%',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]))));
                      } else
                        return CircularProgressIndicator();
                    })),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Expanded(
                      flex: 12,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                            irrigate.set(true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Text(
                              'Irrigate Farm',
                              style: TextStyle(color: Colors.black),
                            ),
                          ))),
                  Spacer(),
                  Expanded(
                      flex: 12,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: Text('Refill Water Tank'),
                        ),
                        onPressed: () {
                          fillTank.set(true);
                        },
                      ))
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
