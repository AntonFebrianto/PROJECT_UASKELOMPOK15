import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.no,
      required this.name,
      required this.address,
      required this.desc});

  final int no;
  final String name, address, desc;

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/lapangan_$no.jpg';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(name),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Hero(
                    tag: image,
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  MaterialBanner(
                    dividerColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    content: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(name),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(address),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Text(
                                    'Deskripsi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(desc),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      isThreeLine: true,
                    ),
                    actions: [
                      ActionChip(
                        onPressed: () {},
                        label: const Text('Outdoor'),
                      ),
                      ActionChip(
                        onPressed: () {},
                        label: const Text('Mini Soccer'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: const Text('Include Photographer'),
                                trailing: Switch(
                                  onChanged: (value) {},
                                  value: true,
                                ),
                              ),
                              ListTile(
                                title: const Text('Cashless'),
                                trailing: Switch(
                                  onChanged: (value) {},
                                  value: false,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Proses Pembayaran'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Pesan Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
