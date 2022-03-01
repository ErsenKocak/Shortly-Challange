# shortly_challange

Shortly-Challange Application.

## Genel Bilgilendirme
 - Uygulama Google Flutter Framework'ü kullanılarak geliştirilmiştir.
 - Uygulamanın Amacı;
   Kullanıcının girmiş olduğu url'leri  https://shrtco.de/docs/ API entegrasyonu sayesinde kısaltılmış url'ler haline getirmek ve bunu uygulamada göstermektir.
 - Emulator, Gerçek Android Cihaz ve Windows Application olarak test edilmiştir(Mac cihaz bulunmadığından IOS tarafı test edilememiştir.
   Olası Sorun; kullanılan kütüphanelerin IOS konfigürasyonları yapılmadığından hata verebilir.)



## Kullanılan Kütüphaneler

- [Flutter SVG](https://pub.dev/packages/flutter_svg)
- [GetX(State Management, Alternatif: Bloc)](https://pub.dev/packages/get)
- [Get It(Dependency Injection)](https://pub.dev/packages/get_it)
- [Logger](https://pub.dev/packages/logger)
- [Flutter EasyLoading](https://pub.dev/packages/flutter_easyloading)
- [Url Launcher](https://pub.dev/packages/url_launcher)
- [Dio(Network Transactions)](https://pub.dev/packages/dio)

## Url Shortener Entegrasyon

https://shrtco.de/docs/

## Tasarım yaklaşımı

- Kullanılan Widget'ların parçalanması ve gerekli yerlerde tekrar kullanılmasını amaçlayan Atomic Design yaklaşımı referans alınmıştır.
Amaç; Kod Okunabilirliği, Widgeti'ların tekrar tekrar kullanılabilme opsiyonu ve dinamikleştirmek.Atomic Design için örnek döküman;
https://itnext.io/atomic-design-with-flutter-11f6fcb62017
- [Atomic Design](https://itnext.io/atomic-design-with-flutter-11f6fcb62017)
- Kullanılan Widget'lar UI bazlı veya Uygulama geneli olma durumuna göre View dosyasının altında veya Core Katmanına eklendi

## Kullanılan Mimari

- Katmanlı mimari alt yapısı kullanılarak her katmanın kendi işini yapması amacıyla, kod okunabilirliği açısından ve sonra ki süreçte yapılan uygulamanın değişime direnç göstermemesi amacıyla MVC Design Pattern kullanımıştır(Alternatif; Repository Pattern, MVVM)
- Katmanlar; 
  - Models(Model class'ların tutulduğu katmandır.Kullanılan dataların referans modelleri saklanır.)
  - Views(UI elemanlarının tutulduğu katmandır ve sadece UI ile ilgili elemanlar tutulmalıdır)
  - Controller(Business kodunun yazıldığı UI ve Service katmanı arasında ki iş akışını sağlayan katmandır.)
  - Services(Dış Servislere HTTP protokolü üzeriden bağlanılan katmandır.)
  - Core(Uygulama özelinde olmayan ve her hangi bir projede kullanılabilmesi amaçlanan uygulama geneli yapıları tutar,Uygulama bağımsızdır(Örn; Helpers, Constants ve Uygulama dışı kullanılabilecek uygulamaya bağımlı olmayan widgetların tutulduğu katmandır))

  İş akışı;
   View --> Controller --> Services 
  ya da
   View <-- Controller <-- Services (Diğer yapılar ilgili iş akışına göre ilgili katmanda kullanılmaktadır.)















