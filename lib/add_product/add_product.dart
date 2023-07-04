import 'package:add_all/constants/app_size.dart';
import 'package:add_all/services/date_time_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _dateTime = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _userName = TextEditingController();
  final _address = TextEditingController();
  final _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AddProductPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomTextFireld(
              hintext: 'title',
              controller: _title,
            ),
            AppSize.height1,
            CustomTextFireld(
              hintext: 'description',
              controller: _description,
              maxLines: 5,
            ),
            CustomTextFireld(
              hintext: 'dateTime',
              controller: _dateTime,
              focusNode: FocusNode(),
              prefixIcon: const Icon(Icons.calendar_month),
              onTap: () async {
                DateTimeService().showDateTimePicker(
                  context,
                  (value) =>
                      _dateTime.text = DateFormat('d MMMM y').format(value),
                );
              },
            ),
            CustomTextFireld(
              hintext: 'phoneNumber',
              controller: _phoneNumber,
            ),
            CustomTextFireld(
              hintext: 'userName',
              controller: _userName,
            ),
            CustomTextFireld(
              hintext: 'address',
              controller: _address,
            ),
            CustomTextFireld(
              hintext: 'price',
              controller: _price,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFireld extends StatelessWidget {
  const CustomTextFireld({
    super.key,
    required this.hintext,
    required this.controller,
    this.onTap,
    this.focusNode,
    this.maxLines,
    this.prefixIcon,
  });
  final String hintext;
  final TextEditingController controller;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final int? maxLines;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(),
        filled: true,
        hintText: hintext,
      ),
      controller: controller,
      onTap: onTap,
      focusNode: focusNode,
      maxLines: maxLines,
    );
  }
}
