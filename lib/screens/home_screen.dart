import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/timer_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TimerProvider timer;

  @override
  Widget build(BuildContext context) {
    timer = Provider.of<TimerProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.greenAccent,
      body: homeScreenBody(),
    );
  }

  Widget homeScreenBody() {
    return Container(
      child: Consumer<TimerProvider>(
        builder: (context, timeprovider, widget) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.lightBlue,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -150),
                    child: Text(
                      'Stop Watch',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '${timer.minute} : ' +
                        '${timer.seconds} : ' +
                        '${timer.miliseconds} ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (timer.startEnable)
                      ? ElevatedButton(
                    onPressed: timer.startTimer,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Start'),
                  )
                      : ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.withOpacity(0.5),
                    ),
                    child: Text('Start'),
                  ),
                  (timer.stopEnable)
                      ? ElevatedButton(
                    onPressed: timer.pauseTimer,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Pause'),
                  )
                      : ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                     primary: Colors.yellow
                    ),
                    child: Text('Pause'),
                  ),
                  (timer.continueEnable)
                      ? ElevatedButton(
                    onPressed: timer.continueTimer,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text('Continue'),
                  )
                      : ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue.withOpacity(0.5),
                    ),
                    child: Text('Continue'),
                  ),
                  ElevatedButton(
                    onPressed: timer.resetTimer,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
