import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quizapp/ui/constant/constcolor.dart';

class EditAccount extends StatefulWidget {
  static const routeNamne = 'edit-account';
  EditAccount({Key key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  List<String> _countries = ['United Kingdom', 'Pakistan', 'Dubai'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: tintorange,
         title: Text(
           "ACCOUNT DETAIL",
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
                 Center(
                   child: Container(
                     padding: EdgeInsets.only(right: 20, bottom: 20),
                     child: Text(
                       "Username: John",
                       style: TextStyle(
                         color: titleColor,
                         fontSize: 24,
                       ),
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
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
                               child: DropdownButton<String>(
                                   hint: Text(
                                       'Please choose a location                  '),
                                   items: _countries
                                       .map<DropdownMenuItem<String>>((e) {
                                     return DropdownMenuItem<String>(
                                       child: Row(
                                         children: [
                                           new Text(e.toString()),
                                         ],
                                       ),
                                       value: e,
                                     );
                                   }).toList(),
                                   onChanged: (_) {}),
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
                                     bottom: 15.0,  top: 5),
                                 child: Container(
                                   height: 50,
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius:
                                     new BorderRadius.circular(10.0),
                                   ),
                                   child: Padding(
                                     padding: EdgeInsets.only(
                                       left: 15,
                                       right: 15,
                                     ),
                                     child: TextFormField(
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
                                       'Allow emails about oers and new Quizzes'),
                                   value: timeDilation != 1.0,
                                   onChanged: (bool value) {
                                     setState(() {
                                       timeDilation = value ? 2 : 1.0;
                                     });
                                   },
                                 ),
                                 CheckboxListTile(
                                   title: const Text(
                                       'Allow emails from our Atiates'),
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
                                       'Allow emails about oers and new Quizzes'),
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
                             Navigator.pop(context);
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
