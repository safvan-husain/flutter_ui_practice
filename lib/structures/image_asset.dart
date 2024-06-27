// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageAssetC {
  String path;
  String name;

  ImageAssetC({
    required this.path,
    required this.name,
  });

  static List<ImageAssetC> fromLisOfList(List<List<String>> list) {
    List<ImageAssetC> result = [];
    for (var item in list) {
      result.add(ImageAssetC(path: item.first, name: item.last));
    }
    return result;
  }
}
