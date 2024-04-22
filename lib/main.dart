import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_3/card.dart';
import 'package:flutter_application_3/search_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green[500],
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Booklap'),
          toolbarHeight: 70,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          shadowColor: Theme.of(context).shadowColor,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 14),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: Colors.green,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[100]),
                  overlayColor: MaterialStateProperty.all(Colors.green[200]),
                ),
              ),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: SearchBarInput(),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: const <Widget>[
            CardContainer(
                no: 1,
                name: 'Aubrey Mini Soccer',
                address: 'Jl. Juanda No. 6, Samarinda',
                desc:
                    'Lapangan ini memiliki ukuran 60x40 meter dan berada di area banyak pepohonan. Lapangan ini cocok untuk bermain bersama keluarga dan teman.'),
            CardContainer(
              no: 2,
              name: 'Borneo Mini Soccer',
              address: 'GOR Sempaja, Samarinda',
              desc:
                  'Lapangan ini memiliki ukuran 50x30 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
            ),
            CardContainer(
              no: 3,
              name: 'Foni Mini Soccer',
              address: 'Kebun Sayur, Balikpapan Barat',
              desc:
                  'Lapangan ini memiliki ukuran 40x20 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
            ),
            CardContainer(
              no: 4,
              name: 'Tennis Indoor Palaran',
              address: 'Stadion Palaran, Samarinda Sebrang',
              desc:
                  'Lapangan ini memiliki ukuran 20x10 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
            ),
            CardContainer(
              no: 5,
              name: 'Volly Vorvo',
              address: 'Jl. Lai, Vorvo, Samarinda',
              desc:
                  'Lapangan ini memiliki ukuran 30x20 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Browse',
            ),
            NavigationDestination(
              icon: Icon(Icons.payment_rounded),
              label: 'Transactions',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_online_rounded),
              label: 'Booked',
            ),
          ],
          selectedIndex: 0,
        ),
      ),
    );
  }
}
