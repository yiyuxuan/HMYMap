import 'package:amap_map_example/widgets/amap_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:amap_map/amap_map.dart';
import 'package:x_amap_base/x_amap_base.dart';

class PolylineDemoPage extends StatefulWidget {
  const PolylineDemoPage();

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PolylineDemoPage> {
  AMapController? _mapController;
  _State();

// Values when toggling polyline color
  int colorsIndex = 0;
  List<Color> colors = <Color>[
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.pink,
  ];
  Map<String, Polyline> _polylines = <String, Polyline>{};
  String? selectedPolylineId;

  void _onMapCreated(AMapController controller) {
    _mapController = controller;
  }

  // List<LatLng> _createPoints() {
  //   final List<LatLng> points = <LatLng>[];
  //   final int polylineCount = _polylines.length;
  //   final double offset = polylineCount * -(0.01);
  //   points.add(LatLng(39.938698 + offset, 116.275177));
  //   points.add(LatLng(39.966069 + offset, 116.289253));
  //   points.add(LatLng(39.944226 + offset, 116.306076));
  //   points.add(LatLng(39.966069 + offset, 116.322899));
  //   points.add(LatLng(39.938698 + offset, 116.336975));
  //   return points;
  // }

  void _add() {
    final Polyline polyline = Polyline(
        color: colors[++colorsIndex % colors.length],
        width: 10,
        points: Lujin.getList(),
        joinType: JoinType.round,
        capType: CapType.arrow,
        onTap: _onPolylineTapped);
    setState(() {
      _polylines[polyline.id] = polyline;
    });

    //移动到合适的范围
    LatLngBounds bound =
    LatLngBounds(southwest: Lujin.getList().last, northeast: Lujin.getList().first);
    CameraUpdate update = CameraUpdate.newLatLngBounds(bound, 40);
    _mapController?.moveCamera(update);
  }

  void _remove() {
    final Polyline? selectedPolyline = _polylines[selectedPolylineId];
    //有选中的Marker
    if (selectedPolyline != null) {
      setState(() {
        _polylines.remove(selectedPolylineId);
      });
    } else {
      print('无选中的Polyline，无法删除');
    }
  }

  void _changeWidth() {
    final Polyline? selectedPolyline = _polylines[selectedPolylineId]!;
    //有选中的Polyline
    if (selectedPolyline != null) {
      double currentWidth = selectedPolyline.width;
      if (currentWidth < 50) {
        currentWidth += 10;
      } else {
        currentWidth = 5;
      }

      setState(() {
        _polylines[selectedPolylineId!] =
            selectedPolyline.copyWith(widthParam: currentWidth);
      });
    } else {
      print('无选中的Polyline，无法修改宽度');
    }
  }

  void _onPolylineTapped(String polylineId) {
    print('Polyline: $polylineId 被点击了');
    setState(() {
      selectedPolylineId = polylineId;
    });
  }

  Future<void> _changeDashLineType() async {
    final Polyline? polyline = _polylines[selectedPolylineId];
    if (polyline == null) {
      return;
    }
    DashLineType currentType = polyline.dashLineType;
    if (currentType.index < DashLineType.circle.index) {
      currentType = DashLineType.values[currentType.index + 1];
    } else {
      currentType = DashLineType.none;
    }

    setState(() {
      _polylines[selectedPolylineId!] =
          polyline.copyWith(dashLineTypeParam: currentType);
    });
  }

  void _changeCapType() {
    final Polyline? polyline = _polylines[selectedPolylineId]!;
    if (polyline == null) {
      return;
    }
    CapType capType = polyline.capType;
    if (capType.index < CapType.round.index) {
      capType = CapType.values[capType.index + 1];
    } else {
      capType = CapType.butt;
    }
    setState(() {
      _polylines[selectedPolylineId!] =
          polyline.copyWith(capTypeParam: capType);
    });
  }

  void _changeJointType() {
    final Polyline polyline = _polylines[selectedPolylineId]!;
    JoinType joinType = polyline.joinType;
    if (joinType.index < JoinType.round.index) {
      joinType = JoinType.values[joinType.index + 1];
    } else {
      joinType = JoinType.bevel;
    }
    setState(() {
      _polylines[selectedPolylineId!] =
          polyline.copyWith(joinTypeParam: joinType);
    });
  }

  Future<void> _changeAlpha() async {
    final Polyline polyline = _polylines[selectedPolylineId]!;
    final double current = polyline.alpha;
    setState(() {
      _polylines[selectedPolylineId!] = polyline.copyWith(
        alphaParam: current < 0.1 ? 1.0 : current * 0.75,
      );
    });
  }

  Future<void> _toggleVisible(value) async {
    final Polyline polyline = _polylines[selectedPolylineId]!;
    setState(() {
      _polylines[selectedPolylineId!] = polyline.copyWith(
        visibleParam: value,
      );
    });
  }

  void _changeColor() {
    final Polyline polyline = _polylines[selectedPolylineId]!;
    setState(() {
      _polylines[selectedPolylineId!] = polyline.copyWith(
        colorParam: colors[++colorsIndex % colors.length],
      );
    });
  }

  void _changePoints() {
    final Polyline polyline = _polylines[selectedPolylineId]!;
    List<LatLng> currentPoints = polyline.points;
    List<LatLng> newPoints = <LatLng>[];
    newPoints.addAll(currentPoints);
    newPoints.add(LatLng(39.835347, 116.34575));

    setState(() {
      _polylines[selectedPolylineId!] = polyline.copyWith(
        pointsParam: newPoints,
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AMapWidget map = AMapWidget(
      onMapCreated: _onMapCreated,
      polylines: Set<Polyline>.of(_polylines.values),
    );
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: map,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          TextButton(
                            child: const Text('添加'),
                            onPressed: _add,
                          ),
                          TextButton(
                            child: const Text('删除'),
                            onPressed:
                                (selectedPolylineId == null) ? null : _remove,
                          ),
                          TextButton(
                            child: const Text('修改线宽'),
                            onPressed: (selectedPolylineId == null)
                                ? null
                                : _changeWidth,
                          ),
                          TextButton(
                            child: const Text('修改透明度'),
                            onPressed: (selectedPolylineId == null)
                                ? null
                                : _changeAlpha,
                          ),
                          AMapSwitchButton(
                            label: Text('显示'),
                            onSwitchChanged: (selectedPolylineId == null)
                                ? null
                                : _toggleVisible,
                            defaultValue: true,
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          TextButton(
                            child: const Text('修改颜色'),
                            onPressed: (selectedPolylineId == null)
                                ? null
                                : _changeColor,
                          ),
                          TextButton(
                            child: const Text('修改线头样式'),
                            onPressed: (selectedPolylineId == null)
                                ? null
                                : _changeCapType,
                          ),
                          TextButton(
                            child: const Text('修改连接样式'),
                            onPressed: (selectedPolylineId == null)
                                ? null
                                : _changeJointType,
                          ),
                          TextButton(
                            child: const Text('修改虚线类型'),
                            onPressed: (selectedPolylineId == null)
                                ? null
                                : _changeDashLineType,
                          ),
                          TextButton(
                            child: const Text('修改坐标'),
                            onPressed: (selectedPolylineId == null)
                                ? null
                                : _changePoints,
                          ),
                        ],
                      ),
                    ],
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

class Lujin {

  static List<LatLng> getList() {
    return [
      LatLng( 32.072878,  118.903976),
      LatLng( 32.072862,  118.903795),
      LatLng( 32.072862,  118.903795),
      LatLng( 32.072632,  118.90387),
      LatLng( 32.072578,  118.903607),
      LatLng( 32.072476,  118.903012),
      LatLng( 32.072363,  118.902325),
      LatLng( 32.072283,  118.901826),
      LatLng( 32.072229,  118.901499),
      LatLng( 32.072208,  118.90137),
      LatLng( 32.072063,  118.900506),
      LatLng( 32.071956,  118.899895),
      LatLng( 32.071854,  118.899192),
      LatLng( 32.071822,  118.898785),
      LatLng( 32.071779,  118.897755),
      LatLng( 32.071795,  118.896714),
      LatLng( 32.071773,  118.896499),
      LatLng( 32.07054,  118.895813),
      LatLng( 32.069091,  118.895046),
      LatLng( 32.068506,  118.894734),
      LatLng( 32.067981,  118.894482),
      LatLng( 32.0679,  118.894445),
      LatLng( 32.067187,  118.894042),
      LatLng( 32.066961,  118.893919),
      LatLng( 32.066484,  118.893645),
      LatLng( 32.066296,  118.893517),
      LatLng( 32.065411,  118.89283),
      LatLng( 32.065197,  118.892653),
      LatLng( 32.065068,  118.892524),
      LatLng( 32.064945,  118.892369),
      LatLng( 32.064837,  118.892192),
      LatLng( 32.064279,  118.891097),
      LatLng( 32.064199,  118.890931),
      LatLng( 32.063593,  118.889703),
      LatLng( 32.063394,  118.889719),
      LatLng( 32.061865,  118.890974),
      LatLng( 32.061806,  118.891022),
      LatLng( 32.061458,  118.891312),
      LatLng( 32.06076,  118.89188),
      LatLng( 32.060524,  118.892063),
      LatLng( 32.060524,  118.892063),
      LatLng( 32.060358,  118.892047),
      LatLng( 32.060192,  118.891972),
      LatLng( 32.060192,  118.891972),
      LatLng( 32.060127,  118.89188),
      LatLng( 32.060084,  118.891784),
      LatLng( 32.060063,  118.891725),
      LatLng( 32.060052,  118.891628),
      LatLng( 32.060052,  118.891591),
      LatLng( 32.060074,  118.8915),
      LatLng( 32.060111,  118.891408),
      LatLng( 32.06016,  118.891333),
      LatLng( 32.060202,  118.891285),
      LatLng( 32.060251,  118.891253),
      LatLng( 32.060299,  118.891226),
      LatLng( 32.060353,  118.89121),
      LatLng( 32.060406,  118.891205),
      LatLng( 32.06046,  118.89121),
      LatLng( 32.06054,  118.891231),
      LatLng( 32.060615,  118.891269),
      LatLng( 32.060685,  118.891317),
      LatLng( 32.060755,  118.891381),
      LatLng( 32.060953,  118.891607),
      LatLng( 32.061088,  118.891902),
      LatLng( 32.061109,  118.891956),
      LatLng( 32.061109,  118.891956),
      LatLng( 32.061184,  118.89261),
      LatLng( 32.061184,  118.892787),
      LatLng( 32.061141,  118.893066),
      LatLng( 32.060857,  118.893855),
      LatLng( 32.060776,  118.894042),
      LatLng( 32.060261,  118.895276),
      LatLng( 32.060015,  118.895823),
      LatLng( 32.059827,  118.896156),
      LatLng( 32.059639,  118.89643),
      LatLng( 32.059435,  118.896692),
      LatLng( 32.059237,  118.896918),
      LatLng( 32.059038,  118.897116),
      LatLng( 32.058861,  118.897272),
      LatLng( 32.058716,  118.89746),
      LatLng( 32.058336,  118.897669),
      LatLng( 32.058105,  118.897781),
      LatLng( 32.057965,  118.897851),
      LatLng( 32.057708,  118.897953),
      LatLng( 32.056973,  118.898275),
      LatLng( 32.056297,  118.898506),
      LatLng( 32.055353,  118.898779),
      LatLng( 32.054747,  118.898903),
      LatLng( 32.053711,  118.89908),
      LatLng( 32.052918,  118.89916),
      LatLng( 32.052526,  118.899176),
      LatLng( 32.051807,  118.899181),
      LatLng( 32.050965,  118.899155),
      LatLng( 32.050321,  118.899096),
      LatLng( 32.049693,  118.898988),
      LatLng( 32.049323,  118.898908),
      LatLng( 32.048948,  118.898833),
      LatLng( 32.048712,  118.898801),
      LatLng( 32.048331,  118.898704),
      LatLng( 32.047811,  118.898548),
      LatLng( 32.047118,  118.898318),
      LatLng( 32.047108,  118.898312),
      LatLng( 32.046561,  118.898098),
      LatLng( 32.045831,  118.897776),
      LatLng( 32.045606,  118.897663),
      LatLng( 32.045246,  118.89747),
      LatLng( 32.044737,  118.897186),
      LatLng( 32.043583,  118.896446),
      LatLng( 32.042666,  118.895732),
      LatLng( 32.042226,  118.895346),
      LatLng( 32.041974,  118.895126),
      LatLng( 32.041389,  118.894568),
      LatLng( 32.041126,  118.894278),
      LatLng( 32.040917,  118.894042),
      LatLng( 32.040751,  118.893855),
      LatLng( 32.040354,  118.893409),
      LatLng( 32.039571,  118.89239),
      LatLng( 32.039394,  118.892106),
      LatLng( 32.038761,  118.89113),
      LatLng( 32.038273,  118.890309),
      LatLng( 32.037886,  118.889643),
      LatLng( 32.036867,  118.887777),
      LatLng( 32.036132,  118.88642),
      LatLng( 32.035397,  118.885051),
      LatLng( 32.035086,  118.884505),
      LatLng( 32.035038,  118.884424),
      LatLng( 32.033756,  118.882058),
      LatLng( 32.033713,  118.881983),
      LatLng( 32.03264,  118.880036),
      LatLng( 32.032221,  118.879301),
      LatLng( 32.031642,  118.878378),
      LatLng( 32.031047,  118.877531),
      LatLng( 32.030709,  118.87708),
      LatLng( 32.029942,  118.876157),
      LatLng( 32.029443,  118.87561),
      LatLng( 32.028708,  118.874875),
      LatLng( 32.027957,  118.874205),
      LatLng( 32.027458,  118.873792),
      LatLng( 32.027206,  118.873604),
      LatLng( 32.026745,  118.873261),
      LatLng( 32.026004,  118.872762),
      LatLng( 32.025951,  118.872724),
      LatLng( 32.025146,  118.872225),
      LatLng( 32.024894,  118.87207),
      LatLng( 32.023531,  118.871222),
      LatLng( 32.023252,  118.871077),
      LatLng( 32.023183,  118.87104),
      LatLng( 32.022936,  118.87089),
      LatLng( 32.021621,  118.87009),
      LatLng( 32.020822,  118.869565),
      LatLng( 32.020575,  118.869393),
      LatLng( 32.02012,  118.86906),
      LatLng( 32.019717,  118.868738),
      LatLng( 32.019438,  118.868513),
      LatLng( 32.019063,  118.868165),
      LatLng( 32.018795,  118.867961),
      LatLng( 32.018333,  118.867515),
      LatLng( 32.017813,  118.86699),
      LatLng( 32.01726,  118.866378),
      LatLng( 32.016584,  118.865552),
      LatLng( 32.016107,  118.864914),
      LatLng( 32.01571,  118.864345),
      LatLng( 32.014905,  118.863143),
      LatLng( 32.01416,  118.861995),
      LatLng( 32.014154,  118.861985),
      LatLng( 32.012357,  118.859308),
      LatLng( 32.012143,  118.858975),
      LatLng( 32.011606,  118.858197),
      LatLng( 32.011295,  118.857741),
      LatLng( 32.011171,  118.857554),
      LatLng( 32.009788,  118.855504),
      LatLng( 32.00894,  118.854324),
      LatLng( 32.008511,  118.853756),
      LatLng( 32.007711,  118.852758),
      LatLng( 32.006483,  118.851347),
      LatLng( 32.006199,  118.851046),
      LatLng( 32.005426,  118.850242),
      LatLng( 32.005292,  118.850097),
      LatLng( 32.004466,  118.849244),
      LatLng( 32.003624,  118.84837),
      LatLng( 32.003409,  118.848145),
      LatLng( 32.003173,  118.847871),
      LatLng( 32.002792,  118.847426),
      LatLng( 32.002358,  118.84705),
      LatLng( 32.001929,  118.846605),
      LatLng( 31.999509,  118.844089),
      LatLng( 31.997857,  118.842399),
      LatLng( 31.996629,  118.841122),
      LatLng( 31.995325,  118.839771),
      LatLng( 31.994113,  118.838521),
      LatLng( 31.994032,  118.838446),
      LatLng( 31.993276,  118.837641),
      LatLng( 31.992396,  118.836654),
      LatLng( 31.992187,  118.836407),
      LatLng( 31.991752,  118.835887),
      LatLng( 31.991001,  118.834953),
      LatLng( 31.990191,  118.833886),
      LatLng( 31.989606,  118.833065),
      LatLng( 31.989011,  118.832212),
      LatLng( 31.988421,  118.8313),
      LatLng( 31.987922,  118.830511),
      LatLng( 31.987134,  118.829154),
      LatLng( 31.986694,  118.82836),
      LatLng( 31.986565,  118.828125),
      LatLng( 31.986045,  118.827132),
      LatLng( 31.985353,  118.825705),
      LatLng( 31.985063,  118.825083),
      LatLng( 31.984564,  118.82394),
      LatLng( 31.984038,  118.822631),
      LatLng( 31.983577,  118.821478),
      LatLng( 31.982821,  118.81959),
      LatLng( 31.981812,  118.817063),
      LatLng( 31.98156,  118.81643),
      LatLng( 31.981367,  118.815953),
      LatLng( 31.981201,  118.815529),
      LatLng( 31.980594,  118.814059),
      LatLng( 31.980358,  118.813437),
      LatLng( 31.980111,  118.812605),
      LatLng( 31.979682,  118.81157),
      LatLng( 31.979296,  118.81062),
      LatLng( 31.978776,  118.809483),
      LatLng( 31.978776,  118.809483),
      LatLng( 31.978797,  118.809386),
      LatLng( 31.978776,  118.809215),
      LatLng( 31.978416,  118.808185),
      LatLng( 31.978207,  118.807611),
      LatLng( 31.977783,  118.806597),
      LatLng( 31.977628,  118.806173),
      LatLng( 31.977617,  118.806152),
      LatLng( 31.977102,  118.804832),
      LatLng( 31.976737,  118.803904),
      LatLng( 31.97582,  118.801597),
      LatLng( 31.975557,  118.800932),
      LatLng( 31.975144,  118.799881),
      LatLng( 31.975048,  118.799613),
      LatLng( 31.974656,  118.798545),
      LatLng( 31.974302,  118.797504),
      LatLng( 31.974162,  118.797091),
      LatLng( 31.974045,  118.796667),
      LatLng( 31.973921,  118.796265),
      LatLng( 31.973798,  118.795857),
      LatLng( 31.973798,  118.795857),
      LatLng( 31.973696,  118.795476),
      LatLng( 31.973588,  118.795106),
      LatLng( 31.973519,  118.79486),
      LatLng( 31.973433,  118.794532),
      LatLng( 31.973288,  118.794033),
      LatLng( 31.973149,  118.79354),
      LatLng( 31.973149,  118.79354),
      LatLng( 31.973186,  118.793422),
      LatLng( 31.973197,  118.793121),
      LatLng( 31.973256,  118.79295),
      LatLng( 31.97331,  118.792875),
      LatLng( 31.973438,  118.792768),
      LatLng( 31.973513,  118.792735),
      LatLng( 31.973594,  118.792714),
      LatLng( 31.973749,  118.79273),
      LatLng( 31.973825,  118.792757),
      LatLng( 31.973959,  118.792864),
      LatLng( 31.974012,  118.792939),
      LatLng( 31.974082,  118.793073),
      LatLng( 31.974152,  118.793245),
      LatLng( 31.974221,  118.793486),
      LatLng( 31.974275,  118.793728),
      LatLng( 31.974291,  118.793975),
      LatLng( 31.974264,  118.794093),
      LatLng( 31.974221,  118.794205),
      LatLng( 31.974162,  118.794307),
      LatLng( 31.974082,  118.794398),
      LatLng( 31.973985,  118.794468),
      LatLng( 31.97369,  118.794645),
      LatLng( 31.973015,  118.794929),
      LatLng( 31.973015,  118.794929),
      LatLng( 31.972891,  118.794972),
      LatLng( 31.972741,  118.794983),
      LatLng( 31.97258,  118.794967),
      LatLng( 31.972456,  118.794919),
      LatLng( 31.972274,  118.794806),
      LatLng( 31.972017,  118.794591),
      LatLng( 31.971738,  118.794382),
      LatLng( 31.971545,  118.794275),
      LatLng( 31.971346,  118.794189),
      LatLng( 31.971099,  118.794109),
      LatLng( 31.970772,  118.794044),
      LatLng( 31.970633,  118.794039),
      LatLng( 31.970493,  118.79406),
      LatLng( 31.9703,  118.794114),
      LatLng( 31.970214,  118.794151),
      LatLng( 31.970107,  118.794205),
      LatLng( 31.969968,  118.794318),
      LatLng( 31.969833,  118.794527),
      LatLng( 31.969769,  118.794699),
      LatLng( 31.969737,  118.794897),
      LatLng( 31.969753,  118.795063),
      LatLng( 31.969801,  118.795289),
      LatLng( 31.969801,  118.795289),
      LatLng( 31.969908,  118.795444),
      LatLng( 31.969984,  118.795589),
      LatLng( 31.969984,  118.795589),
      LatLng( 31.970203,  118.795815),
      LatLng( 31.970214,  118.795836),
      LatLng( 31.970723,  118.796939)
    ];
  }

}
