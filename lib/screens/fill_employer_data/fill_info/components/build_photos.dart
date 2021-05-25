import 'dart:io';

import 'package:eha_app/components/info_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../size_config.dart';

class BuildPhotos extends StatefulWidget {
  @override
  _BuildPhotosState createState() => _BuildPhotosState();
}

class _BuildPhotosState extends State<BuildPhotos>
    with AutomaticKeepAliveClientMixin {
  List<File> _image = [];
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print("No Image Selected");
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print("No Image Selected");
      }
    });
  }

  void clearImage(index) {
    setState(() {
      _image.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            InfoTitle(
                icon: 'assets/icons/image-gallery.svg', title: 'PICTURES'),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  onSurface: Colors.grey,
                  textStyle: TextStyle(
                    fontSize: 25,
                  )),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 150,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    getImageFromCamera();
                                  },
                                  child: Text(
                                    "Upload from camera",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  getImageFromGallery();
                                },
                                child: Text(
                                  "Upload from gallery",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text('Upload Image'),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            _image.isEmpty
                ? Text('Upload your image here')
                : GridView.count(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(12),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: List.generate(
                      _image.length,
                      (index) {
                        return Stack(
                          children: [
                            Container(
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.grey[300]),
                              //   shape: BoxShape.rectangle,
                              // ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  _image[index],
                                ),
                              ),
                            ),
                            Positioned(
                              right: -5,
                              top: -10,
                              child: Container(
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/icons/Close.svg',
                                    height: 25,
                                    width: 25,
                                  ),
                                  color: Colors.red,
                                  onPressed: () {
                                    clearImage(index);
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
