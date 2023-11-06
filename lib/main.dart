import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){

    return _MyAppState();
  }
}

class _MyAppState  extends State<MyApp>{

  String _imagePath = "";
  final ImagePicker _picker = ImagePicker();
  Future<String> getImage(bool isCamera) async{
    final XFile? image;
    if(isCamera){
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    return image!.path;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Pick Demo"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("via Gallery"),
              IconButton(
                  onPressed: () async {
                    _imagePath = await getImage(false);
                    setState(() {

                    });
                  },
                  icon: Icon(Icons.insert_drive_file)),
              SizedBox(height: 30,),
              Text("via Camera"),
              IconButton(
                  onPressed: () async {
                    _imagePath = await getImage(true);
                    setState(() {

                    });
                  },
                  icon: Icon(Icons.camera_alt)),
              SizedBox(height: 30,),
              Text("Output"),
              _imagePath.isEmpty ? Container() : Image.file(File(_imagePath),height: 300, width: 300,),
            ],
          ),
        ),
      ),
    );
  }
}

