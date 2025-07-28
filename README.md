# Shartflix Case Study

Modern Flutter uygulama geliştirme best practice'lerini gösteren, temiz mimari, state management ve kullanıcı deneyimine odaklanan bir mobil uygulama.

## 🎯 Proje Genel Bakış

Shartflix, aşağıdaki temel özellikleri gösteren iyi yapılandırılmış bir Flutter projesi case study'sidir:

- **Kimlik Doğrulama Sistemi**: Form doğrulaması ile giriş ve kayıt
- **Çoklu Dil Desteği**: İngilizce ve Türkçe yerelleştirme
- **Profil Yönetimi**: Fotoğraf yükleme özelliği ile kullanıcı profili
- **Modern UI/UX**: Yumuşak geçişler ve animasyonlarla karanlık tema
- **Temiz Mimari**: Özellik tabanlı organizasyon ile endişelerin ayrılması

## 🏗️ Mimari

Proje, özellik tabanlı klasör yapısı ile **Temiz Mimari** prensiplerini takip eder:

```
lib/
├── core/           # Temel işlevsellik ve yardımcı programlar
│   ├── consts/     # Sabitler ve yapılandırmalar
│   ├── init/       # Uygulama başlatma
│   ├── navigation/ # Yönlendirme ve navigasyon
│   ├── network/    # Ağ katmanı ve API servisleri
│   ├── services/   # Temel servisler
│   └── utils/      # Yardımcı fonksiyonlar
├── feature/        # Özellik modülleri
│   ├── auth/       # Kimlik doğrulama özelliği
│   ├── home/       # Ana sayfa özelliği
│   ├── profile/    # Profil yönetimi özelliği
│   └── splash/     # Açılış ekranı özelliği
└── shared/         # Paylaşılan bileşenler ve widget'lar
```

Her özellik **Domain-Driven Design** desenini takip eder:
- **Veri Katmanı**: Repository'ler ve veri kaynakları
- **Domain Katmanı**: İş mantığı ve varlıklar
- **Sunum Katmanı**: UI bileşenleri ve state management

## 🚀 Özellikler

### Kimlik Doğrulama
- E-posta ve şifre ile kullanıcı girişi
- Doğrulama ile kullanıcı kaydı
- `flutter_secure_storage` kullanarak güvenli token depolama
- Kapsamlı hata mesajları ile form doğrulaması

### Çoklu Dil Desteği
- İngilizce ve Türkçe yerelleştirme
- Dinamik dil değiştirme
- Yerelleştirilmiş hata mesajları ve UI metinleri

### Profil Yönetimi
- Kullanıcı profilini görüntüleme ve düzenleme
- Fotoğraf yükleme işlevselliği
- Profil verisi kalıcılığı

### Navigasyon
- Shell routing ile alt navigasyon
- Ekranlar arası yumuşak kaydırma geçişleri
- Deep linking desteği

### UI/UX
- Varsayılan olarak karanlık tema, açık tema desteği
- Özel açılış ekranı
- Duyarlı tasarım
- Modern Material Design bileşenleri

## 🛠️ Teknoloji Yığını

### Temel Bağımlılıklar
- **Flutter**: ^3.8.1
- **Dart**: ^3.8.1

### State Management
- **flutter_bloc**: ^9.1.1 - State management için BLoC deseni

### Navigasyon
- **go_router**: ^16.0.0 - Deklaratif yönlendirme

### Ağ ve Depolama
- **dio**: ^5.8.0+1 - HTTP istemcisi
- **shared_preferences**: ^2.5.3 - Yerel depolama
- **flutter_secure_storage**: ^9.2.4 - Token'lar için güvenli depolama

### UI ve Varlıklar
- **flutter_svg**: ^2.2.0 - SVG desteği
- **cached_network_image**: ^3.4.1 - Görsel önbellekleme
- **image_picker**: ^1.1.2 - Görsel seçimi

### Uluslararasılaştırma
- **easy_localization**: ^3.0.7+1 - Çoklu dil desteği

