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
  File _singleImage;
  final picker = ImagePicker();
  List<Asset> _assets = <Asset>[];
  String error = 'No Error Dectected';
  bool _isUploading = false;
  bool _useCamera = false;

  Future<void> getImageFromGallery() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 100,
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
      error = error;
      _isUploading = true;
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _singleImage = File(pickedFile.path);
      } else {
        print('No image selected');
      }
      _isUploading = true;
    });
  }

  List<String> imgPath = <String>[];
  Future uploadMultipleImage() async {
    List<MultipartFile> multipartImageList = [];
    if (_assets != null) {
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
        final List<dynamic> responseData = response.data;
        for (var item in responseData) {
          Map<String, dynamic> responseItem = item;
          print(responseItem['fileName']);
          imgPath.add(responseItem['fileName'].toString());
        }
      }
    }
  }

  Future uploadImage() async {
    List<MultipartFile> multipartImageList = [];
    if (_singleImage != null) {
      MultipartFile multipartFile = await MultipartFile.fromFile(
          _singleImage.path,
          contentType: MediaType('image', 'jpg'));
      multipartImageList.add(multipartFile);
      FormData formData = new FormData.fromMap({
        "photos": multipartImageList,
      });

      Dio dio = new Dio();
      var response = await dio.post(AppUrl.uploadHelperImage, data: formData);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        for (var item in responseData) {
          Map<String, dynamic> responseItem = item;
          print(responseItem['fileName']);
          imgPath.add(responseItem['fileName'].toString());
        }
      }
    }
  }

  void removeImage(String value) {
    setState(() {
      imgPath.remove(value);
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
                                    setState(() {
                                      _useCamera = true;
                                    });
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
                                  setState(() {
                                    _useCamera = false;
                                  });
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
            _isUploading == false
                ? Text('Upload your image here')
                : FutureBuilder(
                    future: _useCamera == true
                        ? uploadImage()
                        : uploadMultipleImage(),
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
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
        imgPath.length,
        (index) {
          String path = imgPath[index];
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(AppUrl.getImage + path),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/Close.svg',
                      height: 22,
                      width: 22,
                    ),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}