import 'package:project/utilities/constants.dart' as Constants;

class Base64Image {
    int id;
    String base64str;

    Base64Image(this.base64str);
    Base64Image.withId(this.id, this.base64str);
  
    Base64Image.fromMap(Map<String, dynamic> map) {
      id = map[Constants.ID_COL];
      base64str = map[Constants.BASE64_COL];
    }

    Map<String, dynamic> toMap() {
      Map<String, dynamic> map = new Map();

      if (id != null) map[Constants.ID_COL] = id;

      map[Constants.BASE64_COL] = base64str;

      return map;
    }
}
