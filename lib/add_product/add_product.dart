import 'dart:io';

import 'package:add_all/add/model/product_model.dart';
import 'package:add_all/constants/app_size.dart';
import 'package:add_all/services/date_time_service.dart';
import 'package:add_all/services/image_picker_service.dart';
import 'package:add_all/services/loading_service.dart';
import 'package:add_all/services/storage_service.dart';
import 'package:add_all/services/store_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AddProductPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
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
            AppSize.height1,
            ///////////////////////////////////////////////////////////////////////
            ImageContainer(
              images: images,
              onPicked: (value) => images = value,
              delete: (xfile) => images.remove(xfile),
            ),
            AppSize.height1,
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
            AppSize.height1,
            CustomTextFireld(
              hintext: 'phoneNumber',
              controller: _phoneNumber,
            ),
            AppSize.height1,
            CustomTextFireld(
              hintext: 'userName',
              controller: _userName,
            ),
            AppSize.height1,
            CustomTextFireld(
              hintext: 'address',
              controller: _address,
            ),
            AppSize.height1,
            CustomTextFireld(
              hintext: 'price',
              controller: _price,
            ),
            AppSize.height1,
            ElevatedButton.icon(
              onPressed: () async {
                LoadingService().showLoading(context);
                final urls = await StorageService().uploadImage(images);
                final product = Product(
                  title: _title.text,
                  description: _description.text,
                  dateTime: _dateTime.text,
                  phoneNumber: _phoneNumber.text,
                  userName: _userName.text,
                  image: urls,
                  address: _address.text,
                );
                await StoreService().saveProduct(product);
                // ignore: use_build_context_synchronously
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.upload),
              label: const Text('Жүктөө'),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageContainer extends StatefulWidget {
  ImageContainer({
    super.key,
    required this.images,
    required this.delete,
    required this.onPicked,
  });
  ////////////////////////////////////////////////////////////
  List<XFile> images;
  final void Function(List<XFile> images) onPicked;
  final void Function(XFile) delete;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  ///////////////////////////////////////////////////////////////////
  final service = ImagePickerService();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(),
      ),
      child: widget.images.isNotEmpty
          //////////////////////////////////////////////////////////////////////////////////
          ? Stack(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: widget.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Images(
                      widget.images[index],
                      delete: (xfile) {
                        widget.images.remove(xfile);
                        widget.delete(xfile);
                        setState(() {});
                      },
                    );
                  },
                ),
                Positioned(
                  top: 260,
                  left: 250,
                  child: IconButton(
                    onPressed: () async {
                      //////////////////////////////////////////////////////////
                      final value = await service.pickImage();
                      if (value.isNotEmpty) {
                        widget.onPicked(value);
                        widget.images = value;
                        setState(() {});
                      }
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : IconButton(
              onPressed: () async {
                //////////////////////////////////////////////////////////
                final value = await service.pickImage();
                if (value.isNotEmpty) {
                  widget.onPicked(value);
                  widget.images = value;
                  setState(() {});
                }
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                size: 50,
              ),
            ),
    );
  }
}

class Images extends StatelessWidget {
  const Images(
    this.file, {
    super.key,
    required this.delete,
  });
  ///////////////////////////////////////////////////////////////////
  final XFile file;
  ///////////////////////////////////////////////////////////////////////
  final void Function(XFile) delete;

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////////////////////////////
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        //////////////////////////////////////////////////////////////////////////
        child: Stack(
          children: [
            /////////////////////////////////////////////////////////////////////////
            Image.file(
              File(file.path),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 105),
              child: IconButton(
                onPressed: () => delete(file),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
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
