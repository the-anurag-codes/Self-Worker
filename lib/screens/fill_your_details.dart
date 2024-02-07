import 'package:flutter/material.dart';
import 'package:self_worker/components/home_screen_components.dart';
import 'package:intl/intl.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class FillYourDetailsScreen extends StatefulWidget {
  const FillYourDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FillYourDetailsScreen> createState() => _FillYourDetailsScreenState();
}

class _FillYourDetailsScreenState extends State<FillYourDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _officeAddressController = TextEditingController();
  final TextEditingController _officePincodeController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late final String countryValue;
  late final String stateValue;
  late  final String cityValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Your Details"),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: animatedText("Fill Your Details", 40),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textColumn("NAME", "Enter Your Full Name", _nameController),
                  textColumn("CATEGORY", "Enter Category", _categoryController),
                  textColumn("EMAIL", "Enter Your Email", _emailController),
                  textColumn("PHONE", "Enter Phone Number", _phoneController),
                  textColumn("ADDRESS", "Enter Your Address", _addressController),
                  textColumn("STATE", "Enter Your State", _stateController),
                  textColumn("CITY", "Enter Your City", _cityController),
                  textColumn("PINCODE", "Enter Your Pincode", _pincodeController),
                  textColumn("OFFICE ADDRESS", "Enter Your Office Address", _officeAddressController),
                  textColumn("OFFICE PINCODE", "Enter Your Office Pincode", _officePincodeController),
                  SelectState(onCountryChanged: (country){}, onStateChanged: (state){

                  }, onCityChanged: (city){

                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 2),
                    child: Divider(
                      height: 4,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 2, bottom: 4),
                    child: Text(
                      "ADD EXPERIENCE",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  dateColumn(
                      "FROM DATE", "YYYY/MM/DD", _fromDateController, context),
                  dateColumn("TO DATE", "YYYY/MM/DD", _toDateController, context),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                    child: Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                  TextFormField(
                    maxLines: 4,
                    controller: _descriptionController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Description...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: elevatedButton(
                        "SUBMIT", Icons.arrow_forward_rounded, () {}),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget textColumn(
        String title, String hintText, TextEditingController controller) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ],
      ),
    );

Widget dateColumn(String title, String hintText,
        TextEditingController controller, BuildContext context) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.none,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100),
              );
              print(controller.text);

              if (pickedDate != null){
                controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
              }
            },
          ),
        ],
      ),
    );
