[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Q6ZQd3M9)

# 🌍 Analisis Harga Pangan Global 2025
> **Final Project: Comprehensive Data Analysis (CODA) - RMT-012**

[![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![PySpark](https://img.shields.io/badge/PySpark-3.0+-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)](https://spark.apache.org/docs/latest/api/python/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Data_Warehouse-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://neon.tech/)
[![Tableau](https://img.shields.io/badge/Tableau-Visualization-E97627?style=for-the-badge&logo=tableau&logoColor=white)](https://public.tableau.com/)

## Analisis Harga Pangan Global 2025
_Final Project CODA RMT-012_

## Background
Dataset WFP Food Prices Global 2025 menyediakan data harga komoditas yang bersifat granular, mencakup informasi waktu, lokasi pasar, jenis komoditas, harga lokal, harga dalam USD, serta indikator ekonomi seperti GDP per kapita. Data ini memungkinkan analisis terhadap tren harga, perbandingan harga antar wilayah, serta keterkaitan antara kondisi ekonomi dan harga komoditas.

## Problem Statement
Bagaimana cara memahami dan menganalisis dinamika harga komoditas global pada tahun 2025 dengan mengidentifikasi tren harga, perbedaan harga antar pasar dan negara, serta hubungan antara harga komoditas dan kondisi ekonomi, sehingga dapat mendukung pengambilan keputusan operasional yang lebih efisien (seperti restok komoditas) dan memberikan insight berbasis data terkait ketimpangan harga dan daya beli masyarakat?

## Exploratory Data Harga Pangan Global (WFP 2025)
Menggabungkan Data Harga Pangan dengan GDP per Kapita | WFP Data - Master Data - GDP Data
a. Mapping Negara
Menambahkan kolom Country yang berisi nama negara dengan mengacu pada kolom CountryISO3.
b. Sumber Data Tambahan
Mengimpor data GDP per kapita untuk memberikan konteks ekonomi pada analisis harga.
c. Data Cleaning
Mengubah beberapa tipe data menjadi numerik, dan menangani perbedaan penulisan nama negara antar dataset.

## Skalabilitas & Efisiensi
Strategi kami berfokus pada Arsitektur Modern yang Hemat Biaya. Dengan menggunakan tools, tidak hanya mendapatkan performa tinggi, tapi juga efisiensi operasional
a. Memproses data lebih cepat (PySpark).
b. Mengurangi biaya infrastruktur (Neon DB).
c. Mempercepat waktu pengembangan dan deployment (Docker).

## ETL Process
A. Tahap Extract (Ekstraksi Data) | Mengambil data mentah dari sumber luar
1. Sumber Data
World Food Programme (WFP) Humanitarian Data Portal.
2. Format
Dataset dalam bentuk CSV.
3. Metode
Pengambilan data dilakukan secara otomatis menggunakan protokol HTTP GET (API call atau direct download).

B. Tahap Transform (Transformasi Data) | Pemrosesan data menggunakan framework PySpark untuk mengubah data mentah menjadi format yang siap dianalisis
1. Cleaning
   Melakukan pembersihan data, salah satu langkah krusialnya adalah menghapus HXL Metadata (tag khusus data kemanusiaan) agar tidak mengganggu proses kalkulasi.
2. Pemodelan Data (Star Schema)
   Data dipecah menjadi struktur tabel pendukung analisis:
   a. Fact Table: fact_food_price (berisi data transaksi/harga pangan).
   b. Dimension Tables: Data dikelompokkan ke dalam kategori Dim Commodity (komoditas), Dim Country (negara), Dim Market (pasar), dan Dim Date (waktu).
3. Penyimpanan Sementara
   Hasil transformasi disimpan dalam format Parquet (file kolom yang efisien) ke dalam direktori lokal atau cloud storage sebagai staging area.

C. Tahap Load (Pemuatan Data) | Memindahkan data yang sudah bersih ke penyimpanan permanen
1. Teknologi
   Menggunakan Spark JDBC sebagai jembatan pengiriman data.
2. Target
   Data dimuat ke dalam Neon PostgreSQL Data Warehouse. Di sini, data sudah siap digunakan oleh tim analis atau aplikasi visualisasi data (seperti Tableau atau Power BI).

## Dashboard
[Tableau Dashboard](https://public.tableau.com/views/CODA_RMT12_finalproj/Story1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
