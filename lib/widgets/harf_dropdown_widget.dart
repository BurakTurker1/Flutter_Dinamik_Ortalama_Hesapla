import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constants/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/helper/data_helper.dart';

class HarfDorpDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDorpDownWidget({required this.onHarfSecildi,super.key});

  @override
  State<HarfDorpDownWidget> createState() => _HarfDorpDownWidgetState();
}

class _HarfDorpDownWidgetState extends State<HarfDorpDownWidget> {
    double secilenHarfDegeri = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Sabitler.DropDownMargin,
      padding: Sabitler.DropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.FormRenk, borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        items: DataHelper.tumDerslerinHarfleri(),
        underline:
            Container(), //Dropdownbutton altındaki çizgiyi kaldırmak için
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri); //burası eklenmeli
          });
        },
      ),
    );
  }
}