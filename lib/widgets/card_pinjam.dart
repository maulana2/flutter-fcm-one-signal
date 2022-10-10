import 'package:flutter/material.dart';
import 'package:part3/widgets/theme.dart';

class CardPinjam extends StatelessWidget {
  final String name;
  final String jabatan;
  final String noBuku;
  final String jumlahBuku;
  final String noAntrian;
  const CardPinjam({
    Key? key,
    required this.name,
    required this.jabatan,
    required this.jumlahBuku,
    required this.noBuku,
    required this.noAntrian,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultMarginn, vertical: defaultMarginn),
      margin: EdgeInsets.only(
          left: defaultMarginn, right: defaultMarginn, bottom: defaultMarginn),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgGrey,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: black,
                ),
              ),
              Text(
                '#${noAntrian}',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '(${jabatan})',
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              color: black,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'No buku yang akan dipinjam',
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              color: black,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            noBuku,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              color: black,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '+ ${jumlahBuku} BT lainya',
            style: primaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
