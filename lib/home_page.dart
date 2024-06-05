import 'package:flutter/material.dart';
import 'package:flutter_application_3/card.dart';
import 'package:flutter_application_3/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              price: 50000,
              desc:
                  'Lapangan ini memiliki ukuran 60x40 meter dan berada di area banyak pepohonan. Lapangan ini cocok untuk bermain bersama keluarga dan teman.'),
          CardContainer(
            no: 2,
            name: 'Borneo Mini Soccer',
            price: 60000,
            address: 'GOR Sempaja, Samarinda',
            desc:
                'Lapangan ini memiliki ukuran 50x30 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
          ),
          CardContainer(
            no: 3,
            name: 'Foni Mini Soccer',
            price: 45000,
            address: 'Kebun Sayur, Balikpapan Barat',
            desc:
                'Lapangan ini memiliki ukuran 40x20 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
          ),
          CardContainer(
            no: 4,
            name: 'Tennis Indoor Palaran',
            price: 55000,
            address: 'Stadion Palaran, Samarinda Sebrang',
            desc:
                'Lapangan ini memiliki ukuran 20x10 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
          ),
          CardContainer(
            no: 5,
            name: 'Volly Vorvo',
            price: 67000,
            address: 'Jl. Lai, Vorvo, Samarinda',
            desc:
                'Lapangan ini memiliki ukuran 30x20 meter dan berada di area perkotaan. Lapangan ini cocok untuk bermain bersama teman.',
          ),
        ],
      ),
    );
  }
}
