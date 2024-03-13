import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constants/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/model/ders.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  const OrtalamaHesaplaApp({super.key});

  @override
  State<OrtalamaHesaplaApp> createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double secilenHarfDegeri = 2;
  double secilenKrediDegeri = 2;
  String girilenDersAdi = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.BaslikText,
            style: Sabitler.BaslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //form
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: _buildForm(),
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Ortalama_goster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                  ),
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          //notların gelcegi Liste
          Expanded(
            child: Container(
              child: DersListesi(
                onDismis: (index) {
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {});
                },
              ),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HarfDorpDownWidget(
                onHarfSecildi: (harf) {
                  secilenHarfDegeri = harf;
                },
              ),
              KrediDropDownWidget(
                onKrediSecildi: (kredi){
                  secilenKrediDegeri = kredi;
                },
              ),
              IconButton(
                  onPressed: _DersEkleveOrtalamaHesapla,
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  style: Sabitler.IconbuttonStyle),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders adini giriniz';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide(width: 5),
        ),
        filled: true,
        fillColor: Sabitler.FormRenk,
      ),
    );
  }

  _DersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.DersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
