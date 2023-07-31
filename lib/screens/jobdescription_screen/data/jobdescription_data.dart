class JobDescriptionData {
  final String subjectName;
  final String topicName1;
  final String topicName2;
  final String topicName3;

  JobDescriptionData(
      this.subjectName, this.topicName1, this.topicName2, this.topicName3);
}

List<JobDescriptionData> assignment = [
  JobDescriptionData(
      'Notulensi', 'Rapat Besar', 'Rapat Proker', 'Rapat BPH Kadiv'),
  JobDescriptionData(
      'Absensi', 'Absensi Rapat', 'Absensi Kegiatan', 'Absensi KAS'),
  JobDescriptionData(
      'Administrasi', 'Surat Masuk', 'Surat Keluar', 'Pendataan Mahasiswa'),
  JobDescriptionData('Proposal Kegiatan', 'Proposal', 'LPJ', 'RAB'),
];
