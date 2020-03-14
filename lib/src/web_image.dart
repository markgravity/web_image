import 'package:flutter/cupertino.dart';

class WebImage<T extends ImageProvider> implements ImageProvider<T> {
  WebImage(this.image, {this.placeholder, this.error});

  final T image;
  final ImageProvider placeholder;
  final ImageProvider error;

  ImageStream _stream;
  ImageConfiguration _configuration;

  @override
  Future<bool> evict(
      {ImageCache cache,
      ImageConfiguration configuration = ImageConfiguration.empty}) {
    return image.evict(cache: cache, configuration: configuration);
  }

  @override
  ImageStreamCompleter load(T key, decode) {
    return image.load(key, decode);
  }

  @override
  Future<T> obtainKey(ImageConfiguration configuration) {
    return image.obtainKey(configuration);
  }

  @override
  ImageStream resolve(ImageConfiguration configuration) {
    _configuration = configuration;
    final stream = image.resolve(configuration);

    // Stream is the same
    if (stream.key == _stream?.key) {
      return _stream;
    }

    // Set placeholder
    if (placeholder != null) {
      final listener = ImageStreamListener((imageInfo, _) async {
        // ignore: invalid_use_of_protected_member
        stream.completer.setImage(imageInfo);
      });
      placeholder.resolve(configuration).addListener(listener);
    }

    // Set error image
    if (error != null) {
      final listener = ImageStreamListener((_, __) {}, onError: (e, _) {
        if (error != null) {
          final listener = ImageStreamListener((imageInfo, _) async {
            // ignore: invalid_use_of_protected_member
            stream.completer.setImage(imageInfo);
          });

          error.resolve(_configuration).addListener(listener);
          return;
        }

        throw e;
      });
      stream.addListener(listener);
    }

    _stream = stream;
    return stream;
  }
}
