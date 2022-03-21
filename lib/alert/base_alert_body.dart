import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_dummy/alert/alert_helper.dart';

///Alert харуулах үндсэн харагдац
class BaseAlertBody extends StatefulWidget {
  final String? title;
  final String? message;
  final Function()? onPositiveClicked;
  final Function()? onNegativeClicked;
  final Widget? image;
  final String? positiveText;
  final String? negativeText;
  final Widget? child;
  final bool replaceWholeWidget;
  final dynamic response;
  final bool isScrollable;
  final AlertType type;

  const BaseAlertBody({
    Key? key,
    this.title,
    this.message,
    this.onPositiveClicked,
    this.onNegativeClicked,
    this.image,
    this.positiveText,
    this.negativeText,
    this.child,
    this.replaceWholeWidget = false,
    this.response,
    this.type = AlertType.dialog,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  _BaseAlertBodyState createState() => _BaseAlertBodyState();
}

class _BaseAlertBodyState extends State<BaseAlertBody> {
  String? _titleText;
  String? _messageText;

  @override
  void initState() {
    _titleText = widget.title;
    _messageText = widget.message;
    if (widget.response != null) {
      //TODO
      //Хэрвээ сервис дуудаад тухайн сервис алдаатай ирсэн бол
      //энд [_titleText] болон [_messageText] -д [widget.response]-с утга олгоно
      //Жишээ нь : _titleText = 'Алдаа гарлаа'; _messageText = widget.response.data['error_mn'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: Get.size.height - Get.mediaQuery.padding.top,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.isScrollable
                    ?

                    ///Үндсэн харагдац өрөх
                    Expanded(
                        child: SingleChildScrollView(
                          child: _alertBodyBuilder(),
                        ),
                      )
                    : _alertBodyBuilder(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///Alert-ийн үндсэн харагдац өрөх функц
  Widget _alertBodyBuilder() {
    return widget.replaceWholeWidget && widget.child != null ? widget.child! : _alertMainBody();
  }

  ///Alert-ийн үндсэн харагдац
  Widget _alertMainBody() {
    Color? _backGroundColor = Get.theme.dialogTheme.backgroundColor;
    BorderRadius _borderRadius = BorderRadius.circular(12);
    EdgeInsets _margin = const EdgeInsets.symmetric(horizontal: 24);
    switch (widget.type) {
      case AlertType.dialog:
        _backGroundColor = Get.theme.dialogTheme.backgroundColor;
        _borderRadius = BorderRadius.circular(12);
        _margin = const EdgeInsets.symmetric(horizontal: 24);
        break;
      case AlertType.bottomSheet:
        _backGroundColor = Get.theme.bottomSheetTheme.backgroundColor;
        _borderRadius = const BorderRadius.vertical(top: Radius.circular(12));
        _margin = EdgeInsets.zero;
        break;
      case AlertType.snackBar:
        _backGroundColor = Get.theme.snackBarTheme.backgroundColor;
        _borderRadius = BorderRadius.zero;
        _margin = EdgeInsets.zero;
        break;
    }
    return Container(
      margin: _margin,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: _backGroundColor,
      ),
      child: widget.child ??
          Column(
            children: [
              ///Гарчигийн мэдээлэл
              if (_titleText != null) _titleWidget(),
              const SizedBox(height: 12),

              ///Зурган мэдээлэл харуулах хэсэг
              if (widget.image != null)
                Column(
                  children: [
                    widget.image!,
                    const SizedBox(height: 12),
                  ],
                ),

              ///Тайлбарын мэдээлэл
              if (_messageText != null) _descriptionWidget(),
              const SizedBox(height: 12),
              _actionWidget(),
            ],
          ),
    );
  }

  ///Alert-ийн гарчиг
  Widget _titleWidget() {
    return Text(
      _titleText!,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }

  ///Alert-ийн тайлбар
  Widget _descriptionWidget() {
    return Text(
      _messageText!,
      style: const TextStyle(),
    );
  }

  ///Alert-ийн товчлууруудын харагдац
  Widget _actionWidget() {
    bool _showNegativeButton = widget.negativeText != null && widget.onNegativeClicked != null;
    return Row(
      children: [
        ///Үйлдлийг үл зөвшөөрөх товчлуур
        if (_showNegativeButton)
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.back();
                widget.onNegativeClicked!();
              },
              style: Get.theme.elevatedButtonTheme.style?.copyWith(
                backgroundColor: MaterialStateProperty.all(Get.theme.hintColor),
              ),
              child: Text(
                widget.negativeText!,
                maxLines: 1,
              ),
            ),
          ),
        if (_showNegativeButton) const SizedBox(width: 12),

        ///Үйлдлийг зөвшөөрөх товчлуур
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              if (widget.onPositiveClicked != null) {
                widget.onPositiveClicked!();
              }
            },
            child: Text(
              widget.positiveText ?? 'Хаах',
              maxLines: 1,
            ),
          ),
        )
      ],
    );
  }
}