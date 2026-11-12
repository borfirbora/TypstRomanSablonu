#import "stil.typ": kitap-stili

#show: kitap-stili.with(
  baslik: "Gece ve Kod",
  yazar: "Bora Fırlangeç"
)

// 1. Dış Kapak
#page(fill: rgb("#161a29"), margin: 0pt, header: none, footer: none)[
  #align(center + horizon)[
    #text(size: 28pt, weight: "bold", fill: white, tracking: 2pt)[GECE VE KOD] \
    #v(1.5em)
    #text(size: 15pt, fill: rgb("#9fa8da"))[Bora FIRLANGEÇ]
  ]
]

// 2. İç Kapak (Sağ / Tek Sayfa)
#include "bolumler/00-ic-kapak.typ"

// 3. Künye ve Telif Sayfası (İç Kapağın Arkası / Sol Sayfa)
#include "bolumler/00-kunye.typ"

// 4. İçindekiler Tablosu
#page(header: none, footer: none)[
  #v(2.5em)
  #outline(title: [İçindekiler], depth: 1, indent: 1.5em)
]

// 5. Sayfa Sayacını 1. Bölüm İçin Başlat
#counter(page).update(1)

// 6. Bölümler
#include "bolumler/01-giris.typ"
#include "bolumler/02-gelisme.typ"
