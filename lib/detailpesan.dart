import 'package:flutter/material.dart';
import 'petapesan.dart'; 

class DetailPesanPage extends StatefulWidget {
  @override
  _DetailPesanPageState createState() => _DetailPesanPageState();
}

class _DetailPesanPageState extends State<DetailPesanPage> {
  final _merkController = TextEditingController();
  final _jenisController = TextEditingController();
  final _tahunController = TextEditingController();
  final _keluhanController = TextEditingController();

  String? _merkError;
  String? _jenisError;
  String? _tahunError;
  String? _keluhanError;

  void _validateAndProceed() {
    setState(() {
      _merkError = _merkController.text.isEmpty ? 'Masukkan merk kendaraan anda' : null;
      _jenisError = _jenisController.text.isEmpty ? 'Masukkan jenis kendaraan anda' : null;
      _tahunError = _tahunController.text.isEmpty ? 'Masukkan tahun kendaraan anda' : null;
      _keluhanError = _keluhanController.text.isEmpty ? 'Masukkan keluhan dari kendaraan anda' : null;
    });

    if (_merkError == null && _jenisError == null && _tahunError == null && _keluhanError == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PetaPesanPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 200),
            painter: TopRightCirclePainter(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Masukkan data kendaraanmu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Merk Kendaraan',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(
                        controller: _merkController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: _merkError,
                        ),
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Jenis/Model',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(
                        controller: _jenisController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: _jenisError,
                        ),
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Tahun',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(
                        controller: _tahunController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: _tahunError,
                        ),
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Keluhan',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(
                        controller: _keluhanController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: _keluhanError,
                          hintText: 'Tulis keluhan atau masalah dari kendaraan anda',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 14),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF56BEE1),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: _validateAndProceed,
                        child: Text(
                          'Lanjut',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopRightCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        center: Alignment.topRight,
        radius: 1.0,
        colors: [
          Color(0xFF56BEE1),
          Color(0xFF56BEE1).withOpacity(0.0),
        ],
        stops: [0.7, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width, 0),
        radius: 350,
      ));

    final path = Path();
    path.moveTo(size.width - 350, 0);
    path.arcToPoint(
      Offset(size.width, 350),
      radius: Radius.circular(350),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}