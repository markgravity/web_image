# Web Image
A control placeholder and error image for image provider.

## How to use
The WebImage can be used as an ImageProvider.

```dart
Image(
    image: WebImage(
      NetworkImage("url"),
      placeholder: AssetImage("placeholder_path"),
      error: AssetImage("error_path"),
    )
)
 ```