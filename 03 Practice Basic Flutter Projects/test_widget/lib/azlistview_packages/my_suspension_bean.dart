import 'package:azlistview/azlistview.dart';

class MySuspensionBean implements ISuspensionBean{
  @override
  bool isShowSuspension;
  final List<String> names;
  final String tag ;


  MySuspensionBean({required this.tag,required this.names ,this.isShowSuspension=false});

  @override
  String getSuspensionTag() {
    return tag;
  }

  @override
  String toString() {

    return 'Mysuspesionbean: {$isShowSuspension , $tag, $names}';
  }
}