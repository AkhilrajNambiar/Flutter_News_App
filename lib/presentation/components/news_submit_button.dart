import 'package:flutter/material.dart';
import 'package:news_feed_app/utilities/constants/my_text_styles.dart';

class NewsSubmitButton extends StatefulWidget {
  NewsSubmitButton({
    super.key,
    required String text,
    required double fontSize,
    required double width,
    required double height,
    required Function() onTap,
    required BuildContext context,
    Widget? prefixIcon,
    Color? color,
    Color? fontColor,
    bool giveBottomBorder = true,
  }) {
    _text = text;
    _fontSize = fontSize;
    _width = width;
    _height = height;
    _onTap = onTap;
    _prefixIcon = prefixIcon;
    _color = color ?? Theme.of(context).colorScheme.secondary;
    _fontColor = fontColor ?? Theme.of(context).colorScheme.surface;
    _giveBottomBorder = giveBottomBorder;
  }

  late final String _text;
  late final double _fontSize;
  late final double _width;
  late final double _height;
  late final Function() _onTap;
  late final Widget? _prefixIcon;
  late final Color _color;
  late final Color _fontColor;
  late final bool _giveBottomBorder;

  @override
  State<NewsSubmitButton> createState() => _NewsSubmitButtonState();
}

class _NewsSubmitButtonState extends State<NewsSubmitButton> {
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: InkWell(
          onTap: widget._onTap,
          child: Stack(
            children: [
              Container(
                width: widget._width,
                height: widget._height,
                decoration: BoxDecoration(
                    color: widget._color,
                    borderRadius: BorderRadius.circular(14)),
                child: Text(
                  widget._text,
                  style: NewsTextStyles.primaryText500.copyWith(
                    fontSize: widget._fontSize,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Visibility(
                visible: widget._giveBottomBorder,
                child: Container(
                  width: widget._width,
                  height: widget._height,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
              Container(
                width: widget._width,
                height: !widget._giveBottomBorder
                    ? widget._height
                    : isHovered
                        ? widget._height
                        : widget._height - 2,
                decoration: BoxDecoration(
                  color: widget._color,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            offset: const Offset(0, 8),
                            blurRadius: 16,
                            color: widget._color.withOpacity(0.2),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget._prefixIcon != null
                        ? widget._prefixIcon!
                        : const SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    Visibility(
                      visible: widget._prefixIcon != null,
                      child: const SizedBox(
                        width: 5,
                      ),
                    ),
                    Text(
                      widget._text,
                      style: NewsTextStyles.primaryText500.copyWith(
                        fontSize: widget._fontSize,
                        color: widget._fontColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
