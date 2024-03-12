import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constants/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/model/ders.dart';

class DersListesi extends StatefulWidget {
  const DersListesi({super.key});

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {

    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length >0 ? ListView.builder(
        itemCount: tumDersler.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(), //listeye eklenen her elemana uniq key atıyo
            direction: DismissDirection.startToEnd,
            onDismissed: (deger){
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {
                
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Card(
                child: ListTile(
                  title: Text(tumDersler[index].ad),
                  leading: CircleAvatar(
                      backgroundColor: Sabitler.AnaRenk,
                      child: Text(
                        (tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toString(),
                      )),
                  subtitle: Text(
                      '${tumDersler[index].krediDegeri} kredi, Not Değeri ${tumDersler[index].harfDegeri}'),
                ),
              ),
            ),
          );
        }) : Container(child: Center(child: Text('Lütfen Ders giriniz',style: TextStyle(fontSize: 35),)),);
  }
}
