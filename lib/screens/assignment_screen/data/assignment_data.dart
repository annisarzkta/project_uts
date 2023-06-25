class AssignmentData {
  final String subjectName;
  final String topicName1;
  final String topicName2;
  final String topicName3;

  AssignmentData(
      this.subjectName, this.topicName1, this.topicName2, this.topicName3);
}

List<AssignmentData> assignment = [
  AssignmentData('Notulensi', 'Rapat Besar', 'Rapat Proker', 'Rapat BPH Kadiv'),
  AssignmentData('Absensi', 'Absensi Rapat', 'Absensi Kegiatan', 'Absensi KAS'),
  AssignmentData(
      'Administrasi', 'Surat Masuk', 'Surat Keluar', 'Pendataan Mahasiswa'),
  AssignmentData('Proposal Kegiatan', 'Proposal', 'LPJ', 'RAB'),
];
