import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:part3/models/users.dart';
import 'package:part3/services/data_users_services.dart';
import 'package:http/http.dart' as http;
import 'package:part3/widgets/theme.dart';

class DataUsers extends GetxController {
  late RxList passengers = [].obs;
  int currentPage = 0;
  Future<RxList<dynamic>> getData() async {
    var result = await UsersServices().getDataServices(currentPage);
    passengers = result.obs;
    return passengers;
  }

  Future<bool> onRefresh() async {
    currentPage++;
    passengers =
        passengers + await UsersServices().getDataServices(currentPage);
    print(passengers.length);
    return true;
  }
}
