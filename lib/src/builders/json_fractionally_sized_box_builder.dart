import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build a [FractionallySizedBox] widget.  See the [fromDynamic] for the
/// format.
class JsonFractionallySizedBoxBuilder extends JsonWidgetBuilder {
  JsonFractionallySizedBoxBuilder({
    this.alignment,
    this.heightFactor,
    this.widthFactor,
  });

  static const type = 'fractionally_sized_box';

  final AlignmentGeometry alignment;
  final double heightFactor;
  final double widthFactor;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "alignment": <AlignmentGeometry>,
  ///   "heightFactor": <double>,
  ///   "widthFactor": <double>
  /// }
  /// ```
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeAlignment]
  static JsonFractionallySizedBoxBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonFractionallySizedBoxBuilder result;

    if (map != null) {
      result = JsonFractionallySizedBoxBuilder(
        alignment: ThemeDecoder.decodeAlignment(
              map['alignment'],
              validate: false,
            ) ??
            Alignment.center,
        heightFactor: JsonClass.parseDouble(
          map['heightFactor'],
        ),
        widthFactor: JsonClass.parseDouble(
          map['widthFactor'],
        ),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    @required BuildContext context,
    @required JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.length == 1,
      '[JsonFractionallySizedBoxBuilder] only supports exactly one child.',
    );

    return FractionallySizedBox(
      alignment: alignment,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
