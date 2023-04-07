import 'package:flutter/material.dart';
import 'package:project_name/screen/home_page.dart';
import 'package:project_name/themes/themes_colors.dart';

class ListAll extends StatelessWidget {
  const ListAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lisInfoAll.length,
      itemBuilder: (context, index) {
        final infoAll = lisInfoAll[index];
        // print(jsonEncode(infoAll));
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/viewInfo', arguments: infoAll);
            },
            child: ListTile(
              visualDensity: VisualDensity.comfortable,
              tileColor: ThemeColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              style: ListTileStyle.drawer,
              leading: CircleAvatar(
                backgroundColor: ThemeColors.a,
                child: Text(
                  infoAll.firstName[0],
                ),
              ),
              title: Row(
                children: [
                  Text(infoAll.firstName),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(infoAll.lastName),
                ],
              ),
              subtitle: Text(infoAll.phoneNumber),
              trailing: const Icon(
                Icons.delete,
                color: ThemeColors.a,
              ),
            ),
          ),
        );
      },
    );
  }
}
