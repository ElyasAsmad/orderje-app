import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class OrderJeImage extends StatelessWidget {
  OrderJeImage(this.url, {super.key, this.height, this.width, this.fit});

  double? height;
  double? width;
  BoxFit? fit;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Stack(
            children: [
              SkeletonLoader(
                builder: Container(
                  width: width,
                  height: height,
                  color: Colors.white,
                ),
                period: const Duration(milliseconds: 750),
                highlightColor: Colors.grey.shade200,
                direction: SkeletonDirection.ltr,
              ),
              Container(
                alignment: Alignment.center,
                width: width,
                height: height,
                child: Text(
                  '${((loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!) * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(color: Colors.grey),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
