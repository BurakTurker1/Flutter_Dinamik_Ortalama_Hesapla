import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constants/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/helper/data_helper.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropDownWidget({required this.onKrediSecildi,super.key});

  @override
  State<KrediDropDownWidget> createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
    double secilenKrediDegeri = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Sabitler.DropDownMargin,
      padding: Sabitler.DropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.FormRenk, borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        items: DataHelper.tumDerslerinKredileri(),
        underline:
            Container(), //Dropdownbutton altındaki çizgiyi kaldırmak için
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            widget.onKrediSecildi(secilenKrediDegeri);//burası ile secilen kredi degerini gönderiyoruz
          });
        },
      ),
    );
  }
}