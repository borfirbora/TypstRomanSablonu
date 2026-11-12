#let kitap-stili(
  baslik: "Kitabın Adı",
  yazar: "Yazar Adı",
  govde
) = {
  // 1. PDF Metadata
  set document(title: baslik, author: yazar)

  // 2. Sayfa Boyutu ve Cilt Payı (A5 Standart Kitap)
  set page(
    paper: "a5",
    margin: (
      inside: 2.2cm,  // Cilt/dikiş payı
      outside: 1.6cm, // Dış kenar
      top: 2.2cm,
      bottom: 2.2cm
    ),
    numbering: "1",
    number-align: center + bottom,
    
    // Dinamik Üst Bilgi (Running Header - Context & Query ile)
    header: context {
      let sayfa-no = counter(page).get().first()
      // İlk sayfalarda (kapak, künye, içindekiler) üst bilgi görünmesin
      if sayfa-no > 2 {
        set text(size: 8.5pt, fill: luma(100), style: "italic")
        
        // Çift sayfalarda Kitap Adı, Tek sayfalarda o anki Bölüm Adı
        if calc.even(sayfa-no) [
          #baslik
          #h(1fr)
        ] else [
          #h(1fr)
          // O sayfadan önceki en son 1. seviye başlığı otomatik bulur
          #let son-baslik = query(selector(heading.where(level: 1)).before(here())).at(-1, default: none)
          #if son-baslik != none [ #son-baslik.body ]
        ]
      }
    }
  )

  // 3. Tipografi ve Yazı Tipi
  set text(
    font: "Georgia",
    size: 10.5pt,
    lang: "tr"
  )

  // 4. Edebi Paragraf Mizanpajı (Girintili ve İki Yana Yaslı)
  set par(
    justify: true,
    first-line-indent: 1.5em,
    leading: 0.75em,
    spacing: 0.75em
  )

  // 5. Bölüm Başlıklarının Tasarımı
  show heading.where(level: 1): it => {
    pagebreak(weak: true, to: "odd") // Her ana bölümü sağ (tek) sayfada açar
    v(3.5em)
    align(center)[
      #text(size: 15pt, weight: "bold", tracking: 1.5pt)[#it.body]
    ]
    v(2.5em)
  }

  // 6. İçindekiler Tablosu Görünümü
  show outline.entry.where(level: 1): it => {
    v(0.6em)
    strong(it)
  }

  // Gövde içeriğini mizanpaja uygula
  govde
}
