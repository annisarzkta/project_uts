import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);
  static const String routeName = 'TimelineScreen';

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  bool isLoading = true;
  final kegiatanController = TextEditingController();
  final hariController = TextEditingController();
  final tanggalController = TextEditingController();
  final jamController = TextEditingController();

  int _counter = 0;
  int total = 0;
  List<dynamic> dataJson = []; // Perubahan: Inisialisasi sebagai List<dynamic>

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(
        Uri.parse('http://localhost:1337/api/acaras'),
      );

      if (response.statusCode == 200) {
        setState(() {
          dataJson = jsonDecode(
              response.body)['data']; // Perubahan: Simpan data di dalam 'data'
          total = dataJson.length;
          // Perubahan: Jumlah data
          _counter++;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<void> addData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse('http://localhost:1337/api/acaras'),
      headers: headers,
      body: jsonEncode({
        'data': {
          'kegiatan': kegiatanController.text,
          'hari': hariController.text,
          'tanggal': tanggalController.text,
          'jam': jamController.text,
        }
      }),
    );

    if (response.statusCode == 200) {
      fetchData();
      kegiatanController.clear();
      hariController.clear();
      tanggalController.clear();
      jamController.clear();
    } else {
      throw Exception('Failed to add data');
    }
  }

  Future<void> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:1337/api/acaras/$id'),
    );

    if (response.statusCode == 200) {
      fetchData();
    } else {
      throw Exception('Failed to delete data');
    }
  }

  Future<void> updateData(String id) async {
    final response = await http.put(
      Uri.parse('http://localhost:1337/api/acaras/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'data': {
          'kegiatan': kegiatanController.text,
          'hari': hariController.text,
          'tanggal': tanggalController.text,
          'jam': jamController.text,
        }
      }),
    );

    if (response.statusCode == 200) {
      fetchData();
      kegiatanController.clear();
      hariController.clear();
      tanggalController.clear();
      jamController.clear();
    } else {
      throw Exception('Failed to update data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: kTopBorderRadius,
        ),
        child: ListView.builder(
          itemCount: total,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(
                left: kDefaultPadding / 2,
                right: kDefaultPadding / 2,
              ),
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                    child: const Divider(
                      thickness: 1.0,
                    ),
                  ),
                  //first need a row, then 3 columns
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //1st column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dataJson[index]['attributes']['tanggal']}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Text(
                            '${dataJson[index]['attributes']['jam']}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: kTextBlackColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ],
                      ),

                      //2nd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dataJson[index]['attributes']['kegiatan']}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Text(
                            '${dataJson[index]['attributes']['hari']}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      //3rd one
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              deleteData(dataJson[index]['id'].toString());
                            },
                            icon: const Icon(Icons.delete_outline_outlined),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Update Data'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: kegiatanController,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: kTextBlackColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                          decoration: const InputDecoration(
                                            labelText: 'Kegiatan',
                                          ),
                                          enabled: true,
                                        ),
                                        TextField(
                                          controller: hariController,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: kTextBlackColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                          decoration: const InputDecoration(
                                            labelText: 'Hari',
                                          ),
                                          enabled: true,
                                        ),
                                        TextField(
                                          controller: tanggalController,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: kTextBlackColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                          decoration: const InputDecoration(
                                            labelText: 'Tanggal (dd/mm/yyyy)',
                                          ),
                                          enabled: true,
                                        ),
                                        TextField(
                                          controller: jamController,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: kTextBlackColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                          decoration: const InputDecoration(
                                            labelText: 'Jam',
                                          ),
                                          enabled: true,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Update'),
                                        onPressed: () {
                                          updateData(
                                              dataJson[index]['id'].toString());
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                                Icons.drive_file_rename_outline_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                    child: const Divider(
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Data'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: kegiatanController,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: kTextBlackColor,
                            fontWeight: FontWeight.w900,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Kegiatan',
                      ),
                      enabled: true,
                    ),
                    TextField(
                      controller: hariController,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: kTextBlackColor,
                            fontWeight: FontWeight.w900,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Hari',
                        border: InputBorder.none,
                      ),
                      enabled: true,
                    ),
                    TextField(
                      controller: tanggalController,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: kTextBlackColor,
                            fontWeight: FontWeight.w900,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Tanggal (dd/mm/yyyy)',
                        border: InputBorder.none,
                      ),
                      enabled: true,
                    ),
                    TextField(
                      controller: jamController,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: kTextBlackColor,
                            fontWeight: FontWeight.w900,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Jam',
                        border: InputBorder.none,
                      ),
                      enabled: true,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      addData();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
