import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:part3/models/users.dart';
import 'package:http/http.dart' as http;

class UsersServices {
  List<Passenger> dataPassenger = [];
  Future<List<Passenger>> getDataServices(currentPage) async {
    try {
      String url = 'https://reqres.in/api/users?page=2';
      var response = await http.get(Uri.parse(url));
      var stCode = response.statusCode;
      print(stCode);
      switch (stCode) {
        case 200:
          final result = jsonDecode(response.body)['data'] as List;
          dataPassenger =
              dataPassenger + result.map((e) => Passenger.fromJson(e)).toList();
          return dataPassenger;
        
        default:
      }
    } on SocketException {
      Get.snackbar('Terjadi Kesalahan', 'Tidak ada koneksi Internet');
    } on HttpException {
      print('Http ex');
      Get.snackbar('Terjadi Kesalahan', 'Tidak dapat menemukan data');
    } on FormatException {
      Get.snackbar('Terjadi Kesalahan', 'Bad response format');
    } catch (e) {
      print('default try');
      Get.snackbar('Terjadi Kesalahan', 'Kesalahan ${e.toString()}',
          backgroundColor: Colors.red[500]);
    }
    return [];

    /* if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'] as List;
      var dataList = data.map((e) => Users.fromJson(e)).toList();
      return dataList;
    } else if (response.statusCode == 400) {
      Get.snackbar('Terjadi Kesalahan', 'Kesalahan ${response.body}');
    } else {
      Get.snackbar('Terjadi Kesalahan', 'Kesalahan ${response.body}');
    }
    return dataList; */
  }
}
