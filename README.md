# Toko Online CodeIgniter 4

Proyek ini adalah platform toko online yang dibangun menggunakan [CodeIgniter 4](https://codeigniter.com/). Sistem ini menyediakan beberapa fungsionalitas untuk toko online, termasuk manajemen produk, keranjang belanja, dan sistem transaksi.

## Daftar Isi

- [Fitur](#fitur)
- [Persyaratan Sistem](#persyaratan-sistem)
- [Instalasi](#instalasi)
- [Struktur Proyek](#struktur-proyek)

## Fitur

- Katalog Produk

  - Tampilan produk dengan gambar
  - Pencarian produk

- Keranjang Belanja

  - Tambah/hapus produk
  - Update jumlah produk

- Sistem Transaksi

  - Proses checkout
  - Riwayat transaksi

- Panel Admin

  - Manajemen produk (CRUD)
  - Manajemen kategori
  - Laporan transaksi
  - Export data ke PDF

- Sistem Autentikasi

  - Login/Register pengguna
  - Manajemen akun

- UI Responsif dengan NiceAdmin template

- **Autentikasi Pengguna:**

  - Pengguna dapat mendaftar dan login untuk mengakses fitur aplikasi.
  - Hanya pengguna dengan role admin yang dapat mengelola produk dan diskon.

- **Manajemen Produk:**

  - Admin dapat menambah, mengedit, dan menghapus produk.
  - Setiap produk memiliki nama, harga, jumlah, dan foto.

- **Keranjang Belanja:**

  - Pengguna dapat menambahkan produk ke dalam keranjang.
  - Harga produk dapat dikurangi dengan diskon yang berlaku.

- **Manajemen Diskon:**

  - Admin dapat menambah, mengedit, dan menghapus data diskon.
  - Diskon hanya dapat ditambahkan untuk tanggal yang unik, dan validasi diterapkan untuk memastikan tidak ada diskon yang sama.

- **Transaksi Pembelian:**
  - Pengguna dapat melakukan checkout dan menyelesaikan pembelian.
  - Data transaksi disimpan dalam database, termasuk detail item yang dibeli dan total harga.
- **API untuk Dashboard:**
  - Menyediakan endpoint API untuk mengambil data transaksi pembelian.
  - Data transaksi mencakup jumlah item yang dibeli untuk setiap transaksi.

## Persyaratan Sistem

- PHP >= 8.2
- Composer
- Web server (XAMPP)

## Instalasi

1. **Clone repository ini**
   ```bash
   git clone [https://github.com/AbdKhlm/belajar-tugas-ci]
   cd belajar-ci-tugas
   ```
2. **Install dependensi**
   ```bash
   composer install
   ```
3. **Konfigurasi database**

   - Start module Apache dan MySQL pada XAMPP
   - import database **db_ci4** di phpmyadmin.
   - copy file .env dari blogger https://kazuhamiori.blogspot.com/2025/07/env.html

4. **Jalankan migrasi database**
   ```bash
   php spark migrate
   ```
5. **Seeder data**
   ```bash
   php spark db:seed ProductSeeder
   ```
   ```bash
   php spark db:seed UserSeeder
   ```
6. **Jalankan server**
   ```bash
   php spark serve
   ```
7. **Akses aplikasi**
   Buka browser dan akses `http://localhost:8080` untuk melihat aplikasi.

## Struktur Proyek

Proyek menggunakan struktur MVC CodeIgniter 4:

- app/Controllers - Logika aplikasi dan penanganan request
  - AuthController.php - Autentikasi pengguna
  - ProdukController.php - Manajemen produk
  - TransaksiController.php - Proses transaksi
- app/Models - Model untuk interaksi database
  - ProductModel.php - Model produk
  - UserModel.php - Model pengguna
- app/Views - Template dan komponen UI
  - v_produk.php - Tampilan produk
  - v_keranjang.php - Halaman keranjang
- public/img - Gambar produk dan aset
- public/NiceAdmin - Template admin
