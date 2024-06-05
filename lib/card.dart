import 'package:flutter/material.dart';
import 'package:flutter_application_3/detail_page.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.no,
    required this.name,
    required this.address,
    required this.price,
    required this.desc,
  });

  final int no, price;
  final String name, address, desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: CardItem(no: no, name: name, address: address),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(
                no: no,
                name: name,
                price: price,
                address: address,
                desc: desc,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key, required this.no, required this.name, required this.address});

  final int no;
  final String name, address;

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/lapangan_$no.jpg';

    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(name),
          ),
          subtitle: Text(address),
          titleTextStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
