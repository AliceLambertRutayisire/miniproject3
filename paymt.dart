import 'package:flutter/material.dart';
import 'package:project/verified.dart';

class CheckOrder extends StatefulWidget {
  @override
  _CheckOrderState createState() => _CheckOrderState();
}

class _CheckOrderState extends State<CheckOrder> {
  @override
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(
              fontFamily: 'Barlow Semi Condensed',
              color: Color.fromRGBO(50, 41, 57, 1),
              fontWeight: FontWeight.w900,
              fontSize: 32),
        ),
        backgroundColor: Color.fromRGBO(201, 199, 126, 1),
      ),
      backgroundColor: Color.fromRGBO(201, 199, 126, 1),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CheckModel.dummyData.length,
              itemBuilder: (context, index) {
                CheckModel _model = CheckModel.dummyData[index];
                color:
                _selectedIndex != null && _selectedIndex == index
                    ? Color.fromRGBO(217, 217, 217, 1)
                    : Color.fromRGBO(187, 144, 45, 1);

                return SizedBox(
                  height: 100,
                  //width: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Divider(
                        height: 15,
                        //thickness: 3,
                      ),
                      SizedBox(
                        width: 850,
                        height: 70,
                        child: ListTile(
                          tileColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // leading: CircleAvatar(
                          //     backgroundImage: AssetImage(
                          //       _model.avatar,
                          //     ),
                          //     radius: 25),
                          title: Text(
                            _model.name,
                            style: TextStyle(
                                color: Color.fromRGBO(50, 41, 57, 1),
                                fontSize: 16),
                            selectionColor: Color.fromRGBO(217, 217, 217, 1),
                          ),

                          subtitle: Text(
                            _model.details,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(50, 41, 57, 1)),
                          ),
                          trailing: Image.asset(_model.avatar),
                          onTap: () => _onSelected(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(187, 144, 45, 1)),
                  onPressed: () {
                    // Route route =
                    //     MaterialPageRoute(builder: (context) => MinionFlare());
                    // Navigator.push(context, route);
                  },
                  child: SizedBox(
                    width: 100,
                    child: Text("Cancel Order"),
                  ),
                ),
              ),
              // Spacer(
              //   flex: 1,
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(50, 41, 57, 1)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifiedOrder()));
                  },
                  child: SizedBox(width: 100, child: Text("Confirm Order")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckModel {
  final String avatar;
  final String name;
  final String details;

  CheckModel({required this.avatar, required this.name, required this.details});

  static final List<CheckModel> dummyData = [
    CheckModel(
        avatar: "assets/images/edit.png",
        name: "Order details",
        details: "Order #24, 3 Dishes, 16000 RWF        "),
    CheckModel(
        avatar: "assets/images/edit.png",
        name: "Payment details",
        details: "0798641032, Timmy Timicus"),
    CheckModel(
        avatar: "assets/images/edit.png",
        name: "Discount Coupon",
        details: 'Code: THANKYOUFORUSINGFOODEASE, 10% off for new users')
  ];
}
