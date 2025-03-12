import 'package:azlistview/azlistview.dart';

class CountryList extends ISuspensionBean{
  final String title;
  final String tag;

  CountryList({required this.title, required this.tag});

  @override
  String getSuspensionTag() {
    // TODO: implement getSuspensionTag
    return tag;
  }
}