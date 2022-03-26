-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Mar 2022 pada 08.33
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_antrian`
--

CREATE TABLE `tbl_antrian` (
  `id_antrian` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `antrian` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_dokter`
--

CREATE TABLE `tbl_dokter` (
  `id_dok` int(11) NOT NULL,
  `nama_dokter` varchar(200) DEFAULT NULL,
  `tempat_lahir` varchar(200) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `pendidikan_akhir` varchar(255) DEFAULT NULL,
  `id_layanan` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_dokter`
--

INSERT INTO `tbl_dokter` (`id_dok`, `nama_dokter`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `jenis_kelamin`, `status`, `pendidikan_akhir`, `id_layanan`) VALUES
(1, 'Adexe', 'Lahirian', '2018-10-05', 'Jalan Sumbreng									', 'male', 'Raja', 'Magister', 1),
(2, 'AdexeHola', 'Lhiaraasn', '2018-11-24', 'Dimana Saja												', 'female', 'Akademik', 'SMP', 3),
(3, 'adexe an ade', 'a12321', '2018-11-29', 'asdasdads																								', 'male', 'asdasd', 'SMK', 2),
(8, 'asdasd', 'asdasd', '2018-10-23', 'asdasdasd									', 'male', '123', 'SMK', 1),
(12, 'Desi', 'Semarang', '2018-12-22', 'Semarang dimana aku gatau', 'female', 'Istri Orang', 'Doktor', 2),
(13, 'Zakiyya', 'Semarang', '2018-08-15', 'Semarang', 'female', 'Istri Orang', 'Doktor', 2),
(14, 'Ezron', 'Miniman', '2018-11-08', 'Suaoro', 'male', 'Januck', 'SD', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_hubungi`
--

CREATE TABLE `tbl_hubungi` (
  `id_hubungi` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pesan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jadwal`
--

CREATE TABLE `tbl_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `bagian` varchar(255) DEFAULT NULL,
  `hari_pertama` int(11) DEFAULT NULL,
  `hari_terakhir` int(11) DEFAULT NULL,
  `jam_pertama` time DEFAULT NULL,
  `jam_terakhir` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id_jadwal`, `id_dokter`, `bagian`, `hari_pertama`, `hari_terakhir`, `jam_pertama`, `jam_terakhir`) VALUES
(5, 1, 'Kesehatan', 1, 7, '10:00:00', '20:20:00'),
(6, 2, 'Pernikanan', 1, 5, '06:00:00', '14:00:00'),
(7, 3, 'Lompat Tali', 3, 6, '03:00:00', '20:00:00'),
(8, 6, 'Adakah hari ini', 2, 5, '00:00:00', '20:00:00'),
(9, 12, 'Telinga dan Kesehatan', 1, 7, '00:00:00', '11:00:00'),
(10, 13, 'Hatiku', 2, 6, '12:00:00', '17:00:00'),
(11, 14, 'Keamaan', 1, 2, '12:00:00', '23:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jamkes`
--

CREATE TABLE `tbl_jamkes` (
  `id_jamkes` int(11) NOT NULL,
  `singkatan` varchar(255) NOT NULL,
  `nama_jamkes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jamkes`
--

INSERT INTO `tbl_jamkes` (`id_jamkes`, `singkatan`, `nama_jamkes`) VALUES
(1, 'BPJS', 'Badan Penyelenggara Jaminan Sosial'),
(2, 'Tidak ada', 'Tidak ada jaminan kesehatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_layanan`
--

CREATE TABLE `tbl_layanan` (
  `id_layanan` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `layanan_medis` varchar(255) DEFAULT NULL,
  `info_medis` varchar(255) DEFAULT NULL,
  `code_layanan` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_layanan`
--

INSERT INTO `tbl_layanan` (`id_layanan`, `nama`, `layanan_medis`, `info_medis`, `code_layanan`) VALUES
(1, 'Demam Berdarah', 'Penyembuhan Demam Berdarah', 'Dikarenakan Demam Berdarah Sangat Berbahaya Bagi Kesehatan Kita Semua, Dan Menyebabkan Kematian', 'DB'),
(2, 'THT', 'Mengobati Telinga Hidung Tenggorokan', 'Kita disini dapat mengobati berbagai penyakit Telinga Hidung dan Tenggorokan									', 'THT'),
(3, 'Sakit Perut', 'Sakit Perut Maag dan Sebagainya', 'Mengobati berbagai penyakit yang menyerang perut.', 'SP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pendaftaran`
--

CREATE TABLE `tbl_pendaftaran` (
  `id_daftar` int(11) NOT NULL,
  `id_antrian` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `umur` varchar(255) DEFAULT NULL,
  `berat_badan` varchar(255) DEFAULT NULL,
  `tanggal_besuk` varchar(255) DEFAULT NULL,
  `penyakit` varchar(255) DEFAULT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_jamkes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `akses` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `nama`, `akses`) VALUES
(1, 'adexe', '5e3cbd74208895175d545c310536b296', 'alifianadexe', 'Admin'),
(2, 'kimpoy', '5e3cbd74208895175d545c310536b296', 'Kimpoy Kuy', 'User'),
(3, 'zirly', 'bd44f4b9b0e83dfaf04131d2cae64ee0', 'Zirly Fiera Q', 'Pengurus'),
(5, 'obet', 'bd44f4b9b0e83dfaf04131d2cae64ee0', 'obet', 'Admin'),
(8, 'gaping', '5e6e97e133f716bfddc04ddf839b458e', 'gaping', 'Pengurus'),
(9, 'sule', '978c1f5418fda3c4893150cd2953de9e', 'sule', 'User'),
(10, 'njul', 'fbc97ef48ad7090866ad116c0e53d523', 'njul', 'Pegawai'),
(11, 'jeremia123', '39fe8d64083f2f0cd9a97a67613bbbc8', 'jeremia123', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_antrian`
--
ALTER TABLE `tbl_antrian`
  ADD PRIMARY KEY (`id_antrian`);

--
-- Indeks untuk tabel `tbl_dokter`
--
ALTER TABLE `tbl_dokter`
  ADD PRIMARY KEY (`id_dok`);

--
-- Indeks untuk tabel `tbl_hubungi`
--
ALTER TABLE `tbl_hubungi`
  ADD PRIMARY KEY (`id_hubungi`);

--
-- Indeks untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `tbl_jamkes`
--
ALTER TABLE `tbl_jamkes`
  ADD PRIMARY KEY (`id_jamkes`);

--
-- Indeks untuk tabel `tbl_layanan`
--
ALTER TABLE `tbl_layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indeks untuk tabel `tbl_pendaftaran`
--
ALTER TABLE `tbl_pendaftaran`
  ADD PRIMARY KEY (`id_daftar`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_antrian`
--
ALTER TABLE `tbl_antrian`
  MODIFY `id_antrian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_dokter`
--
ALTER TABLE `tbl_dokter`
  MODIFY `id_dok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tbl_hubungi`
--
ALTER TABLE `tbl_hubungi`
  MODIFY `id_hubungi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tbl_jamkes`
--
ALTER TABLE `tbl_jamkes`
  MODIFY `id_jamkes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_layanan`
--
ALTER TABLE `tbl_layanan`
  MODIFY `id_layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_pendaftaran`
--
ALTER TABLE `tbl_pendaftaran`
  MODIFY `id_daftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
