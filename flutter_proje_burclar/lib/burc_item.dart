import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje_emrehoca/data/modeller/burc_detay.dart';
import 'package:flutter_proje_emrehoca/data/modeller/model.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, super.key});

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
          ),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.asset(
            "images/" + listelenenBurc.burcBuyukResim,
          ),
          title: Text(
            listelenenBurc.burcAdi,
            style: myTextStyle.headline5,
          ),
          subtitle: Text(
            listelenenBurc.burcTarihi,
            style: myTextStyle.subtitle1,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
