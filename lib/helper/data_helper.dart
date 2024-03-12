import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/model/ders.dart';

class DataHelper {
/*
AA / 4.00 / 90 – 100

BA / 3.50 / 85 – 89

BB / 3.00 / 80 – 84

CB / 2.50 / 70 – 79 

CC / 2.00 / 60 – 69

DC / 1.50 / 50 – 59

DD / 1.00 / 45 – 49

FF / 0.00 / 0 – 44
*/
  static List<String> _tumDerslerinHarfleri() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FF'];
  }

  static double _harfNotaCevir(String Harf) {
    switch (Harf) {
      case 'AA':
        return 4.00;
      case 'BA':
        return 3.50;
      case 'BB':
        return 3.00;
      case 'CB':
        return 2.50;
      case 'CC':
        return 2.00;
      case 'DC':
        return 1.50;
      case 'DD':
        return 1.00;
      case 'FF':
        return 0.00;
      default:
        return -1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfNotaCevir(e),
            ))
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

  static List<Ders> tumEklenenDersler = [];

  static DersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamKredi += element.krediDegeri;
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
    });
    return toplamNot / toplamKredi;
  }
}
