import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_proje_emrehoca/burc_item.dart';
import 'package:flutter_proje_emrehoca/data/modeller/model.dart';
import 'package:flutter_proje_emrehoca/data/strings.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BurcListesi extends StatefulWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }
  int sayi = 0;
  @override
  State<BurcListesi> createState() => _BurcListesiState();
}

class _BurcListesiState extends State<BurcListesi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Burçlar Listesi "), actions: [
        Icon(Icons.date_range),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
            ),
          ],
        ),
      ]),
      body: Container(
        color: Color.fromARGB(255, 232, 245, 255),
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BurcItem(listelenenBurc: widget.tumBurclar[index]);
            },
            itemCount: widget.tumBurclar.length,
          ),
        ),
      ),
    );
  }
}

List<Burc> veriKaynaginiHazirla() {
  List<Burc> gecici = [];
  for (int i = 0; i < 12; i++) {
    var burcAdi = Strings.BURC_ADLARI[i];
    var burcTarih = Strings.BURC_TARIHLERI[i];
    var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
    //koc1.png degerini olusturmka Koc --> koc --> koc1.png olusturduk
    var burcKucukResim = Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
    var burcBuyukResim =
        Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';

    Burc eklenecekBurc =
        Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
    gecici.add(eklenecekBurc);
  }
  return gecici;
}
