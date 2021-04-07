import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/ui/constant/constcolor.dart';

class PayWithCards extends StatefulWidget {
  static const routeName = 'pay-with-card';
  PayWithCards({Key key}) : super(key: key);

  @override
  _PayWithCardsState createState() => _PayWithCardsState();
}

class _PayWithCardsState extends State<PayWithCards> {
  List<String> _countries = ['United Kingdom', 'Pakistan', 'Dubai'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15),
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 16, color: titleColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15.0, left: 15, right: 15, top: 5),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
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
                      ],
                    )),
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
                                bottom: 5.0,  top: 5),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 1,
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
                                    hintText: "1234 1234 1234 1234",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: _suffixIcon(),
                                    ),
                                  ),
                                ),
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
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 1,
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
                                        hintText: "MM/YY",
                                      ),
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
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 1,
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
                                        suffixIcon:
                                            Icon(FontAwesomeIcons.ccMastercard),
                                        hintText: "CVC",
                                      ),
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
                            "Name On Card",
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
                      ],
                    )),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15),
                            child: Text(
                              "Country and PostalCode/ZIP",
                              style: TextStyle(fontSize: 18, color: titleColor),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 15.0, left: 15, right: 15, top: 5),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
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
                                    hintText: "123 456",
                                  ),
                                ),
                              ),
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
                          padding: const EdgeInsets.only(top: 8.0, left: 15),
                          child: Text(
                            "Summary",
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
                            ),
                            child: TextFormField(
                              readOnly: true,
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
                                hintText:
                                    "2 Credits         +5               Total 7\$",
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _suffixIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.paypal,
        ),
        Icon(
          FontAwesomeIcons.ccVisa,
        ),
      ],
    );
  }
}
