import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:teknopath/admin/view_building.dart';
import 'dart:io';
import 'dart:convert';

class AddBuilding extends StatefulWidget {
  const AddBuilding({super.key});

  @override
  State<AddBuilding> createState() => _AddBuildingState();
}

class _AddBuildingState extends State<AddBuilding> {
  TextEditingController buildingName = TextEditingController();
  TextEditingController description = TextEditingController();

  File? imagepath;
  String? imagename;
  String? imagedata;

  ImagePicker imagePicker = ImagePicker();

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagepath = File(getimage!.path);
      imagename = getimage.path.split('/').last;
      imagedata = base64Encode(imagepath!.readAsBytesSync());
      print(imagepath);
      print(imagename);
      print(imagedata);
    });
  }

  Future<void> uploadImage() async {
    try {
      String uri = "https://teknopath.000webhostapp.com/addbuilding.php";
      var res = await http.post(Uri.parse(uri), body: {
        "building_name": buildingName.text,
        "description": description.text,
        "data": imagedata,
        "name": imagename,
      });
      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("uploaded");
        setState(() {
          buildingName.clear();
          description.clear();
          imagepath = null;
        });
      } else {
        print("some issue");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Building",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 285,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: imagepath != null
                      ? Image.file(
                          imagepath!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Please choose an image",
                                textAlign: TextAlign.center,
                              ),
                              IconButton(
                                onPressed: () {
                                  getImage();
                                },
                                icon: Icon(Icons.add_photo_alternate_rounded),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: buildingName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      label: Text("Enter Building Name"),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text("Enter Desciption"),
                    labelStyle: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      uploadImage();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text("Upload"),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => ViewBuilding());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text("View Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
