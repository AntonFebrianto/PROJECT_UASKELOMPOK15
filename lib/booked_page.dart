import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/booking.dart';
import 'package:flutter_application_3/repository/booking_repository.dart';
import 'package:flutter_application_3/view_bukti_tf_page.dart';
import 'package:intl/intl.dart';

class BookedPage extends StatefulWidget {
  const BookedPage({super.key});

  @override
  State<BookedPage> createState() => _BookedPageState();
}

class _BookedPageState extends State<BookedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked'),
        toolbarHeight: 70,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView(
          children: [
            FutureBuilder(
                future: BookingRepository.getBooking(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    List<Booking> dataList = snapshot.data!;

                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return historyCard(
                            dataList[index].tempat,
                            dataList[index].nama,
                            dataList[index].nomorHp,
                            dataList[index].tanggal,
                            dataList[index].jamAwal,
                            dataList[index].jamAkhir,
                            dataList[index].status,
                            dataList[index].harga,
                            dataList[index].gambar,
                          );
                        });
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text('Belum ada data'),
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text('Error'),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget historyCard(String tempat, nama, nomorHp, tanggal, jamAwal, jamAkhir,
      proses, harga, imagePath) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        40,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 5,
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tempat,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Nama: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  nama,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Nomor HP: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  nomorHp,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Tanggal: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy', 'ID').format(
                    DateTime.parse(tanggal),
                  ),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Jam Awal: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  jamAwal,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Jam Akhir: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  jamAkhir,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Total Harga: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  'Rp ${NumberFormat('#,##0', 'ID').format(harga)}',
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewPicture(imagePath: imagePath);
                }));
              },
              child: const Text('Lihat Bukti Transfer'),
            )
          ],
        ),
      ),
    );
  }
}
