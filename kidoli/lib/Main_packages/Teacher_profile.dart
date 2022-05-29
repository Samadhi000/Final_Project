import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Constant/Constant_var.dart';
import '../models/video_model.dart';

var scaffoldkey = GlobalKey<ScaffoldState>();

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _fileBytes;
  String _fileName = "";
  late PlatformFile _file;

  /*String? _fileName;*/
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  Future<void> _selectFolder() async {
/*      setState(() => _directoryPath = value);
    });*/
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mkv', 'webm'],
    );

    //File file = File(result.files.single.path.toString());

    if (result != null) {
      _fileBytes = result.files.first.bytes;
      _fileName = result.files.first.name;

      _file = result.files.first;

      print(_file.path); // just check

      // Upload file to storage
      //var upload = await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
      final uploadTask = await FirebaseStorage.instance
          .ref('uploads/$_fileName')
          .putData(_fileBytes!);
      final downloadUrl =
          FirebaseStorage.instance.ref('uploads/$_fileName').getDownloadURL();

      //ADD FIRESTORE TOO
      postDetailsToFirestore(_fileName, downloadUrl.toString());
    } else {
      // User canceled the picker
      print('User Cancelled the Picker');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.5,
              width: size.width * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                      image: AssetImage('assets/bg.jpg'))),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          minRadius: 35,
                          maxRadius: 40,
                          backgroundImage: NetworkImage(
                              'https://pyxis.nymag.com/v1/imgs/0a9/3ea/811e16052cee8cf607ec2728204db8863d-robert-pattinson.rsquare.w330.jpg'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Robert Pattinson',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'BSc in Education',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'English Teacher',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset('assets/user.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset('assets/certificate.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Edit Qualification",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Profile()),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 8,
                                  color: purple,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10, left: 10),
                                        child: Image.asset('assets/upload.png',
                                            height: 100),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Upload Videos",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset('assets/book.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Upload Books",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset('assets/gear.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Settings",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                        crossAxisCount: 2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _selectFolder(),
        label: const Text('Upload Video'),

        // label:   (_fileName == '') ? Text('Upload Video'): Text(_fileName + 'is ready to upload'),
        //label:  Text('upload'),
        icon: const Icon(Icons.video_call),
      ),
    );
  }
}

postDetailsToFirestore(String? fileName, String? downloadUrl) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  videoModel videomodel = videoModel();

  videomodel.fileName = fileName;
  videomodel.downloadUrl = downloadUrl;

  //Replace with your own collection name
  await firebaseFirestore
      .collection("Videos")
      .doc(user!.uid)
      .set(videomodel.toMap());
  Fluttertoast.showToast(msg: "Video Uploaded Successfully");
}
