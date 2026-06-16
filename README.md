# Clove - Multi-Vendor E-Commerce Platform

Aplikasi e-commerce Android multi-vendor (B2C/C2C) dengan sistem pembayaran escrow dan manajemen komisi otomatis.

## 📱 Platform & Tech Stack

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: PostgreSQL
- **Authentication**: JWT
- **Payment Gateway**: Midtrans
- **Cloud Storage**: Firebase / AWS S3

### Frontend
- **Framework**: Flutter
- **State Management**: Provider / Riverpod
- **Local Storage**: Hive / SQLite

---

## 🎯 Core Features

### A. Modul Pembeli
- ✅ Autentikasi (Google, Phone, Email)
- ✅ Katalog & Pencarian (kategori, filter, sorting)
- ✅ Keranjang Belanja (multi-vendor)
- ✅ Payment Gateway Integration
- ✅ Pelacakan Pesanan Real-time
- ✅ Sistem Review & Rating

### B. Modul Penjual
- ✅ Manajemen Produk (CRUD, variasi, stok)
- ✅ Manajemen Pesanan
- ✅ Laporan Penjualan
- ✅ Pengaturan Toko
- ✅ Manajemen Promosi (voucher, diskon)

### C. Modul Super Admin
- ✅ Verifikasi Vendor
- ✅ Manajemen Komisi
- ✅ Manajemen Pengguna
- ✅ Dashboard Keuangan

---

## 🚀 Quick Start

### Prerequisites
- Node.js v16+
- PostgreSQL v12+
- Flutter SDK
- Git

### Setup Backend

```bash
cd backend
npm install
cp .env.example .env
# Edit .env dengan konfigurasi lokal Anda
npm run migrate
npm run dev
```

### Setup Frontend

```bash
cd frontend
flutter pub get
flutter run
```

---

## 📚 Documentation

- [Database Schema](./docs/DATABASE.md)
- [API Documentation](./docs/API.md)
- [Setup Guide](./docs/SETUP.md)

---

## 📊 Project Status

- [x] Project initialization
- [ ] Database schema & migrations
- [ ] Backend setup & authentication
- [ ] API endpoints (MVP)
- [ ] Frontend setup
- [ ] Payment integration
- [ ] Deployment

---

## 👥 Team

- **Maintainer**: mantokusmanto339-gif

---

## 📄 License

MIT License
