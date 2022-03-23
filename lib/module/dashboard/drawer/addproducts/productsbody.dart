import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:srmhoteladmin/module/dashboard/drawer/addproducts/productsform.dart';

class ProductsBody extends StatefulWidget {
  const ProductsBody({Key? key}) : super(key: key);

  @override
  _ProductsBodyState createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  final GlobalKey<FormState> _formkeyvalue = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
      ),
      body: ProductsForm(),
      //   body: Form(
      //     key: _formkeyvalue,
      //     child: ListView(
      //       padding: EdgeInsets.symmetric(horizontal: 15),
      //       children: [
      //         StreamBuilder<QuerySnapshot>(
      //           stream: FirebaseFirestore.instance
      //               .collection("srm_cat_list")
      //               .snapshots(),
      //           builder: (BuildContext context,
      //               AsyncSnapshot<QuerySnapshot> snapshot) {
      //             if (snapshot.hasData) {
      //               if (snapshot.data!.docs.length == 0) {
      //                 return Text('No Records Found');
      //               } else {
      // List<DropdownMenuItem> currencyItems = [];
      // for (int i = 0; i < snapshot.data!.docs.length; i++) {
      // DocumentSnapshot snap = snapshot.data!.docs[i];
      // currencyItems.add(
      // DropdownMenuItem(
      // child: Text(
      // " snap.documentID",
      // style: TextStyle(color: Color(0xff11b719)),
      // ),
      // // value: "${snap.documentID}",
      // ),
      // );
      //               }
      //             } else {
      //               return Text('Error');
      //             }
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // body:StreamBuilder<QuerySnapshot>()
    );
  }
}
