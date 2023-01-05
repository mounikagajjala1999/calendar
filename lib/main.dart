import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // title:'title'.tr,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''.tr),
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
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Padding(
          padding:  EdgeInsets.only(left:14,top: 18),
          child:  Text('कॅलेंडर',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(8.0),
                elevation: 5.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TableCalendar(
                  daysOfWeekStyle: DaysOfWeekStyle(
                      decoration: BoxDecoration(color: Colors.grey[200])),

                  calendarStyle: CalendarStyle(
                      weekendDecoration: BoxDecoration(color: Colors.grey[100])),
                  locale: 'mr_IN',
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(1999, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  calendarFormat: CalendarFormat.month,
                  weekendDays: const [DateTime.sunday, 7],
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekHeight: 40.0,
                  rowHeight: 60.0,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  onFormatChanged: (format) {
                    if(_calendarFormat != format){
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
