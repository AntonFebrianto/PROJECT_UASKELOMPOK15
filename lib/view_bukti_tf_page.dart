import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ViewPicture extends StatefulWidget {
  final String imagePath;
  const ViewPicture({required this.imagePath, super.key});

  @override
  State<ViewPicture> createState() => _ViewPictureState();
}

class _ViewPictureState extends State<ViewPicture> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(kWidth / 20),
            child: Zoom(
              backgroundColor: Colors.black,
              enableScroll: false,
              child: Center(
                  child: Image.network(
                'https://sukucadang.encepmotor.com/booking/api/${widget.imagePath}',
                fit: BoxFit.fitWidth,
                width: kWidth / 1.2,
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: kWidth / 10, horizontal: kWidth / 20),
                width: kWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(kWidth / 40),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: kWidth / 30),
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: kWidth / 25,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
