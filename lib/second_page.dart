import 'package:flutter/material.dart';
import 'package:second_project/user.dart';
import 'package:second_project/user_api.dart';

class shoe1 extends StatefulWidget{
  shoe1(
  {
    required this.name,
  required this.image,
  required this.price,
  required this.description,
  required this.brand,
  required this.countInStock,
});
  String name;
  String image;
  int price;
  String description;
  String brand;
  int countInStock;

  @override
  State<shoe1> createState()=> _shoe1State();
}

class _shoe1State extends State<shoe1>{
  List<User>? users;
  var isLoaded=false;

  @override
  void initState(){
    super.initState();
    getData();
  }

  getData() async{
    users= await UserApi().fetchUsers();
    if(users!=Null){
      setState(() {
        isLoaded=true;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: Color(0xFF5451FF),
        title:

        Row(
          children: [
            Image.asset('assets/logo.png',height:50),
            SizedBox(width:5),
            Text("SNEAKERHEADS"),
          ],
        ),
        titleTextStyle: TextStyle(
          fontSize: 24.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      body:
        Center(
          child:
          Column(
            children: [
              SizedBox(height: 35,),
              Container(
                decoration: BoxDecoration(
                  //border: Border.all(color:Colors.black)
                ),
                  width:MediaQuery.of(context).size.width*0.7,
                  child: Image.network(widget.image,),
              ),
              Divider(height:30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.brand,
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height:6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.name,
                        maxLines:1,
                        overflow:TextOverflow.ellipsis,
                        style:TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height:6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Left in stock:"+ widget.countInStock.toString(),
                        style:TextStyle(
                          fontSize: 18,
                          color:Colors.grey,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height:6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("MRP - INR"+widget.price.toString(),
                        style:TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Divider(height:40,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.description,
                        style:TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0,20,0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){},
                        child: Text(
                          "Buy Now",
                          style:TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style:ElevatedButton.styleFrom(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            fixedSize: Size(MediaQuery.of(context).size.width*.42,50),
                            primary:Color(0xFF5451FF),
                        ),
                    ),
                    SizedBox(width:20),
                    ElevatedButton(onPressed: (){},
                        child: Text(
                          "Add to Cart",
                          style:TextStyle(
                            color:Color(0xFF5451FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      style:ElevatedButton.styleFrom(
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        side:BorderSide(
                          color: Color(0xFF5451FF),
                        ),
                        fixedSize: Size(MediaQuery.of(context).size.width*.42,50),
                        primary:Colors.white
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}