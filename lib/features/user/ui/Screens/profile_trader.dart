import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/Provider/e_c_provider.dart';
import 'package:e_commerce_project/features/user/ui/Screens/profile_user_Home.dart';
import 'package:e_commerce_project/features/user/ui/Screens/profile_user_about.dart';
import 'package:e_commerce_project/features/user/ui/Screens/profile_user_photo.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'dart:math' as math;

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileTrader extends StatefulWidget {
  UserModel myStore;
  ProfileTrader(this.myStore);
  

  @override
  _ProfileTraderState createState() => _ProfileTraderState();
}

class _ProfileTraderState extends State<ProfileTrader>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  String follow = 'Follow';


  int num = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 620,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Container(
                            height: ScreenUtil().setHeight(350),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      blurRadius: 20, offset: Offset(1, 5))
                                ],
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        widget.myStore.imgCover),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: ScreenUtil().setHeight(350),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black87,
                                      Colors.black87.withOpacity(0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0, 5])),
                          ),
                          Positioned(
                            left: 30,
                            bottom: -40,
                            child: Transform.rotate(
                              angle: -math.pi / 30,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color:
                                        style.Colors.mainColor.withOpacity(.6),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.grey,
                                          offset: Offset(1, 10))
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            bottom: -40,
                            child: Transform.rotate(
                              angle: math.pi / 20,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: style.Colors.secondColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            widget.myStore.imgProfile),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              bottom: -20,
                              child: InkWell(
                                onTap: (){
                                  showCupertinoModalPopup(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoActionSheet(
                                              title:
                                                  const Text('Choose Options'),
                                              message: const Text(
                                                  'Please select the best dessert frome the options below'),
                                              actions: <Widget>[
                                                CupertinoActionSheetAction(
                                                  child: const Text('Edit Profile Image' , style: TextStyle(
                                                    fontSize: 15,
                                                    color: style.Colors.mainColor
                                                  ), ),
                                                  onPressed: ()async {
                                                     PickedFile imageFile= await
                                                    ImagePicker().getImage(source: ImageSource.gallery);
                                                    File file = File(imageFile.path);
                                                   await Provider.of<ECProvider>(context ,listen: false).uploadImageProfile(file, 'userProfile');
                                                    String imUrl = Provider.of<ECProvider>(context,listen: false).imgProfile;
                                                    
                                                    await Provider.of<ECProvider>(context ,listen: false).updateData(widget.myStore.id, 'imgProfile', imUrl);
                                                    
                                                    
                                                  },
                                                ),
                                                CupertinoActionSheetAction(
                                                  child: const Text('Edit Cover Image', style: TextStyle(
                                                    fontSize: 15,
                                                    color: style.Colors.mainColor
                                                  ), ),
                                                  onPressed: () async{
                                                    PickedFile imageFile= await
                                                    ImagePicker().getImage(source: ImageSource.gallery);
                                                    File file = File(imageFile.path);
                                                   await Provider.of<ECProvider>(context ,listen: false).uploadImageCover(file, 'userCover');
                                                    String imUrl = Provider.of<ECProvider>(context,listen: false).imgCover;
                                                    print(imUrl);
                                                    await Provider.of<ECProvider>(context ,listen: false).updateData(widget.myStore.id, 'imgCover', imUrl);
                                                    
                                                  },
                                                ),
                                                 
                                                

                                              ],
                                              cancelButton: CupertinoActionSheetAction(
                                                isDefaultAction: true,
                                                onPressed: (){
                                                  Navigator.pop(context, 'Cancel');
                                                },
                                                 child: const Text('Cancel', style: TextStyle(
                                                    fontSize: 16,
                                                    color: style.Colors.secondColor
                                                  ), ),),
                                              );
                                              
                                        },
                                      );
                                },
                                  child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: style.Colors.mainColor,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.edit , color: Colors.white,)
                                ),
                              )),
                          Positioned(
                              bottom: 10,
                              left: 170,
                              child: Container(
                                width: ScreenUtil().setWidth(230),
                                height: ScreenUtil().setHeight(80),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            widget.myStore.name,
                                            style: TextStyle(
                                                color: style.Colors.titleColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 0,
                                            child: Icon(
                                              Icons.check,
                                              color: style.Colors.titleColor,
                                            ))
                                      ],
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            widget.myStore.address,
                                            style: TextStyle(
                                                color: style.Colors.titleColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 170, top: 5, right: 70),
                        width: 150,
                        height: 40,
                        color: style.Colors.secondColor,
                        child:widget.myStore.isAdmin == false ?
                         FlatButton(
                            onPressed: () {
                              if (num == 0) {
                                follow = 'UnFollow';
                                num = 1;
                              } else {
                                follow = 'Follow';
                                num = 0;
                              }
                              setState(() {});
                            },
                            child: Text(
                              follow,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ))
                            :
                            FlatButton(
                            onPressed: () {
                              
                            },
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ))
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 200,
                        child: Card(
                            child: Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, top: 20, right: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "About Me",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, top: 10, right: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.myStore.pio,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              height: 60,
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Following",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        "700",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        "4K",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Posts",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        "300",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 800,
                child: Scaffold(
                  appBar: PreferredSize(
                      child: AppBar(
                        elevation: 0,
                        backgroundColor: style.Colors.titleColor,
                        bottom: TabBar(
                            controller: tabController,
                            indicatorColor: style.Colors.mainColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 3.0,
                            unselectedLabelColor: Colors.black87,
                            labelColor: style.Colors.mainColor,
                            isScrollable: true,
                            tabs: [
                              Container(
                                padding: EdgeInsets.only(bottom: 15, top: 10),
                                child: Text(
                                  "home".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 15, top: 10),
                                child: Text(
                                  "Photo".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 15, top: 10),
                                child: Text(
                                  "Video".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 15, top: 10),
                                child: Text(
                                  "About".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ),
                      preferredSize: Size.fromHeight(50)),
                  body: TabBarView(controller: tabController, children: [
                    ProfileUserHome(),
                    ProfileUserPhoto(),
                    ProfileUserPhoto(),
                    ProfileUserAbout(
                        widget.myStore.latitude, widget.myStore.longitude),
                  ]),
                ),
              ),
            ])),
          ],
        ));
  }
}
