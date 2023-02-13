import 'package:get/get.dart';

class AssetUrlBuilder {
  AssetUrlBuilder({required this.path, this.width, this.height, this.imageOptimization = false});

  double? width;
  double? height;
  bool imageOptimization;

  String path;
  String baseUrl = 'https://res.cloudinary.com/grephyn/image/upload';

  String generateUrl() {
    final args = <String>[];
    String finalUrl = '';

    if (width != null && imageOptimization) {
      args.add('w_${width?.toStringAsFixed(0)}');
    }

    if (height != null && imageOptimization) {
      args.add('h_${height?.toStringAsFixed(0)}');
    }

    if (args.length.isGreaterThan(0) && imageOptimization) {
      args.add('c_fit');

      finalUrl = '$baseUrl/${args.join(',')}$path';
    } else {
      finalUrl = '$baseUrl$path';
    }

    return finalUrl;
  }
}
