import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/features/admin/providers/admin_provider.dart';
import 'package:e_commerce_project/features/user/ui/widgets/profile_favorite.dart';
import 'package:e_commerce_project/features/user/ui/widgets/profile_myStore.dart';
import 'package:e_commerce_project/features/user/ui/widgets/profilehome.dart';
import 'package:e_commerce_project/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/style/theme2.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AdminProvider>(
        builder: (context, value, child) {
          value.currentUserId();
          User fireUser = value.currentUser;
          print("ttttttttttttt ${fireUser.uid}");
          value.getProductByUserId(fireUser.uid);
          UserModel myUserDetails = value.userById;

          if(fireUser == null || myUserDetails == null){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return DefaultTabController(
            length: 3,
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: style.Colors.secondColor,
                      expandedHeight: 400.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          background: Container(
                            height: 400,
                            // color: Colors.red,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 430,
                                  decoration: BoxDecoration(
                                      image: myUserDetails.imgCover == null
                                          ? DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/csh.jpg"),
                                              fit: BoxFit.cover)
                                          : DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  myUserDetails.imgCover),
                                              fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 430,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black87,
                                            Colors.black.withOpacity(0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          stops: [0, 1])),
                                ),
                                Positioned(
                                    top: 160,
                                    left: 80,
                                    child: Container(
                                      width: 250,
                                      child: Column(
                                        children: <Widget>[
                                          CircleAvatar(
                                              radius: 50,
                                              backgroundImage: myUserDetails
                                                          .imgCover ==
                                                      null
                                                  ? AssetImage(
                                                      "assets/images/csh.jpg")
                                                  : CachedNetworkImageProvider(
                                                      myUserDetails
                                                          .imgProfile)),
                                          myUserDetails == null
                                              ? Text("")
                                              : Text(
                                                  myUserDetails.name,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        style.Colors.titleColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                          myUserDetails == null
                                              ? Text("")
                                              : Text(
                                                  myUserDetails.email,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                          myUserDetails.pio == null
                                              ? Text("")
                                              : Text(
                                                  myUserDetails.pio,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          )),
                      bottom: TabBar(
                        controller: tabController,
                        labelColor: style.Colors.mainColor,
                        unselectedLabelColor: style.Colors.titleColor,
                        indicatorColor: style.Colors.mainColor,
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        tabs: [
                          new Tab(text: "Home"),
                          new Tab(text: "Favorite"),
                          new Tab(text: "My Store"),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(controller: tabController, children: [
                  ProfileHome(),
                  ProfileFavorite(),
                  ProfileMyStore()
                ])),
          );
          }
        },
      ),
    );
  }
}
