import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constants/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/helper/data_helper.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ortalama: 4.512,
                    dersSayisi: 7,
                  ),
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          //notların gelcegi Liste
          Expanded(
            child: Container(
              child: Text('Liste Buraya Gelecek'),
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
              _BuildHarfler(),
              _BuildKrediler(),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded),style: Sabitler.IconbuttonStyle),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
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

  _BuildHarfler() {
    return Container(
      margin: Sabitler.DropDownMargin,
      padding: Sabitler.DropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.FormRenk, borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),//Dropdownbutton altındaki çizgiyi kaldırmak için
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri =deger!;
          });
        },
      ),
    );
  }

  _BuildKrediler() {
    return Container(
      margin: Sabitler.DropDownMargin,
      padding: Sabitler.DropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.FormRenk, borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        items: DataHelper.tumDerslerinKredileri(),
        underline: Container(),//Dropdownbutton altındaki çizgiyi kaldırmak için
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri =deger!;
          });
        },
      ),
    );
  }
}
