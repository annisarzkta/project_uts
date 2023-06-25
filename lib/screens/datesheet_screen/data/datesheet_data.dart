class DataSheet {
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  DataSheet(
      this.date, this.monthName, this.subjectName, this.dayName, this.time);
}

List<DataSheet> dateSheet = [
  DataSheet(4, 'JUNI', 'Rapat Besar HIMA', 'Sunday', '10:00'),
  DataSheet(14, 'JUNI', 'Reveal Desain Baru Jaket Prodi', 'Wesnesday', '15:00'),
  DataSheet(13, 'JUNI', 'Rapat Persiapan Workshop', 'Wednesday', '09:30'),
  DataSheet(24, 'JUNI', 'Workshop Fullstack', 'Saturday', '09:00'),
  DataSheet(2, 'JULI', 'Rapat Persiapan MAKRAB', 'Sunday', '10:00'),
  DataSheet(25, 'AGUSTUS', 'MAKRAB', 'Friday', '07:00'),
];
