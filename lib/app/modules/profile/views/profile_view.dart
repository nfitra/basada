import 'package:basada/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun'),
        backgroundColor: const Color(0xff266D05),
        elevation: 0,
      ),
      body: controller.obx(
        (state) => Column(
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff266D05),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/user.jpeg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.profileData.value.nName.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.profileData.value.fkAuth.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Saldo Rp." +
                        controller.profileData.value.nBalance.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.EDIT_PROFILE,
                        arguments: controller.profileData.value),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                          color: Color(0xff266D05),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Color(0xff266D05),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => controller.launchUrlString(
                        "https://banksampah.pekanbaru.go.id/home/jadwal_sampah"),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.group,
                          color: Color(0xff266D05),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Agen Penjemputan',
                          style: TextStyle(
                            color: Color(0xff266D05),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => controller.launchUrlString(
                        "https://banksampah.pekanbaru.go.id/home/jadwal_sampah"),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.home,
                          color: Color(0xff266D05),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Drop Point',
                          style: TextStyle(
                            color: Color(0xff266D05),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => controller.launchUrlString(
                        "https://banksampah.pekanbaru.go.id/home/index"),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.question_mark,
                          color: Color(0xff266D05),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Bantuan',
                          style: TextStyle(
                            color: Color(0xff266D05),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => controller.logout(),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Color(0xff266D05),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Keluar',
                          style: TextStyle(
                            color: Color(0xff266D05),
                            fontSize: 20,
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
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
