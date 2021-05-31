import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/ApiClass/API.dart';
import 'package:quizapp/ui/Model/CountryList.dart';
import 'package:quizapp/ui/constant/constcolor.dart';
import 'package:quizapp/ui/Model/getuserModel.dart';
import 'package:quizapp/ui/pages/authenticationScreen.dart';


class EditAccount extends StatefulWidget {
  static const routeNamne = 'edit-account';
  EditAccount({Key key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "Pakistan"),
    ListItem(2, "India"),
    ListItem(3, "USA"),
    ListItem(4, "UK")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  int uid;
  @override
  void initState() {
    // TODO: implement initState
    uid = AuthenticationPage.prefs.getInt('userID');

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    super.initState();
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


  final EmailController = TextEditingController();
  final passwordController = TextEditingController();
  final marketingController = TextEditingController();
  final widgetController = TextEditingController();
  final nameController = TextEditingController();
  String name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
        appBar: AppBar(
          backgroundColor: tintorange,
         title: Text(
           "ACCOUNT DETAILS",
           style: TextStyle(
             color: Colors.white,
             //fontWeight: FontWeight.bold,
             fontSize: 18,
           ),
         ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  color: tintorange,
                  height: 50,
                ),
             Column(
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

                 FutureBuilder<GetUserModel>(
                     future: API.GetUser(uid),
                     builder: (context, snapshot) {
                       if (snapshot.hasData) {
                          name = snapshot.data.username;
                         return Container ( child:Column( children: [
                           Container(
                             padding: EdgeInsets.only(right: 20, bottom: 20),
                             child: Text(
                               "Username: " + snapshot.data.username,
                               style: TextStyle(
                                 color: titleColor,
                                 fontSize: 24,
                               ),
                               textAlign: TextAlign.left,
                             ),
                           ),
                         ],));
                       } else if (snapshot.hasError) {
                         return Text("${snapshot.error}");
                       }

                       // By default, show a loading spinner
                       return Container(
                         child: Text(
                           'name',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: 15,
                               fontWeight: FontWeight.bold),
                         ),
                       );
                     }),
                 Form(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(
                           height:
                           MediaQuery.of(context).size.height * 0.01),
                       Container(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding:
                                 const EdgeInsets.only(top: 8.0, left: 15),
                                 child: Text(
                                   "Name",
                                   style: TextStyle(
                                       fontSize: 18, color: titleColor),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(
                                     bottom: 15.0, left: 15, right: 15, top: 5),
                                 child: Container(
                                   height: 40,
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius:
                                     new BorderRadius.circular(10.0),
                                   ),
                                   child: Padding(
                                     padding: EdgeInsets.only(
                                     ),
                                     child: TextFormField(
                                       controller: nameController ,
                                       validator: (value) {
                                         if (value == null || value.isEmpty) {
                                           return 'Please enter some text';
                                         }
                                         return null;
                                       },
                                       decoration: InputDecoration(
                                         focusedBorder: OutlineInputBorder(
                                           // borderRadius: BorderRadius.circular(25.0),
                                           borderSide: BorderSide(
                                             color: tintorange,
                                           ),
                                         ),
                                         enabledBorder: OutlineInputBorder(

                                           borderSide: BorderSide(
                                             color: tintorange,

                                           ),
                                         ),
                                         hintText: "Lord Neilson",
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           )),
                       Container(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding:
                               const EdgeInsets.only(top: 8.0, left: 15),
                               child: Text(
                                 "Country",
                                 style: TextStyle(
                                     fontSize: 18, color: titleColor),
                               ),
                             ),
                             Center(
                               child: Container(
                                 padding: EdgeInsets.all(5.0),
                                 width: MediaQuery.of(context).size.width/1.2,
                                 child: DropdownButton<ListItem>(
                                   hint: Text('                                                               '),
                                     value: _selectedItem,
                                     items: _dropdownMenuItems,
                                     onChanged: (value) {
                                       setState(() {
                                         _selectedItem = value;
                                       });
                                     }),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding:
                                 const EdgeInsets.only(top: 20, left: 15),
                                 child: Text(
                                   "Email",
                                   style: TextStyle(
                                       fontSize: 16, color: titleColor),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(
                                     bottom: 15.0, left: 15, right: 15, top: 5),
                                 child: Container(
                                   height: 50,
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius:
                                     new BorderRadius.circular(10.0),
                                   ),
                                   child: TextFormField(

                                     controller: EmailController,
                                     validator: (value) {
                                       if (value == null || value.isEmpty) {
                                         return 'Please enter Email';
                                       }
                                       return null;
                                     },
                                     decoration: InputDecoration(
                                       focusedBorder: OutlineInputBorder(
                                         // borderRadius: BorderRadius.circular(25.0),
                                         borderSide: BorderSide(
                                           color: tintorange,
                                         ),
                                       ),
                                       enabledBorder: OutlineInputBorder(

                                         borderSide: BorderSide(
                                           color: tintorange,

                                         ),
                                       ),
                                       hintText: "testing@gmail.com",
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           )),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                             child: Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         "Marketing Preferences",
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 17,
                                         ),
                                       ),
                                       Text(
                                         "YES",
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 17,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 CheckboxListTile(
                                   title: const Text(
                                       'Allow emails about offers and new Quizzes'),
                                   value: timeDilation != 1.0,
                                   onChanged: (bool value) {
                                     setState(() {
                                       timeDilation = value ? 2 : 1.0;
                                     });
                                   },
                                 ),
                                 CheckboxListTile(
                                   title: const Text(
                                       'Allow emails from our Affiliates'),
                                   value: timeDilation != 1.0,
                                   onChanged: (bool value) {
                                     setState(() {
                                       timeDilation = value ? 2 : 1.0;
                                     });
                                   },
                                 ),
                               ],
                             )),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                             child: Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         "Show Widgets",
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 17,
                                         ),
                                       ),
                                       Text(
                                         "YES",
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 17,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                                 CheckboxListTile(
                                   title: const Text(
                                       'News Widget at Homepage'),
                                   value: timeDilation != 1.0,
                                   onChanged: (bool value) {
                                     setState(() {
                                       timeDilation = value ? 2 : 1.0;
                                     });
                                   },
                                 ),
                               ],
                             )),
                       )
                     ],
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.only(
                     bottom: 20,
                     left: 20,
                     right: 20,
                     top: 30,
                   ),
                   width: MediaQuery.of(context).size.width,
                   child: RaisedButton(
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10)),
                     color: Colors.lightBlue[100],
                     onPressed: () {},
                     child: Text(
                       "Privacy Policy and Data Protection",
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
                 Container(
                   child: Row(
                     children: [
                       Container(
                         padding: EdgeInsets.only(
                             left: 20,
                             right:10
                         ),
                         width: MediaQuery.of(context).size.width * 0.5,
                         child: RaisedButton(
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10)),
                           color: Colors.lightBlue[100],
                           onPressed: () {

                             API.EditUser(uid.toString(), name, EmailController.text, passwordController.text, nameController.text, _selectedItem.name, marketingController.text, widgetController.text).
                             then((value) {
                               if(value == '200' ){
                               Fluttertoast.showToast(
                                   msg: 'Success',
                                   toastLength: Toast.LENGTH_SHORT);
                             } else{
                               Fluttertoast.showToast(
                                   msg: 'Enter Valid Credential',
                                   toastLength: Toast.LENGTH_SHORT);
                             }
                             } );
                           },
                           child: Text(
                             "Save",
                             style: TextStyle(color: Colors.black),
                           ),
                         ),
                       ),
                       Container(
                         padding: EdgeInsets.only(
                           left: 10,
                           right: 20,
                         ),
                         width: MediaQuery.of(context).size.width * 0.5,
                         child: RaisedButton(
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(10)),
                           color: Colors.lightBlue[100],
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           child: Text(
                             "Cancel",
                             style: TextStyle(color: Colors.black),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 50),
               ],
             )
              ],
            ),
          ),
        ));
  }
}
