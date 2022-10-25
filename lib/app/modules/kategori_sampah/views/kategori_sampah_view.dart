import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kategori_sampah_controller.dart';

class KategoriSampahView extends GetView<KategoriSampahController> {
  const KategoriSampahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KategoriSampahView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KategoriSampahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
