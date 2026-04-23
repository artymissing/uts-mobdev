# 📱 Meal App - Flutter Project

Nama: Rizki Dwi Anugrah
Npm : 2331082
Mata Kuliah: pengembagan aplikasi mobile

---

## 📌 Deskripsi Project
Aplikasi ini adalah aplikasi Flutter berbasis data (data-driven) yang mengambil data makanan dari Public API. Aplikasi ini menerapkan arsitektur yang rapi, fitur offline, serta tampilan UI yang responsif.

---

## 🧱 Struktur Folder

- models/ → struktur data
- services/ → logika API
- providers/ → manajemen state
- views/ → tampilan UI
- widgets/ → komponen yang dapat digunakan ulang

---

## ⚙️ State Management
Saya menggunakan **Provider** karena sederhana, ringan, dan cocok untuk mengelola state pada aplikasi skala kecil hingga menengah.

---

## 🌐 Integrasi API
Aplikasi mengambil data dari API TheMealDB menggunakan HTTP request. Semua logika API dipisahkan ke dalam folder `services`.

---

## 💾 Dukungan Offline
Aplikasi menggunakan **SharedPreferences** untuk menyimpan cache data terakhir.  
Jika tidak ada koneksi internet, aplikasi tetap dapat menampilkan data yang sudah disimpan sebelumnya.

---

## 🔍 Fitur Aplikasi
- Mengambil data dari API
- Mendukung mode offline
- Fitur pencarian (search)
- Fitur filter berdasarkan kategori
- Loading indicator
- Error handling dengan tampilan yang user-friendly

---

## 🎯 Kesimpulan
Project ini menunjukkan penerapan arsitektur yang bersih, penggunaan state management yang tepat, serta desain UI yang responsif dalam pengembangan aplikasi Flutter.
