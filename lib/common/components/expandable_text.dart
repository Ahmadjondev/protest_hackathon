import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:protest/common/app_text_style.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    Key? key,
    this.trimLines = 2,
    this.textStyle,
    this.textColor,
    this.moreColor,
    this.onMoreText,
    this.moreStyle,
    this.onShortText,
  }) : super(key: key);

  final String text;
  final String? onMoreText, onShortText;
  final TextStyle? textStyle, moreStyle;
  final Color? textColor, moreColor;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final colorClickableText = Colors.grey;
    TextSpan link = TextSpan(
        text: _readMore
            ? widget.onShortText ?? "and"
            : widget.onMoreText ?? " читать дальше",
        style: widget.moreStyle ?? TextStyle(color: colorClickableText),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(text: widget.text);
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore
                ? '${widget.text.substring(0, endIndex)}... '
                : '${widget.text}  ',
            style: widget.textStyle ??
                AppTextStyles.body16w4.copyWith(color: widget.moreColor),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(text: widget.text, style: widget.textStyle);
        }
        return GestureDetector(
          onTap: _onTapLink,
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.clip,
            text: textSpan,
          ),
        );
      },
    );
    return result;
  }
}
