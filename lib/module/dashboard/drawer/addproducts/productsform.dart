import 'package:flutter/material.dart';
import 'package:srmhoteladmin/helper/constants/app_images.dart';
import 'package:srmhoteladmin/helper/util/custom_suffix_icon.dart';
import '../../../../config/app_colors.dart';
import '../../../../helper/util/form_error.dart';
import '../../../../helper/util/validate.dart';
import 'imgpicker.dart';
import '../../../../core_components/custom_widget/onedecimaltextformatter.dart';
import '../../../../core_components/custom_widget/round_button.dart';
import '../../../../helper/constants/app_string.dart';

enum prodType { veg, nv }

class ProductsForm extends StatefulWidget {
  const ProductsForm({Key? key}) : super(key: key);
  @override
  _ProductsFormState createState() => _ProductsFormState();
}

class _ProductsFormState extends State<ProductsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController product_name = TextEditingController();
  TextEditingController product_desc = TextEditingController();
  TextEditingController product_price = TextEditingController();

  late num prodprice;
  late String prodname;
  late String proddesc;
  prodType? _character = prodType.veg;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('category dropdown'),
                  SizedBox(
                    height: 8,
                  ),
                  buildProductNameFormField(),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 230),
                    child: Text(AppString.producttype),
                  ),
                  Row(
                    children: [
                      Radio<prodType>(
                        value: prodType.veg,
                        groupValue: _character,
                        onChanged: (prodType? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Text('Veg'),
                      SizedBox(width: 10,),
                      Radio<prodType>(
                        value: prodType.nv,
                        groupValue: _character,
                        onChanged: (prodType? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Text('Non-Veg'),
                    ],
                  ),
                  buildProductDescFormField(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: ImgPicker(),
                  ),
                  buildProductPriceFormField(),
                  SizedBox(
                    height: 10,
                  ),
                  FormError(errors: errors),
                  RoundButton(
                      text: AppString.addprodbutton,
                      onPress: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//product name
  TextFormField buildProductNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: product_name,
      onSaved: ((newValue) => prodname = newValue!),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(prodnameNullError)) {
          setState(() {
            errors.remove(prodnameNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(prodnameNullError)) {
          setState(() {
            errors.add(prodnameNullError);
          });
        }
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: AppString.productname,
        labelStyle: TextStyle(color: AppColors.labeltextcolor),
        hintText: AppString.productnamehinttext,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSuffixIcon(
        //   SvgIcon: AppIcons.error,
        // )
      ),
    );
  }

  //product price
  TextFormField buildProductPriceFormField() {
    return TextFormField(
      controller: product_price,
      onSaved: ((newValue) => prodprice = newValue! as num ),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(prodpriceNullError)) {
          setState(() {
            errors.remove(prodpriceNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(prodpriceNullError)) {
          setState(() {
            errors.add(prodpriceNullError);
          });
        }
      },
      inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: AppString.productPrice,
        labelStyle: TextStyle(color: AppColors.labeltextcolor),
        hintText: AppString.productpricehinttext,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  //product description
  TextFormField buildProductDescFormField() {
    return TextFormField(
      maxLines: 2,
      keyboardType: TextInputType.multiline,
      controller: product_desc,
      onSaved: ((newValue) => proddesc = newValue!),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(proddescNullError)) {
          setState(() {
            errors.remove(proddescNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(proddescNullError)) {
          setState(() {
            errors.add(proddescNullError);
          });
        }
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: AppString.productdesc,
        labelStyle: TextStyle(color: AppColors.labeltextcolor),
        hintText: AppString.productdeschinttext,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
