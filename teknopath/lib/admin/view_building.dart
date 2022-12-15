import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:teknopath/constants/colors.dart';

class ViewBuilding extends StatefulWidget {
  const ViewBuilding({super.key});

  @override
  State<ViewBuilding> createState() => _ViewBuildingState();
}

class _ViewBuildingState extends State<ViewBuilding> {
  List record = [];

  Future<void> imageformdb() async {
    try {
      String uri = "https://teknopath.000webhostapp.com/viewbuilding.php";
      var response = await http.post(Uri.parse(uri), body: {});
      setState(() {
        record = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    imageformdb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Buildings"),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: record.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: tSecondaryColor,
                  ),
                  title: Text(
                    record[index]["building_name"],
                    style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[900]),
                  ),
                ),
                SizedBox(
                  width: 320,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://teknopath.000webhostapp.com/" +
                                record[index]["image_path"]),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  // child: Container(
                  //   child: Image.network(
                  //     "http://192.168.254.114/php/" +
                  //         record[index]["image_path"],
                  //   ),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    record[index]["description"],
                    style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[900]),
                  ),
                ),

                // Container(
                //   child: Expanded(
                //     child: Image.network(
                //       "http://192.168.254.114/php/" +
                //           record[index]["image_path"],
                //       fit: BoxFit.fitWidth,
                //     ),
                //   ),
                // ),
                // Container(
                //   child: Column(
                //     children: [
                //       Text("Building Name"),
                //       Text(record[index]["building_name"]),
                //     ],
                //   ),
                // ),
                // Container(
                //   child: Column(
                //     children: [
                //       Text("Description"),
                //       Text(record[index]["description"]),
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
