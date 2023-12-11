import 'package:flutter/material.dart';

class ProfileFormRow extends StatelessWidget {
  final TextEditingController namaController;
  final TextEditingController dateOfBirthController;
  final TextEditingController addressController;
  final TextEditingController provinceController;
  final TextEditingController cityController;
  final TextEditingController postalCodeController;
  final TextEditingController phoneController;
  final Function(String, String, String, String, String, String, String)
      onButtonPressed;

  const ProfileFormRow({
    Key? key,
    required this.namaController,
    required this.dateOfBirthController,
    required this.addressController,
    required this.provinceController,
    required this.cityController,
    required this.postalCodeController,
    required this.phoneController,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 8,
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: const Color(0xff3A7E04),
                  controller: namaController,
                  decoration: const InputDecoration(
                    hintText: "Nama Lengkap",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: dateOfBirthController,
                  cursorColor: const Color(0xff3A7E04),
                  decoration: const InputDecoration(
                    hintText: "Tanggal Lahir",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: addressController,
                  cursorColor: const Color(0xff3A7E04),
                  decoration: const InputDecoration(
                    hintText: "Alamat",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: provinceController,
                  cursorColor: const Color(0xff3A7E04),
                  decoration: const InputDecoration(
                    hintText: "Provinsi",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: cityController,
                  cursorColor: const Color(0xff3A7E04),
                  decoration: const InputDecoration(
                    hintText: "Kota",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: postalCodeController,
                  cursorColor: const Color(0xff3A7E04),
                  decoration: const InputDecoration(
                    hintText: "Kode Pos",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: phoneController,
                  cursorColor: const Color(0xff3A7E04),
                  decoration: const InputDecoration(
                    hintText: "Telepon",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    onButtonPressed(
                      namaController.text,
                      dateOfBirthController.text,
                      addressController.text,
                      provinceController.text,
                      cityController.text,
                      postalCodeController.text,
                      phoneController.text,
                    );
                  },
                  child: Text("Selesai".toUpperCase()),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
