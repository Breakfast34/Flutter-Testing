import 'package:flutter/material.dart';
import 'package:project_name/context/home_page_context.dart';
import 'package:project_name/model/personal_Info.dart';
import 'package:project_name/themes/themes_colors.dart';
import 'package:provider/provider.dart';

class ViewInfo extends StatefulWidget {
  ViewInfo({
    super.key,
  });

  @override
  State<ViewInfo> createState() => _ViewInfoState();
}


class _ViewInfoState extends State<ViewInfo> {
  // PersonalInfo infoAll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดข้อมูลแต่ละบุคคล'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => HomePageContext(),
        child:
            Consumer<HomePageContext>(builder: (context, homePageContext, _) {
          return Card(
            child: ListTile(
              title: Text(
                "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // subtitle: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       homePageContext.lisInfoAll[index].address,
              //       style: const TextStyle(
              //         fontSize: 16,
              //       ),
              //     ),
              //     Text(
              //       homePageContext.lisInfoAll[index].phoneNumber,
              //       style: const TextStyle(
              //         fontSize: 16,
              //       ),
              //     ),
              //     Text(
              //       homePageContext.lisInfoAll[index].phoneNumber,
              //       style: const TextStyle(
              //         fontSize: 16,
              //       ),
              //     ),
              //   ],
              // ),
              // trailing: IconButton(
              //   onPressed: () {
              //     homePageContext.lisInfoAll.removeAt(index);
              //     setState(() {});
              //   },
              //   icon: const Icon(
              //     Icons.delete,
              //     color: ThemeColors.a,
              //   ),
              // ),
            ),
          );
        }),
      ),
    );
  }
}