### Geliştirme Araçları
- **very_good_analysis**: ^9.0.0 - Kod analizi
- **build_runner**: ^2.4.15 - Kod üretimi
- **flutter_launcher_icons**: ^0.14.4 - Uygulama ikonları
- **flutter_native_splash**: ^2.4.6 - Açılış ekranı

## 📱 Ekran Görüntüleri

Uygulama aşağıdaki ana ekranları içerir:
- Açılış Ekranı
- Giriş Ekranı
- Kayıt Ekranı
- Ana Sayfa
- Profil Ekranı
- Fotoğraf Yükleme Ekranı

## 🚀 Başlangıç

### Ön Gereksinimler
- Flutter SDK ^3.8.1
- Dart SDK ^3.8.1
- Android Studio / VS Code
- Android SDK (Android geliştirme için)
- Xcode (iOS geliştirme için, sadece macOS)

### Kurulum

1. **Repository'yi klonlayın**
   ```bash
   git clone <repository-url>
   cd shartflix-case
   ```

2. **Bağımlılıkları yükleyin**
   ```bash
   flutter pub get
   ```

3. **Uygulamayı çalıştırın**
   ```bash
   flutter run
   ```

### Build Komutları

**Android için:**
```bash
flutter build apk --release
```

**iOS için:**
```bash
flutter build ios --release
```

## 🔧 Yapılandırma

### Ortam Kurulumu
Uygulama ortam özel yapılandırmalar kullanır. Şunları yaptığınızdan emin olun:
1. Geliştirme ortamınızı kurun
2. Ağ katmanında API endpoint'lerini yapılandırın
3. `assets/translations/` içinde yerelleştirme dosyalarını ayarlayın

### Kod Üretimi
Gerekli kodu üretmek için aşağıdaki komutu çalıştırın:
```bash
flutter packages pub run build_runner build
```

## 📁 Proje Yapısı

### Temel Modüller
- **Uygulama Başlatma**: Uygulama başlangıcı ve yapılandırma
- **BLoC Başlatma**: State management kurulumu
- **Yerelleştirme Yöneticisi**: Çoklu dil desteği
- **Tema Yöneticisi**: Açık/Koyu tema yapılandırması
- **Navigasyon**: Yönlendirme ve navigasyon yönetimi

### Özellik Modülleri
Her özellik kendi içinde:
- Veri katmanı (repository'ler, veri kaynakları)
- Domain katmanı (varlıklar, use case'ler)
- Sunum katmanı (sayfalar, widget'lar, BLoC'lar)



## 📦 Bağımlılık Yönetimi

Proje modern bağımlılık yönetimi kullanır:
- **get_it**: Bağımlılık enjeksiyonu
- **equatable**: Nesneler için değer eşitliği
- **flutter_bloc**: State management
- **go_router**: Navigasyon

## 🔒 Güvenlik

- `flutter_secure_storage` kullanarak güvenli token depolama
- Girdi doğrulama ve sanitizasyon
- Dio ile güvenli ağ iletişimi

## 🌐 Uluslararasılaştırma

Uygulama birden fazla dili destekler:
- İngilizce (en-US)
- Türkçe (tr-TR)

Çeviri dosyaları `assets/translations/` konumunda bulunur

## 🎨 UI/UX Özellikleri

- **Karanlık Tema**: Varsayılan olarak modern karanlık tema
- **Yumuşak Animasyonlar**: Özel kaydırma geçişleri
- **Duyarlı Tasarım**: Farklı ekran boyutlarına uyum
- **Erişilebilirlik**: WCAG uyumlu tasarım
- **Özel İkonlar**: Markalı uygulama ikonları ve açılış ekranı

## 📈 Performans

- Daha iyi performans için görsel önbellekleme
- Bileşenlerin tembel yüklenmesi
- Optimize edilmiş state management
- GoRouter ile verimli navigasyon

---

**Not**: Bu, Flutter geliştirme best practice'lerini, temiz mimariyi ve modern mobil uygulama geliştirme tekniklerini göstermek için tasarlanmış bir case study projesidir.
