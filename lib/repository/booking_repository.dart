import 'dart:convert';

import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/model/booking.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BookingRepository {
  // static String urlApi = "http://192.168.1.18/booklap-api";
  static String urlApi = "https://sukucadang.encepmotor.com/booking/api";

  static Future<List<Booking>> getBooking() async {
    Uri url = Uri.parse("$urlApi/get_booking.php");

    var response = await get(
      url,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List;
      return jsonResponse.map((booking) => Booking.fromJson(booking)).toList();
    }
    return [];
  }

  static Future addBooking(Booking? booking, context, XFile imageFile) async {
    var uri = Uri.parse("$urlApi/add_booking.php");
    var request = MultipartRequest("POST", uri);

    var stream = ByteStream(imageFile.openRead());
    var length = await imageFile.length();

    var multipartFile =
        MultipartFile("image", stream, length, filename: imageFile.path);

    request.files.add(multipartFile);

    request.fields['nama'] = booking!.nama;
    request.fields['nomorHp'] = booking.nomorHp;
    request.fields['tempat'] = booking.tempat;
    request.fields['tanggal'] = booking.tanggal;
    request.fields['jamAwal'] = booking.jamAwal;
    request.fields['jamAkhir'] = booking.jamAkhir;
    request.fields['status'] = booking.status;
    request.fields['harga'] = booking.harga.toString();

    var response = await request.send();
    if (response.statusCode == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainApp()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Gagal')));
    }
  }
}
