# **Game & Quotes Apps**

Game & Quotes Apps adalah aplikasi berbasis Flutter yang menggabungkan game interaktif dengan Fitur kutipan. Pemain akan menebak kategori dari sebuah gambar dan dapat menambahkan atau mengelola kutipan mereka sendiri.

## MobilePrograming_Assignment1

  - Nama: Lalu Aldo Wadagraprana
  - NRP: 5025221101
  - Kelas: Pemrograman Perangkat Bergerak B
  - Dosen: Agus Budi Raharjo, S.Kom, M.Kom., Ph.D.
  - Demo Video: https://youtu.be/Pnq_9Pro3tc
    
Tugas Pemrograman Perangkat Bergerak B - Membuat Aplikasi Sederhana Berbasis Flutter dengan StatefullWidget, StatelessWidget, custom class, Apply create, read, update, delete.

## Fitur Utama

  - Game Tebak Kategori → Pilih kategori gambar yang benar dan dapatkan skor.
  - Animasi Interaktif → Tombol akan bergoyang saat salah dan membesar saat benar.
  - Manajemen Kutipan → Tambahkan, edit, dan hapus kutipan inspiratif.
  - State Management dengan Provider → Mengelola status permainan dengan efisien.
  - Desain Responsif & Modern → UI bersih dengan tema biru yang menarik.

## Teknologi yang Digunakan

  - Flutter → Framework utama untuk pengembangan aplikasi.
  - Provider → Untuk state management yang efisien.
  - Material Design → UI berbasis Flutter Material.

## Struktur Proyek
```
lib/
├── main.dart                  # Entry point aplikasi
├── screens/
│   ├── main_screen.dart       # Tampilan utama aplikasi
├── widgets/
│   ├── game_buttons.dart      # Widget tombol permainan
│   ├── image_display.dart     # Widget tampilan gambar
│   ├── quote_card.dart        # Widget kartu kutipan
├── models/
│   ├── quote.dart             # Model data kutipan
├── services/
│   ├── game_service.dart      # Logika utama permainan
├── utils/
│   ├── snackbar_helper.dart   # Helper untuk snackbar (notifikasi)
```

## Tampilan Aplikasi

`Tamppilan Awal`

![image](https://github.com/user-attachments/assets/1a71d658-5db3-4773-9a65-30cbcd0ef7b6)

`Tapilan Ketika Benar dalam Game`

![image](https://github.com/user-attachments/assets/0f0adfcb-3f8b-4dd2-8180-549f9ffb2370)

`Tampilan Ketika Salah Dalam Game`

![image](https://github.com/user-attachments/assets/29893158-6db1-4707-8030-d3284c89a622)

`Tampilan Penambahkan Quote`

![image](https://github.com/user-attachments/assets/ecad4e9d-e5b7-43a9-a17f-42f046c1b2e3)

`Tampilan Megedit Quote`

![image](https://github.com/user-attachments/assets/fbe140ee-f86d-4bef-adbb-1ba55a954173)


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Cara Menjalankan Aplikasi

Pastikan Anda sudah menginstal Flutter dan menjalankan perintah berikut:

  - Clone repository ini
    ```
    git clone https://github.com/Wadagraprana/MobilePrograming_Assignment1.git
    cd MobilePrograming_Assignment1
    ```
  - Jalankan aplikasi
    ```
    flutter clean
    flutter pub get
    flutter run
    ```
