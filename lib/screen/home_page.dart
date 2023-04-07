import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_name/component/list_all.dart';
import 'package:project_name/context/home_page_context.dart';

import 'package:project_name/model/personal_Info.dart';
import 'package:project_name/themes/themes_colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<PersonalInfo> lisInfoAll = [];
List<String> listProvince = [];
List<PersonalInfo> checkInfo = [];
List province = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลผู้ติดต่อ'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => HomePageContext(),
        child:
            Consumer<HomePageContext>(builder: (context, homePageContext, _) {
          // print(homePageContext.listProvince);
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Material(
                  child: tab(),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listProvince.length,
                          itemBuilder: (context, index) {
                            // final t = homePageContext.listProvince[index];
                            print(listProvince);
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/viewInfo',
                                  );
                                },
                                child: ListTile(
                                  visualDensity: VisualDensity.comfortable,
                                  tileColor: ThemeColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  style: ListTileStyle.drawer,
                                  title: Text(listProvince[index]),
                                  // leading: CircleAvatar(
                                  //   backgroundColor: ThemeColors.a,
                                  //   child: Text(
                                  //     infoAll[index]!.address,
                                  //   ),
                                  // ),
                                  // title: Row(
                                  //   children: [
                                  //     Text(infoAll.firstName),
                                  //     const SizedBox(
                                  //       width: 10,
                                  //     ),
                                  //     Text(infoAll.lastName),
                                  //   ],
                                  // ),
                                  // subtitle: Text(infoAll.phoneNumber),
                                  trailing: const Icon(
                                    Icons.delete,
                                    color: ThemeColors.a,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listProvince.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: ListTileTheme(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: ExpansionTile(
                                    title: Text(
                                      listProvince[index],
                                    ),
                                    // textColor: Colors.white,
                                    // collapsedBackgroundColor: Colors.white24,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                                children: lisInfoAll.map((e) {
                                              if (listProvince[index] ==
                                                  lisInfoAll[index].province) {
                                                var i = checkInfo.firstWhere(
                                                    (element) =>
                                                        element.email ==
                                                        lisInfoAll[index].email,
                                                    orElse: () => PersonalInfo(
                                                          province: '',
                                                          firstName: '',
                                                          lastName: '',
                                                          phoneNumber: '',
                                                          email: '',
                                                          address: '',
                                                          idNumber: '',
                                                        ));
                                                if (i.email != "") {
                                                  return Container(
                                                    child: Text(
                                                      i.firstName,
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  );
                                                } else {
                                                  checkInfo
                                                      .add(lisInfoAll[index]);
                                                }
                                                if (listProvince.length > 1) {
                                                  return SizedBox();
                                                } else {
                                                  return Container(
                                                    child: Text(
                                                      lisInfoAll[index]
                                                          .firstName,
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  );
                                                }
                                              } else {
                                                return SizedBox();
                                              }
                                            }).toList())

                                            //  ListView.builder(
                                            //   shrinkWrap: true,
                                            //   itemCount: lisInfoAll.length,
                                            //   itemBuilder: (context, index) {
                                            //     // print(lisInfoAll[index].province);
                                            //     print(listProvince[index] ==
                                            //         lisInfoAll[index].province);
                                            //     if (listProvince[index] ==
                                            //         lisInfoAll[index].province) {
                                            //       // print(
                                            //       //     "โชว์ข้อมูลทางซ้าย : ${listProvince[index]}");
                                            //       // print(
                                            //       //     "โชว์ข้อมูลทางขวา : ${jsonEncode(lisInfoAll[index].province)}");
                                            //       return Container(
                                            //         child: Text(
                                            //           lisInfoAll[index].firstName,
                                            //           style: TextStyle(
                                            //               color: Colors.red),
                                            //         ),
                                            //       );
                                            //     }
                                            //     //  else {
                                            //     //   return SizedBox();
                                            //     // }
                                            //   },
                                            // ),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.a,
        onPressed: () {
          Navigator.pushNamed(context, '/addInfo');
          setState(() {});
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  // TabBarView tabView(HomePageContext homePageContext) {
  //   return
  // }

  Container tab() {
    return Container(
      height: 45,
      color: ThemeColors.secondaryColor,
      child: const TabBar(
        labelColor: ThemeColors.a,
        unselectedLabelColor: ThemeColors.t,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 3,
              color: ThemeColors.a,
            ),
          ),
          color: ThemeColors.primaryColor,
        ),
        tabs: [
          Text("รายชื่อทั้งหมด"),
          Text("รายชื่อแยกตามแต่ละจังหวัด"),
        ],
      ),
    );
  }
}
