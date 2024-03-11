import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constants/app_constant.dart';

class Ortalama_goster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const Ortalama_goster(
      {required this.dersSayisi, required this.ortalama, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi ders girildi': 'Ders seciniz',style: Sabitler.OrtalamaGosterBodyStyle,
        ),
        Text(ortalama >=0 ? '${ortalama.toStringAsFixed(2)}' :'0.00',style: Sabitler.OrtalamaStyle,),
        Text('Ortalama',style: Sabitler.OrtalamaGosterBodyStyle,),
      ],
    );
  }
}
