import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

/// Builder that can build an [RefreshIndicator] widget.  See the [fromDynamic] for the
/// format.
class JsonRefreshIndicatorBuilder extends JsonWidgetBuilder {
  JsonRefreshIndicatorBuilder({
    this.backgroundColor,
    this.color,
    this.displacement,
    @required this.onRefresh,
    this.notificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth,
  }) : assert(onRefresh != null);

  static const type = 'refresh_indicator';

  final Color backgroundColor;
  final Color color;
  final double displacement;
  final RefreshCallback onRefresh;
  final ScrollNotificationPredicate notificationPredicate;
  final String semanticsLabel;
  final String semanticsValue;
  final double strokeWidth;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "backgroundColor": <Color>,
  ///   "color": <Color>,
  ///   "displacement": <double>,
  ///   "onRefresh": <RefreshCallback>,
  ///   "notificationPredicate": <ScrollNotificationPredicate>,
  ///   "semanticsLabel": <String>,
  ///   "semanticsValue": <String>,
  ///   "strokeWidth": <double>
  /// }
  /// ```
  ///
  /// As a note, the [RefreshCallback] and [ScrollNotificationPredicate] cannot
  /// be decoded viaJSON.  Instead, the only way to bind those values to the builder
  /// is to use a function or a variable reference via the [JsonWidgetRegistry].
  ///
  /// See also:
  ///  * [ThemeDecoder.decodeColor]
  static JsonRefreshIndicatorBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry registry,
  }) {
    JsonRefreshIndicatorBuilder result;

    if (map != null) {
      result = JsonRefreshIndicatorBuilder(
        backgroundColor: ThemeDecoder.decodeColor(
          map['backgroundColor'],
          validate: false,
        ),
        color: ThemeDecoder.decodeColor(
          map['color'],
          validate: false,
        ),
        displacement: JsonClass.parseDouble(
          map['displacement'],
          40.0,
        ),
        onRefresh: map['onRefresh'],
        notificationPredicate:
            map['notificationPredicate'] ?? defaultScrollNotificationPredicate,
        semanticsLabel: map['semanticsLabel'],
        semanticsValue: map['semanticsValue'],
        strokeWidth: JsonClass.parseDouble(
          map['strokeWidth'],
          2.0,
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
      '[JsonRefreshIndicatorBuilder] only supports exactly one child.',
    );

    return RefreshIndicator(
      backgroundColor: backgroundColor,
      color: color,
      displacement: displacement,
      onRefresh: onRefresh,
      notificationPredicate: notificationPredicate,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      strokeWidth: strokeWidth,
      child: data.children[0].build(
        childBuilder: childBuilder,
        context: context,
      ),
    );
  }
}
