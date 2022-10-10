import 'package:flutter/material.dart';
import 'package:part3/widgets/theme.dart';

class DetailPeminjam extends StatelessWidget {
  const DetailPeminjam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    header() {
      return Container(
        padding: EdgeInsets.all(defaultMarginn),
        height: 120,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Peminjam',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '#213',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Ade',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jabatan',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Detail Tranksaksi',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    cardList() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgGrey,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: defaultMarginn,
          vertical: defaultMarginn,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: defaultMarginn,
          vertical: 10,
        ),
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No 1234',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Lokasi fisik :',
              style: primaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              'Cardex 4, Slot 5, No Album 10',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              height: 42,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'BT Sudah Siap',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    color: white,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pinjaman BT'),
        centerTitle: true,
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          header(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMarginn),
            child: Text(
              '6 BT yang akan dipinjam',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          ),
          cardList(),
        ],
      ),
    );
  }
}
