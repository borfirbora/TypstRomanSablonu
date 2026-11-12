# Typst Roman / Kitap Şablonu

Bu arşiv, Typst ile profesyonel roman ve kitap mizanpajı hazırlamak için modüler olarak kurgulanmıştır.

## Dosya Yapısı

- main.typ: Tüm bölümleri ve kapakları sırayla derleyen ana dosya.
- stil.typ: Sayfa boyutları (A5), cilt payı (inside: 2.2cm), yazı tipleri, edebi paragraf ayarları ve dinamik üst bilgi kuralları (context ve query).
- bolumler/:
  - 00-ic-kapak.typ: Kitap iç kapak (Title page) sayfası.
  - 00-kunye.typ: Matbaa, telif hakları, ISBN ve yayıncı künye sayfası.
  - 01-giris.typ: 1. Bölüm edebi metni.
  - 02-gelisme.typ: 2. Bölüm edebi metni.

## Nasıl Derlenir?

1. Typst CLI Kullanarak:
   typst compile main.typ roman.pdf
2. VS Code veya Typst Web App:
   Klasörü açıp main.typ dosyasını derlemeniz yeterlidir.

## Yeni Bölüm Eklemek

bolumler/ klasörüne 03-sonuc.typ gibi bir dosya açıp, main.typ içerisine #include "bolumler/03-sonuc.typ" satırını ekleyebilirsiniz.
