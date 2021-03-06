import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/CardValidation/Input_formatters.dart';
import 'package:quizapp/CardValidation/my_strings.dart';
import 'package:quizapp/CardValidation/payment_card.dart';
import 'package:quizapp/ui/Model/CountryList.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayWithCards extends StatefulWidget {
  static const routeName = 'pay-with-card';

  String crh;
  String price;

  PayWithCards({Key key, @required this.crh, this.price}) : super(key: key);

  @override
  _PayWithCardsState createState() => _PayWithCardsState();
}

class _PayWithCardsState extends State<PayWithCards> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidate = false;
  var _card = new PaymentCard();
  String dropdownValue = 'one';
  final cardnoController = TextEditingController();
  final dateController = TextEditingController();
  final cvcController = TextEditingController();
  final nameController = TextEditingController();

  List<String> _countries = ['United Kingdom', 'Pakistan', 'Dubai'];
  List<ListItem> _dropdownItems = [
    ListItem(1, "Pakistan"),
    ListItem(2, "India"),
    ListItem(3, "USA"),
    ListItem(4, "UK")
  ];
  int uid;
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    uid = AuthenticationPage.prefs.getInt('userID');
    print(uid);
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: tintorange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "PAY WITH CARD",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          // height: MediaQuery.of(context).size.height,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                color: tintorange,
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                    ),
                    // Container(
                    //     child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     // Padding(
                    //     //   padding: const EdgeInsets.only(top: 8.0, left: 15),
                    //     //   child: Text(
                    //     //     "Email",
                    //     //     style: TextStyle(fontSize: 16, color: titleColor),
                    //     //   ),
                    //     // ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(
                    //           bottom: 15.0, left: 15, right: 15, top: 5),
                    //       child: Container(
                    //         height: 50,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //           border: Border.all(color: tintorange),
                    //         ),
                    //         child: TextFormField(
                    //           decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             focusedBorder: InputBorder.none,
                    //             enabledBorder: InputBorder.none,
                    //             errorBorder: InputBorder.none,
                    //             disabledBorder: InputBorder.none,
                    //             hintText: "testing@gmail.com",
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15),
                            child: Text(
                              "CardInformation",
                              style: TextStyle(fontSize: 18, color: titleColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5.0, left: 15, right: 15, top: 5),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: tintorange),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                validator: CardUtils.validateCardNum,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  new LengthLimitingTextInputFormatter(19),
                                  new CardNumberInputFormatter()
                                ],
                                controller: numberController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  filled: true,
                                  hintText: "1234 1234 1234 1234",
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: _suffixIcon(),
                                  ),
                                  // labelText: 'Number',
                                ),
                                onSaved: (String value) {
                                  print('onSaved = $value');
                                  print(
                                      'Num controller has = ${numberController.text}');
                                  _paymentCard.number =
                                      CardUtils.getCleanedNumber(value);
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 15.0,
                                  left: 15,
                                ),
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      border: Border.all(color: tintorange)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 1,
                                    ),
                                    child: TextFormField(
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                        new LengthLimitingTextInputFormatter(4),
                                        new CardMonthInputFormatter()
                                      ],
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        filled: true,
                                        // icon: new Image.asset(
                                        //   'assets/images/calender.png',
                                        //   width: 40.0,
                                        //   color: Colors.grey[600],
                                        // ),
                                        hintText: 'MM/YY',
                                        //  labelText: 'Expiry Date',
                                      ),
                                      controller: dateController,
                                      validator: CardUtils.validateDate,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        List<int> expiryDate =
                                            CardUtils.getExpiryDate(value);
                                        _paymentCard.month = expiryDate[0];
                                        _paymentCard.year = expiryDate[1];
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 15.0,
                                  left: 5,
                                  right: 15,
                                ),
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: tintorange),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 1,
                                    ),
                                    child: TextFormField(
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter
                                            .digitsOnly,
                                        new LengthLimitingTextInputFormatter(4),
                                      ],
                                      decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        filled: true,
                                        // icon: new Image.asset(
                                        //   'assets/images/card_cvv.png',
                                        //   width: 40.0,
                                        //   color: Colors.grey[600],
                                        // ),
                                        suffixIcon:
                                            Icon(FontAwesomeIcons.ccMastercard),
                                        hintText: "CVC",
                                        //  labelText: 'CVV',
                                      ),
                                      validator: CardUtils.validateCVV,
                                      controller: cvcController,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        _paymentCard.cvv = int.parse(value);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15),
                          child: Text(
                            "  Name On Card",
                            style: TextStyle(fontSize: 18, color: titleColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15.0, left: 15, right: 15, top: 5),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              border: Border.all(color: tintorange),
                            ),
                            child: TextFormField(
                              onSaved: (String value) {
                                _card.name = value;
                              },
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              validator: (String value) =>
                                  value.isEmpty ? Strings.fieldReq : null,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Lord Neilson",
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(top: 8.0, left: 15),
                    //         child: Text(
                    //           "Country and PostalCode/ZIP",
                    //           style: TextStyle(fontSize: 18, color: titleColor),
                    //         ),
                    //       ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButton<ListItem>(
                            value: _selectedItem,
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                              });
                            }),
                      ),
                    ),
                    // child: DropdownButton<String>(
                    //     hint: Text(
                    //         'Please choose a location                  '),
                    //     items: _countries
                    //         .map<DropdownMenuItem<String>>((e) {
                    //       return DropdownMenuItem<String>(
                    //         child: Row(
                    //           children: [
                    //             new Text(e.toString()),
                    //           ],
                    //         ),
                    //         value: e,
                    //       );
                    //     }).toList(),
                    //     onChanged: (_value) {
                    //       setState(() {
                    //       dropdownValue = _value;
                    //       });
                    //
                    //     }),

                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             bottom: 15.0, left: 15, right: 15, top: 5),
                    //         child: Container(
                    //           height: 40,
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: new BorderRadius.circular(10.0),
                    //             border: Border.all(color: tintorange),
                    //           ),
                    //           child: Padding(
                    //             padding: EdgeInsets.only(
                    //
                    //             ),
                    //             child: TextFormField(
                    //               decoration: InputDecoration(
                    //                 border: InputBorder.none,
                    //                 focusedBorder: InputBorder.none,
                    //                 enabledBorder: InputBorder.none,
                    //                 errorBorder: InputBorder.none,
                    //                 disabledBorder: InputBorder.none,
                    //                 hintText: "  123 456",
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //     child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(top: 8.0, left: 15),
                    //       child: Text(
                    //         "Summary",
                    //         style: TextStyle(fontSize: 18, color: titleColor),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(
                    //           bottom: 15.0, left: 15, right: 15, top: 5),
                    //       child: Container(
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           border: Border.all(color: tintorange),
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //         ),
                    //         child: TextFormField(
                    //           readOnly: true,
                    //           decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             focusedBorder: InputBorder.none,
                    //             enabledBorder: InputBorder.none,
                    //             errorBorder: InputBorder.none,
                    //             disabledBorder: InputBorder.none,
                    //             hintText:
                    //                 "  2 Credits         +5               Total 7\$",
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _validateInputs();
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "Pay",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //   ],
                    // )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      API.addcreditt(
          context,
          uid.toString(),
          widget.crh,
          numberController.text,
          dateController.text,
          cvcController.text,
          nameController.text,
          _selectedItem.name,
          widget.price).then((value) {
            if(value == '201' ){
              Fluttertoast.showToast(
                  msg: 'Success',
                  toastLength: Toast.LENGTH_SHORT);
            } else{
              Fluttertoast.showToast(
                  msg: 'Enter Valid Credential',
                  toastLength: Toast.LENGTH_SHORT);
            }

      });

      form.save();
      // Encrypt and send send payment details to payment gateway

      // _showInSnackBar('Payment card is valid');
    }
  }

  void _showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }

  Widget _suffixIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.ccVisa,
        ),
      ],
    );
  }
}
