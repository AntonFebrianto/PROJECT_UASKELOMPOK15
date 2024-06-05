import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/constant/modal.dart';
import 'package:flutter_application_3/model/booking.dart';
import 'package:flutter_application_3/repository/booking_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatefulWidget {
  final String image, name;
  final int price;
  const PaymentPage(
      {required this.image,
      required this.price,
      required this.name,
      super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String tanggalText = '';
  TextEditingController nama = TextEditingController();
  TextEditingController nomorHp = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController jamAwal = TextEditingController();
  TextEditingController jamAkhir = TextEditingController();
  TextEditingController durasi = TextEditingController();
  TextEditingController harga = TextEditingController(text: '0');
  final formKey = GlobalKey<FormState>();

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  getImage() async {
    try {
      var pickedfiles = await imgpicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      if (pickedfiles != null) {
        imagefiles = XFile(pickedfiles.path);
        setState(() {});
        (() {});
      } else {
        pickedfiles = null;
        debugPrint("No image is selected.");
      }
    } catch (e) {
      debugPrint("error while picking file.");
    }
  }

  clearImage() {
    setState(() {
      imagefiles = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proses Pembayaran'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          allWidgets(),
        ],
      ),
    );
  }

  Widget allWidgets() {
    return Stack(
      children: [
        Image.asset(
          widget.image,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.5),
                    blurRadius: 5,
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nama,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harus diisi';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama Anda',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: nomorHp,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 13,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harus diisi';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: 'Masukkan Nomor HP Anda',
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: tanggal,
                      readOnly: true,
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );

                        tanggalText = DateFormat('yyyy-MM-dd').format(date!);
                        tanggal.text =
                            DateFormat('EEEE, dd MMMM yyyy', 'id').format(date);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harus dipilih';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Pilih Tanggal',
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: jamAwal,
                      readOnly: true,
                      onTap: () async {
                        var time = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());

                        if (time != null) {
                          setState(() {
                            jamAwal.text = "${time.hour}:${time.minute}";
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harus dipilih';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Pilih Jam Awal',
                        prefixIcon: Icon(
                          Icons.punch_clock,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: jamAkhir,
                      onTap: () async {
                        var time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (time != null) {
                          setState(() {
                            jamAkhir.text = "${time.hour}:${time.minute}";
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harus dipilih';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Pilih Jam Selesai',
                        prefixIcon: Icon(
                          Icons.punch_clock,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: durasi,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        hintText: 'Durasi',
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: Text('Jam'),
                        ),
                        prefixIcon: Icon(
                          Icons.timer,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harus diisi';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          if (val != '') {
                            harga.text =
                                'Rp ${NumberFormat('#,##0', 'ID').format(
                              int.parse(
                                (int.parse(val) * widget.price).toString(),
                              ),
                            )}';
                          } else if (val == '') {
                            harga.text = '0';
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: harga,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        hintText: 'Harga',
                        prefixIcon: Icon(
                          Icons.price_change,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    imagefiles != null
                        ? Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width / 3,
                                child: Image.file(
                                  File(imagefiles!.path),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    clearImage();
                                  },
                                  child: const Text("Hapus"))
                            ],
                          )
                        : imagefiles == null
                            ? InkWell(
                                onTap: () {
                                  getImage();
                                  debugPrint(imagefiles.toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40))),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width / 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20,
                                          weight: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              9,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                        ),
                                        Text(
                                          "Klik di sini untuk upload bukti transfer",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              imagefiles != null) {
                            GlobalModal.loadingModal(
                                MediaQuery.of(context).size.width, context);
                            BookingRepository.addBooking(
                              Booking(
                                nama: nama.text,
                                nomorHp: nomorHp.text,
                                tempat: widget.name,
                                tanggal: tanggalText,
                                jamAkhir: jamAkhir.text,
                                jamAwal: jamAwal.text,
                                status: 'Proses',
                                harga: widget.price,
                              ),
                              context,
                              imagefiles!,
                            );
                          }
                        },
                        child: const Text('SIMPAN'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
