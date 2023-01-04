import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calender'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> values = [
    "sun"
        "mon"
        "tue"
        "wed"
        "thu"
        "fri"
        "sat"
        "1"
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "2"
        "8"
        "9"
        "10"
        "11"
        "12"
        "13"
        "14"
        "3"
        "15"
        "16"
        "17"
        "18"
        "19"
        "20"
        "21"
        "4"
        "22"
        "23"
        "24"
        "25"
        "26"
        "27"
        "28"
        "5"
        "29"
        "30"
        "31"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: 800,
          width: 390,
          // color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 450.0),
                items: [1, 2, 3, 4, 5,6,7,8,9,10,11,12].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 230, top: 10, left: 10),
                                child: Text(
                                  'text $i',
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                            ],
                          )

                          // Text('text $i', style: const TextStyle(fontSize: 16.0),)
                          );
                    },
                  );
                }).toList(),
              )
              // Padding(
              //   padding: EdgeInsets.only(left:0, top: 10, bottom: 10,right: 250),
              //   child: Text("jan",
              //       style: TextStyle(
              //           fontSize: 25,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.grey,),textAlign: TextAlign.left),
              // ),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _buttons() {
    return GridView.count(
      mainAxisSpacing: 2,
      // crossAxisSpacing: 3,
      crossAxisCount: 7,
      shrinkWrap: true,
      children: List.generate(values.length, (index) {
        return _buttonWidget(number: values[index]);
      }),
    );
  }
  Widget _monthsName() {
   if(values == 0 ){
     print("jan");
   }
   return Text("jan");

  }

  Widget _buttonWidget({number}) {
    return InkWell(
      onTap: () {
        print(number);

        switch (number) {
          case "C":
            break;
          case "+":
            break;
          case "-":
            break;
          case "*":
            break;
          case "=":
            break;
          case "/":
            break;

          default:
            "shut up";
        }
      },
      child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Text(number,
              style: const TextStyle(fontSize: 50, color: Colors.deepOrange),
              textAlign: TextAlign.center)),
    );
  }
}
// Padding(
// padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
// child: Text("jan",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.grey)),
// ),
