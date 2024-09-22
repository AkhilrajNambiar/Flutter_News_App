import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_feed_app/utilities/constants/my_assets.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';
import 'package:news_feed_app/utilities/extensions.dart';

class NewsTextField extends StatefulWidget {
  NewsTextField({
    super.key,
    required double fontSize,
    required double width,
    required double height,
    required Function(String text) onChanged,
    bool isForPassword = false,
    String label = '',
    FieldType? fieldType,
    List<TextInputFormatter>? inputFormatters,
    TextAlign align = TextAlign.start,
    String initialValue = '',
    bool isSingleLine = true,
    int maxLines = 1,
    String? hintText,
  }) {
    _label = label;
    _fontSize = fontSize;
    _width = width;
    _height = height;
    _onChanged = onChanged;
    _isForPassword = isForPassword;
    _fieldType = fieldType ?? FieldType.text;
    _inputFormatters = inputFormatters ?? [];
    _align = align;
    _initialValue = initialValue;
    _isSingleLine = isSingleLine;
    _maxLines = maxLines;
    _hintText = hintText;
  }

  late final String _label;
  late final double _fontSize;
  late final double _width;
  late final double _height;
  late final Function(String text) _onChanged;
  late final bool _isForPassword;
  late final FieldType _fieldType;
  late final List<TextInputFormatter> _inputFormatters;
  late final TextAlign _align;
  late final String _initialValue;
  late final bool _isSingleLine;
  late final int _maxLines;
  late final String? _hintText;

  @override
  State<NewsTextField> createState() => _NewsTextFieldState();
}

class _NewsTextFieldState extends State<NewsTextField> {
  var textInputController = TextEditingController(text: '');
  bool shouldObscureText = true;

  @override
  void initState() {
    super.initState();
    textInputController.text = widget._initialValue;
    textInputController.addListener(() {
      widget._onChanged(textInputController.text);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget._label.isNotEmpty,
            child: Text(
              widget._label,
              style: NewsTextStyles.primaryText400.copyWith(
                fontSize: widget._fontSize,
                color: const Color(0xff8A9099),
              ),
            ),
          ),
          Visibility(
            visible: widget._label.isNotEmpty,
            child: SizedBox(
              height: 133.25.sh(context),
            ),
          ),
          Stack(
            children: [
              Container(
                width: widget._width,
                height: widget._height,
                alignment: Alignment.center,
                child: TextFormField(
                  maxLines: widget._maxLines,
                  textAlign: widget._align,
                  keyboardType: widget._fieldType == FieldType.numberOnly
                      ? TextInputType.number
                      : TextInputType.text,
                  obscureText: widget._isForPassword && shouldObscureText,
                  textAlignVertical: TextAlignVertical.center,
                  style: NewsTextStyles.primaryText400.copyWith(
                    fontSize: widget._fontSize,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  controller: textInputController,
                  inputFormatters: [
                    if (widget._fieldType == FieldType.numberOnly)
                      FilteringTextInputFormatter.digitsOnly,
                    if (widget._isSingleLine)
                      FilteringTextInputFormatter.singleLineFormatter,
                    ...widget._inputFormatters
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: widget._maxLines > 1 ? 66.625.sh(context) : 0,
                      horizontal: 90.sw(context),
                    ),
                    hintText: widget._hintText,
                  ),
                ),
              ),
              widget._isForPassword
                  ? Positioned(
                      right: 16,
                      top: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          if (widget._isForPassword) {
                            if (mounted) {
                              setState(() {
                                shouldObscureText = !shouldObscureText;
                              });
                            }
                          }
                        },
                        child: SvgPicture.asset(
                          NewsAssets.getPathBasedOnPlatform(
                            shouldObscureText
                                ? NewsAssets.eyesClosed
                                : NewsAssets.eyesOpen,
                          ),
                          width: widget._fontSize * 1.5,
                          height: widget._fontSize * 1.5,
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    )
            ],
          ),
        ],
      );
}

enum FieldType { text, numberOnly }
