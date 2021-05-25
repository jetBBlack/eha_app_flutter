import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eha_app/size_config.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:http_parser/http_parser.dart';

class BuildPictures extends StatefulWidget {
  @override
  _BuildPicturesState createState() => _BuildPicturesState();
}

class _BuildPicturesState extends State<BuildPictures>
    with AutomaticKeepAliveClientMixin {
  List<File> _image = [];
  final picker = ImagePicker();
  List<Asset> _assets = <Asset>[];
  String _error = 'No Error Dectected';

  Future<void> getImageFromGallery() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 100,
        //enableCamera: true,
        selectedAssets: _assets,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Select some photos",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      _assets = resultList;
      _error = error;
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

  List<String> imgPath = <String>[];
  Future uploadMultipleImage() async {
    List<MultipartFile> multipartImageList = [];
    if (_image != null) {
      for (Asset asset in _assets) {
        ByteData byteData = await asset.getByteData();
        List<int> imageData = byteData.buffer.asUint8List();
        MultipartFile multipartFile = new MultipartFile.fromBytes(
          imageData,
          filename: asset.name,
          contentType: MediaType("image", "jpg"),
        );
        multipartImageList.add(multipartFile);
      }

      FormData formData = new FormData.fromMap({
        "photos": multipartImageList,
      });

      Dio dio = new Dio();
      var response = await dio.post(AppUrl.uploadHelperImage, data: formData);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.data);
        for (var item in responseData) {
          final Map<String, dynamic> responseItem = item;
          imgPath.add(responseItem['fileName']);
        }
      }
    }
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
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/image-gallery.svg',
                  color: Colors.cyan,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  "PICTURES",
                  style: TextStyle(color: Colors.cyan, fontSize: 18),
                ),
              ],
            ),
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
            _assets.isEmpty
                ? Text('Upload your image here')
                : FutureBuilder(
                    future: uploadMultipleImage(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator();
                        default:
                          if (snapshot.hasError) {
                            return new Text('${snapshot.error}');
                          } else {
                            return buildGridView(context, snapshot);
                          }
                      }
                    }),
          ],
        ),
      ),
    );
  }

  GridView buildGridView(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.count(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(12),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: List.generate(
        _assets.length,
        (index) {
          Asset asset = _assets[index];
          return AssetThumb(
            asset: asset,
            width: 200,
            height: 200,
          );
          // return Stack(
          //   children: [
          //     Container(
          //       // decoration: BoxDecoration(
          //       //   border: Border.all(color: Colors.grey[300]),
          //       //   shape: BoxShape.rectangle,
          //       // ),
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(16),
          //         child: Image(
          //           fit: BoxFit.fill,
          //           image: AssetEntityImageProvider(
          //             _assets[index],
          //             isOriginal: false,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       right: -5,
          //       top: -10,
          //       child: Container(
          //         child: IconButton(
          //           icon: SvgPicture.asset(
          //             'assets/icons/Close.svg',
          //             height: 25,
          //             width: 25,
          //           ),
          //           color: Colors.red,
          //           onPressed: () {
          //             clearImage(index);
          //           },
          //         ),
          //       ),
          //     )
          //   ],
          // );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
