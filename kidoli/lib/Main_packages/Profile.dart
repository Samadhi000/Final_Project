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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Kidoli',
          style: TextStyle(
            color: PrimaryColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.segment,
            color: PrimaryColor,
          ),
          onPressed: () {
            scaffoldkey.currentState!.openDrawer();
          },
        ),
      ),
      body: ListView(),
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
