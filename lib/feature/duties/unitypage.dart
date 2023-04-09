import 'package:f_44_oua/feature/duties/square.dart';
import 'package:flutter/material.dart';

class UnityPage extends StatelessWidget {
  final List _posts = [
    '🎮✨◢◤𝙐𝙣𝙞𝙩𝙮✨\n\n📅NİSAN AYINDA GÖREVLERİM\n\n🚩Unity Uzmanlık Eğitimlerinin 11-19 arası modüllerini (%70) tamamla.(ZORUNLU)\n\n🚩Google Proje Yönetimi Eğitimlerinin 3.kursunu tamamla.(ZORUNLU)\n\n🚩Yazılımcılar için İngilizce derslerinin ilk 6 modülünü tamamla.(SEÇENLER İÇİN ZORUNLU)\n\n🚩Game & App Jam’e katıl.(ZORUNLU)\n\n🌟Canlı yayınlara katıl.',
    '🎮✨◢◤𝙐𝙣𝙞𝙩𝙮✨\n\n📅MAYIS AYINDA GÖREVLERİM\n\n🚩Unity Uzmanlık Eğitimini %100 tamamla.(ZORUNLU)\n\n🚩Google Proje Yönetimi Eğitimlerinin 4. ve 5.kursunu tamamla.(ZORUNLU)\n\n🚩Yazılımcılar için İngilizce derslerini %100(8 modül) tamamla.(SEÇENLER İÇİN ZORUNLU)\n\n🚩Kariyer Zirvesine Katıl. (ZORUNLU)\n\n🌟Canlı yayınlara katıl.',
    '🎮✨◢◤𝙐𝙣𝙞𝙩𝙮✨\n\n📅HAZİRAN AYINDA GÖREVLERİM\n\n🎓Eksik kalan tüm eğitimlerini tamamla! Rozetlerini al.🏅\n\n🚩Google Proje Yönetimi Eğitimlerinin 6.kursunu tamamla. (ZORUNLU)\n\n🤝Kariyer Buluşması’na Katıl.\n\n👨‍🎓Mezuniyet BOOTCAMP’ine Odaklan.\n\n🌟Canlı yayınlara katıl.',
    '🎮✨◢◤𝙐𝙣𝙞𝙩𝙮✨\n\n📅TEMMUZ AYINDA GÖREVLERİM                 \n\n👨‍🎓BOOTCAMP’i tamamla.         \n\n🎓Mezuniyet Törenine katıl.\n\n📜Sertifikalarını al.\n\n🤝Mezunlar ağına dahil ol.',

    /*'post1',
    'post2',
    'post3',
    'post4',
    'post5',*/
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff4285F4), title: Text("Unity Görevler")),
      body: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final tempColor = (index + 1) % 4 == 0
                ? Color(0xffF4B400)
                : (index + 1) % 3 == 0
                    ? Color(0xff0F9D58)
                    : (index + 1) % 2 == 0
                        ? Color(0xff4285F4)
                        : Color(0xffDB4437);
            return MySquare(
              child: _posts[index],
              color: tempColor,
              late: (index == _posts.length - 1) ? true : false,
            );
          }),
    );
  }
}
