import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseManager {
  ///add category
  final CollectionReference srmcatlist =
      FirebaseFirestore.instance.collection('srm_cat_list');

  Future<void> createcategorylist(
    String catname,
  ) async {

    return await srmcatlist.doc().set({
      // 'Cat_id': '1',
      'Cate_name': catname,
      'is_active': 'Y',
      'created_date': DateTime.now(),
      'created_by': 'Latha',
      'modified_by': null,
      'modified_date': null,
      'image_url': null,
    });
  }
  ///add-product
}
