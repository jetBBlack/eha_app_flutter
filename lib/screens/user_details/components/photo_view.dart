import 'package:eha_app/models/helper.dart';
import 'package:eha_app/util/app_url.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoView extends StatelessWidget {
  final List<Photo> photos;
  const PhotoView({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoViewGallery.builder(
        itemCount: photos.length,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            
            imageProvider: NetworkImage(
              AppUrl.getImage + photos[index].fileName,
            ),
            initialScale: PhotoViewComputedScale.contained * 1,
            heroAttributes:
                PhotoViewHeroAttributes(tag: photos[index].fileName),
          );
        },
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            ),
          ),
        ),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
