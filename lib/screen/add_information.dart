import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project_name/component/text_field_editor.dart';
import 'package:project_name/context/home_page_context.dart';
import 'package:project_name/model/personal_Info.dart';
import 'package:project_name/themes/themes_colors.dart';
import 'package:provider/provider.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

String? selectedValue;
int _index = 0;

List list = [
  'กรุงเทพมหานคร',
  'กระบี่',
  'กาญจนบุรี',
  'กาฬสินธุ์',
];

class _AddInformationState extends State<AddInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มรายชื่อ'),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => HomePageContext(),
          child:
              Consumer<HomePageContext>(builder: (context, homePageContext, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Stepper(
                    currentStep: _index,
                    onStepCancel: () {
                      if (_index > 0) {
                        setState(() {
                          _index -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (_index <= 0) {
                        setState(() {
                          _index += 1;
                        });
                      }
                    },
                    steps: <Step>[
                      Step(
                        title: const Text('เก็บข้อมูลส่วนตัว'),
                        content: Column(
                          children: [
                            TextFieldEditor(
                              controller: homePageContext.firstName,
                              labelText: 'ชื่อ',
                              suffixIcon: const Icon(Icons.person),
                              keyboardType: TextInputType.text,
                            ),
                            TextFieldEditor(
                              controller: homePageContext.lastName,
                              labelText: 'นามสกุล',
                              suffixIcon: const Icon(Icons.person),
                              keyboardType: TextInputType.text,
                            ),
                            TextFieldEditor(
                              controller: homePageContext.phoneNumber,
                              labelText: 'เบอร์โทรศัพท์',
                              suffixIcon: const Icon(Icons.phone),
                              keyboardType: TextInputType.phone,
                            ),
                            TextFieldEditor(
                              controller: homePageContext.email,
                              labelText: 'อีเมล',
                              suffixIcon: const Icon(Icons.email),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: const Text('เก็บข้อมูลที่อยู่ตามบัตรประชาชน'),
                        content: Column(
                          children: [
                            TextFieldEditor(
                              controller: homePageContext.idNumber,
                              labelText: 'เลขบัตรประชาชน',
                              suffixIcon: const Icon(Icons.credit_card),
                              keyboardType: TextInputType.number,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [
                                      Expanded(
                                        child: Text(
                                          'เลือกจังหวัด',
                                          style:
                                              TextStyle(color: ThemeColors.a),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: list.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColors.a),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList(),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 60,
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: ThemeColors.t),
                                      color: ThemeColors.primaryColor,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(Icons.location_city),
                                    iconSize: 20,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      padding: null,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: ThemeColors.secondaryColor,
                                      ),
                                      elevation: 8,
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness: MaterialStateProperty.all(6),
                                        thumbVisibility:
                                            MaterialStateProperty.all(true),
                                      )),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _index == 1
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: ThemeColors.t,
                            textStyle: const TextStyle(
                              color: ThemeColors.a,
                            ),
                          ),
                          onPressed: () {
                            // homePageContext.listProvince.add(selectedValue!);
                            homePageContext.provinces(selectedValue!);
                            homePageContext.increment(
                              homePageContext.firstNameController.text,
                              homePageContext.lastNameController.text,
                              homePageContext.phoneNumberController.text,
                              homePageContext.emailController.text,
                              homePageContext.addressController.text,
                              homePageContext.idNumberController.text,
                              selectedValue!,
                            );

                            Navigator.pushNamed(
                              context,
                              '/homePage',
                            );

                            setState(() {});
                            homePageContext.firstNameController.clear();
                            homePageContext.lastNameController.clear();
                            homePageContext.phoneNumberController.clear();
                            homePageContext.emailController.clear();
                            homePageContext.addressController.clear();
                            homePageContext.idNumberController.clear();

                            _index = 0;
                            // selectedValue = "";
                            // homePageContext.listItems.clear();
                          },
                          child: const Text('บันทึก'),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
