import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/sockets_io.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:loadmore/loadmore.dart';
import 'package:lottie/lottie.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:part3/detail_peminjam.dart';
import 'package:part3/models/users.dart';
import 'package:part3/provider/data_users.dart';
import 'package:part3/services/data_users_services.dart';
import 'package:part3/widgets/button_widget.dart';
import 'package:part3/widgets/card_pinjam.dart';
import 'package:part3/widgets/custom_textfield.dart';
import 'package:part3/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataUsers c = Get.find();
  @override
  void initState() {
    c.getData();
  }

  @override
  Widget build(BuildContext context) {
    header() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMarginn,
        ),
        padding: EdgeInsets.symmetric(horizontal: defaultMarginn),
        child: Text(
          'Data Buku Tanah',
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    floating() {
      return FloatingActionButton(
        onPressed: () {
          c.subscribe();
        },
      );
    }

    unsuscribe() {
      return ElevatedButton(
          onPressed: () => c.unsubscribe(), child: Text('Unsuscribe'));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        floatingActionButton: floating(),
        bottomSheet: unsuscribe(),
        body: EasyRefresh(
          onRefresh: () => c.getData(),
          onLoad: () => c.onRefresh(),
          child: FutureBuilder<RxList<dynamic>>(
            future: c.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (c.passengers.length == null) {
                Center(
                  child: Text('Tidak ada data'),
                );
              }
              return Obx(
                () => ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: c.passengers.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data![index];
                    return CardPinjam(
                      name: data.name,
                      jabatan: data.id,
                      jumlahBuku: data.trips.toString(),
                      noBuku: data.id,
                      noAntrian: index.toString(),
                    );
                  },
                ),
                   
              );
            },
          ),
        ),
      ),
    );
  }
}
