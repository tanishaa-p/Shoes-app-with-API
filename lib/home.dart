import 'package:flutter/material.dart';
import 'package:second_project/second_page.dart';
import 'package:second_project/user.dart';
import 'package:second_project/user_api.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) :super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
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
        Visibility(
          visible:isLoaded,
          replacement: Center(child: const CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: users?.length,
              itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.all(15),
                  child:
                  Row(
                    children: [
                      Container(
                        height: 115,
                        width:115,
                        child: Image.network(users![index].image),
                      ),
                      SizedBox(width:30,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, PageTransition(child:shoe1(
                                    name: users![index].name,
                                    image: users![index].image,
                                    price: users![index].price,
                                    description: users![index].description,
                                    brand: users![index].brand,
                                    countInStock: users![index].countInStock),
                                  duration: Duration(milliseconds: 400),
                                  reverseDuration: Duration(milliseconds: 400),
                                  type:PageTransitionType.rightToLeft,
                                ),
                                );
                              },
                              child:Container(
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  //border:Border.all(color:Colors.black)
                                ),
                                width:220,
                                height:115,
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(users![index].brand,
                                        style:TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:6),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(users![index].name,
                                        maxLines:1,
                                        overflow:TextOverflow.ellipsis,
                                        style:TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:6),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Left in stock:"+ users![index].countInStock.toString(),
                                        style:TextStyle(
                                          fontSize: 15,
                                          color:Colors.grey,
                                          //fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:6),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("MRP - INR"+users![index].price.toString(),
                                        style:TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
              );
              }),
        )
    );
  }
}
