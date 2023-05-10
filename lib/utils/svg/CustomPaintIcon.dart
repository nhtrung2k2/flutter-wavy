import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3586876, size.height * 0.3872851);
    path_0.lineTo(size.width * 0.2847964, size.height * 0.3872851);
    path_0.cubicTo(
        size.width * 0.2738793,
        size.height * 0.3872851,
        size.width * 0.2744147,
        size.height * 0.4026372,
        size.width * 0.2847964,
        size.height * 0.4026372);
    path_0.arcToPoint(Offset(size.width * 0.3030907, size.height * 0.4068283),
        radius: Radius.elliptical(
            size.width * 0.04462028, size.height * 0.07063810),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.quadraticBezierTo(size.width * 0.3095458, size.height * 0.4115376,
        size.width * 0.3095458, size.height * 0.4268896);
    path_0.arcToPoint(Offset(size.width * 0.3077312, size.height * 0.4438898),
        radius: Radius.elliptical(
            size.width * 0.03337597, size.height * 0.05283730),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.cubicTo(
        size.width * 0.3064818,
        size.height * 0.4495879,
        size.width * 0.3051730,
        size.height * 0.4549564,
        size.width * 0.3037451,
        size.height * 0.4599011);
    path_0.lineTo(size.width * 0.2421394, size.height * 0.6635743);
    path_0.lineTo(size.width * 0.2290508, size.height * 0.4803391);
    path_0.quadraticBezierTo(size.width * 0.2277122, size.height * 0.4615022,
        size.width * 0.2271172, size.height * 0.4487403);
    path_0.cubicTo(
        size.width * 0.2268495,
        size.height * 0.4435602,
        size.width * 0.2268793,
        size.height * 0.4393219,
        size.width * 0.2267305,
        size.height * 0.4366376);
    path_0.cubicTo(
        size.width * 0.2240831,
        size.height * 0.3881799,
        size.width * 0.1956153,
        size.height * 0.3871910,
        size.width * 0.1451052,
        size.height * 0.3871910);
    path_0.cubicTo(
        size.width * 0.1589672,
        size.height * 0.3899223,
        size.width * 0.1636672,
        size.height * 0.4001884,
        size.width * 0.1675640,
        size.height * 0.4107370);
    path_0.cubicTo(
        size.width * 0.1718476,
        size.height * 0.4251943,
        size.width * 0.1737514,
        size.height * 0.4389922,
        size.width * 0.1737514,
        size.height * 0.4644690);
    path_0.arcToPoint(Offset(size.width * 0.1731564, size.height * 0.4703085),
        radius: Radius.elliptical(
            size.width * 0.01647976, size.height * 0.02608900),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.1139899, size.height * 0.6658818);
    path_0.lineTo(size.width * 0.09834310, size.height * 0.4461502);
    path_0.cubicTo(
        size.width * 0.09834310,
        size.height * 0.4437014,
        size.width * 0.09813487,
        size.height * 0.4417707,
        size.width * 0.09807538,
        size.height * 0.4404521);
    path_0.arcToPoint(Offset(size.width * 0.09807538, size.height * 0.4363080),
        radius: Radius.elliptical(
            size.width * 0.02457090, size.height * 0.03889805),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.quadraticBezierTo(size.width * 0.09807538, size.height * 0.4154462,
        size.width * 0.1069994, size.height * 0.4080527);
    path_0.arcToPoint(Offset(size.width * 0.1222596, size.height * 0.4033435),
        radius: Radius.elliptical(
            size.width * 0.03429812, size.height * 0.05429715),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.1222596, size.height * 0.3870968),
        radius: Radius.elliptical(
            size.width * 0.005146206, size.height * 0.008146927),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.lineTo(size.width * 0.003748104, size.height * 0.3870968);
    path_0.cubicTo(
        size.width * -0.002706964,
        size.height * 0.3872851,
        size.width * -0.001368355,
        size.height * 0.4002826,
        size.width * 0.01210697,
        size.height * 0.4026372);
    path_0.quadraticBezierTo(size.width * 0.02968736, size.height * 0.4054156,
        size.width * 0.03492281, size.height * 0.4139393);
    path_0.cubicTo(
        size.width * 0.03840319,
        size.height * 0.4196845,
        size.width * 0.04105066,
        size.height * 0.4333412,
        size.width * 0.04283547,
        size.height * 0.4550035);
    path_0.lineTo(size.width * 0.07359372, size.height * 0.8186955);
    path_0.lineTo(size.width * 0.08501651, size.height * 0.8186955);
    path_0.lineTo(size.width * 0.1772318, size.height * 0.5138686);
    path_0.lineTo(size.width * 0.2012077, size.height * 0.8186955);
    path_0.lineTo(size.width * 0.2126305, size.height * 0.8186955);
    path_0.lineTo(size.width * 0.3256686, size.height * 0.4485990);
    path_0.quadraticBezierTo(size.width * 0.3342059, size.height * 0.4207205,
        size.width * 0.3436654, size.height * 0.4102661);
    path_0.arcToPoint(Offset(size.width * 0.3587471, size.height * 0.4026372),
        radius: Radius.elliptical(
            size.width * 0.03179939, size.height * 0.05034142),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.cubicTo(
        size.width * 0.3723711,
        size.height * 0.4026372,
        size.width * 0.3908439,
        size.height * 0.4094184,
        size.width * 0.3815926,
        size.height * 0.4336708);
    path_0.cubicTo(
        size.width * 0.3931939,
        size.height * 0.4107370,
        size.width * 0.3841509,
        size.height * 0.3872851,
        size.width * 0.3586876,
        size.height * 0.3872851);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff231916).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9926228, size.height * 0.4693666);
    path_1.arcToPoint(Offset(size.width * 0.9756968, size.height * 0.4579703),
        radius: Radius.elliptical(
            size.width * 0.02677217, size.height * 0.04238286),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.9586221, size.height * 0.4687073),
        radius: Radius.elliptical(
            size.width * 0.02156647, size.height * 0.03414175),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.9553797, size.height * 0.5162232),
        radius: Radius.elliptical(
            size.width * 0.02329179, size.height * 0.03687309),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.9614778, size.height * 0.5266777),
        radius: Radius.elliptical(
            size.width * 0.02796204, size.height * 0.04426654),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.9644525, size.height * 0.5303508);
    path_1.arcToPoint(Offset(size.width * 0.9707291, size.height * 0.5412762),
        radius: Radius.elliptical(
            size.width * 0.02147723, size.height * 0.03400047),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.arcToPoint(Offset(size.width * 0.9724544, size.height * 0.5529079),
        radius: Radius.elliptical(
            size.width * 0.01308862, size.height * 0.02072051),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.cubicTo(
        size.width * 0.9693310,
        size.height * 0.6041441,
        size.width * 0.9447303,
        size.height * 0.7192371,
        size.width * 0.9151322,
        size.height * 0.7737226);
    path_1.cubicTo(
        size.width * 0.9151322,
        size.height * 0.7737226,
        size.width * 0.9151322,
        size.height * 0.6624441,
        size.width * 0.8943094,
        size.height * 0.5778667);
    path_1.cubicTo(
        size.width * 0.8788411,
        size.height * 0.5143866,
        size.width * 0.8175328,
        size.height * 0.5135861,
        size.width * 0.8156587,
        size.height * 0.5894985);
    path_1.cubicTo(
        size.width * 0.8217866,
        size.height * 0.5695785,
        size.width * 0.8418062,
        size.height * 0.5788557,
        size.width * 0.8492727,
        size.height * 0.6036261);
    path_1.cubicTo(
        size.width * 0.8617961,
        size.height * 0.6452555,
        size.width * 0.8766100,
        size.height * 0.7449023,
        size.width * 0.8713449,
        size.height * 0.8357900);
    path_1.cubicTo(
        size.width * 0.8704227,
        size.height * 0.8518484,
        size.width * 0.8705417,
        size.height * 0.8654580,
        size.width * 0.8609929,
        size.height * 0.8823640);
    path_1.cubicTo(
        size.width * 0.8558170,
        size.height * 0.8917824,
        size.width * 0.7971859,
        size.height * 0.9937368,
        size.width * 0.7223131,
        size.height * 0.9492348);
    path_1.arcToPoint(Offset(size.width * 0.7077074, size.height * 0.9341653),
        radius:
            Radius.elliptical(size.width * 0.1336229, size.height * 0.2115376),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.arcToPoint(Offset(size.width * 0.6873308, size.height * 0.9217330),
        radius: Radius.elliptical(
            size.width * 0.04069370, size.height * 0.06442194),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.6714162, size.height * 0.9302096),
        radius: Radius.elliptical(
            size.width * 0.02347027, size.height * 0.03715564),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.6638605, size.height * 0.9552154),
        radius: Radius.elliptical(
            size.width * 0.02004938, size.height * 0.03174005),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.6706428, size.height * 0.9828585),
        radius: Radius.elliptical(
            size.width * 0.02379748, size.height * 0.03767365),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.6890859, size.height * 0.9960914),
        radius: Radius.elliptical(
            size.width * 0.02808103, size.height * 0.04445491),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.cubicTo(
        size.width * 0.7728828,
        size.height * 1.013515,
        size.width * 0.8161049,
        size.height * 0.9685425,
        size.width * 0.8509683,
        size.height * 0.9249823);
    path_1.cubicTo(
        size.width * 0.9160544,
        size.height * 0.8436543,
        size.width * 0.9950323,
        size.height * 0.6453968,
        size.width * 0.9997025,
        size.height * 0.5034142);
    path_1.cubicTo(
        size.width * 1.000416,
        size.height * 0.4879680,
        size.width * 0.9978582,
        size.height * 0.4766188,
        size.width * 0.9926228,
        size.height * 0.4693666);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff231916).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.4976649, size.height * 0.6720509);
    path_2.lineTo(size.width * 0.5144124, size.height * 0.5767836);
    path_2.lineTo(size.width * 0.5208079, size.height * 0.5424064);
    path_2.cubicTo(
        size.width * 0.5208079,
        size.height * 0.5424064,
        size.width * 0.5234256,
        size.height * 0.5246056,
        size.width * 0.5315465,
        size.height * 0.5195668);
    path_2.cubicTo(
        size.width * 0.4848142,
        size.height * 0.5148575,
        size.width * 0.4822263,
        size.height * 0.5363786,
        size.width * 0.4753845,
        size.height * 0.5633624);
    path_2.arcToPoint(Offset(size.width * 0.4678585, size.height * 0.5345891),
        radius: Radius.elliptical(
            size.width * 0.05161079, size.height * 0.08170473),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.cubicTo(
        size.width * 0.4630990,
        size.height * 0.5251707,
        size.width * 0.4504864,
        size.height * 0.5207441,
        size.width * 0.4404319,
        size.height * 0.5207441);
    path_2.cubicTo(
        size.width * 0.4156825,
        size.height * 0.5207441,
        size.width * 0.3943243,
        size.height * 0.5377443,
        size.width * 0.3735015,
        size.height * 0.5785260);
    path_2.arcToPoint(Offset(size.width * 0.3378053, size.height * 0.7366612),
        radius:
            Radius.elliptical(size.width * 0.1705982, size.height * 0.2700730),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.quadraticBezierTo(size.width * 0.3378053, size.height * 0.7813515,
        size.width * 0.3513401, size.height * 0.8000471);
    path_2.arcToPoint(Offset(size.width * 0.3805515, size.height * 0.8188839),
        radius: Radius.elliptical(
            size.width * 0.04375762, size.height * 0.06927243),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.arcToPoint(Offset(size.width * 0.4121724, size.height * 0.8014599),
        radius: Radius.elliptical(
            size.width * 0.05033168, size.height * 0.07967977),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.arcToPoint(Offset(size.width * 0.4368326, size.height * 0.7590770),
        radius:
            Radius.elliptical(size.width * 0.1107178, size.height * 0.1752767),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.quadraticBezierTo(size.width * 0.4414731, size.height * 0.7483400,
        size.width * 0.4437041, size.height * 0.7428302);
    path_2.cubicTo(
        size.width * 0.4443288,
        size.height * 0.7412762,
        size.width * 0.4447452,
        size.height * 0.7402402,
        size.width * 0.4450129,
        size.height * 0.7394867);
    path_2.arcToPoint(Offset(size.width * 0.4402534, size.height * 0.7770191),
        radius:
            Radius.elliptical(size.width * 0.1383526, size.height * 0.2190252),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.arcToPoint(Offset(size.width * 0.4487610, size.height * 0.8085708),
        radius: Radius.elliptical(
            size.width * 0.02379748, size.height * 0.03767365),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.arcToPoint(Offset(size.width * 0.4663712, size.height * 0.8192607),
        radius: Radius.elliptical(
            size.width * 0.02811078, size.height * 0.04450200),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.arcToPoint(Offset(size.width * 0.4958503, size.height * 0.7981634),
        radius: Radius.elliptical(
            size.width * 0.04093167, size.height * 0.06479868),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.cubicTo(
        size.width * 0.5129845,
        size.height * 0.7706616,
        size.width * 0.5255972,
        size.height * 0.7142924,
        size.width * 0.5255972,
        size.height * 0.7142924);
    path_2.cubicTo(
        size.width * 0.5235446,
        size.height * 0.7185778,
        size.width * 0.5134010,
        size.height * 0.7397222,
        size.width * 0.5103073,
        size.height * 0.7459383);
    path_2.cubicTo(
        size.width * 0.5072136,
        size.height * 0.7521545,
        size.width * 0.5050123,
        size.height * 0.7563927,
        size.width * 0.5037332,
        size.height * 0.7586532);
    path_2.arcToPoint(Offset(size.width * 0.4963858, size.height * 0.7704262),
        radius: Radius.elliptical(
            size.width * 0.05271143, size.height * 0.08344714),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.arcToPoint(Offset(size.width * 0.4896035, size.height * 0.7745703),
        radius: Radius.elliptical(
            size.width * 0.01076836, size.height * 0.01704733),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.arcToPoint(Offset(size.width * 0.4861231, size.height * 0.7724511),
        radius: Radius.elliptical(
            size.width * 0.005205699, size.height * 0.008241111),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.arcToPoint(Offset(size.width * 0.4845763, size.height * 0.7647751),
        radius: Radius.elliptical(
            size.width * 0.006336080, size.height * 0.01003061),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.arcToPoint(Offset(size.width * 0.4898117, size.height * 0.7197551),
        radius:
            Radius.elliptical(size.width * 0.1307077, size.height * 0.2069225),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.quadraticBezierTo(size.width * 0.4921617, size.height * 0.7032729,
        size.width * 0.4976649, size.height * 0.6720509);
    path_2.close();
    path_2.moveTo(size.width * 0.4483743, size.height * 0.6908877);
    path_2.quadraticBezierTo(size.width * 0.4234762, size.height * 0.7739110,
        size.width * 0.4037541, size.height * 0.7735814);
    path_2.arcToPoint(Offset(size.width * 0.3912901, size.height * 0.7625618),
        radius: Radius.elliptical(
            size.width * 0.01445697, size.height * 0.02288674),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.arcToPoint(Offset(size.width * 0.3865604, size.height * 0.7365199),
        radius: Radius.elliptical(
            size.width * 0.02867597, size.height * 0.04539675),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.quadraticBezierTo(size.width * 0.3865604, size.height * 0.6985166,
        size.width * 0.4064610, size.height * 0.6272192);
    path_2.quadraticBezierTo(size.width * 0.4290389, size.height * 0.5466918,
        size.width * 0.4505161, size.height * 0.5466918);
    path_2.arcToPoint(Offset(size.width * 0.4642294, size.height * 0.5608194),
        radius: Radius.elliptical(
            size.width * 0.01356457, size.height * 0.02147398),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.arcToPoint(Offset(size.width * 0.4661630, size.height * 0.5807393),
        radius: Radius.elliptical(
            size.width * 0.03450635, size.height * 0.05462680),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.quadraticBezierTo(size.width * 0.4661630, size.height * 0.6216153,
        size.width * 0.4483743, size.height * 0.6910290);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff231916).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.8272898, size.height * 0.2012715);
    path_3.cubicTo(
        size.width * 0.8272898,
        size.height * 0.1624205,
        size.width * 0.8045037,
        size.height * 0.1572404,
        size.width * 0.7915935,
        size.height * 0.1430186);
    path_3.cubicTo(
        size.width * 0.7786834,
        size.height * 0.1287968,
        size.width * 0.7696404,
        size.height * 0.1097245,
        size.width * 0.7670524,
        size.height * 0.09149988);
    path_3.cubicTo(
        size.width * 0.7643454,
        size.height * 0.07214504,
        size.width * 0.7673201,
        size.height * 0.04440782,
        size.width * 0.7734480,
        size.height * 0.02985637);
    path_3.cubicTo(
        size.width * 0.7935866,
        size.height * -0.01723570,
        size.width * 0.8257132,
        size.height * 0.002919708,
        size.width * 0.8364220,
        size.height * 0.01351542);
    path_3.cubicTo(
        size.width * 0.8471309,
        size.height * 0.02411114,
        size.width * 0.8594461,
        size.height * 0.04977631,
        size.width * 0.8639676,
        size.height * 0.07530021);
    path_3.cubicTo(
        size.width * 0.9099563,
        size.height * 0.3358606,
        size.width * 0.6947080,
        size.height * 0.6924888,
        size.width * 0.6566618,
        size.height * 0.7571462);
    path_3.cubicTo(
        size.width * 0.6566618,
        size.height * 0.7571462,
        size.width * 0.5782788,
        size.height * 0.8884860,
        size.width * 0.5919029,
        size.height * 0.8100306);
    path_3.cubicTo(
        size.width * 0.5967814,
        size.height * 0.7759830,
        size.width * 0.5968409,
        size.height * 0.6666824,
        size.width * 0.5968409,
        size.height * 0.6666824);
    path_3.cubicTo(
        size.width * 0.5957997,
        size.height * 0.6203438,
        size.width * 0.5834251,
        size.height * 0.3068990,
        size.width * 0.5411250,
        size.height * 0.2532140);
    path_3.cubicTo(
        size.width * 0.5232769,
        size.height * 0.2305157,
        size.width * 0.4953149,
        size.height * 0.2222275,
        size.width * 0.4751465,
        size.height * 0.2634801);
    path_3.cubicTo(
        size.width * 0.4823452,
        size.height * 0.1321403,
        size.width * 0.5630782,
        size.height * 0.1320932,
        size.width * 0.5971086,
        size.height * 0.1747116);
    path_3.cubicTo(
        size.width * 0.6554719,
        size.height * 0.2478926,
        size.width * 0.6648422,
        size.height * 0.6137038,
        size.width * 0.6685011,
        size.height * 0.6898046);
    path_3.cubicTo(
        size.width * 0.7187435,
        size.height * 0.5974099,
        size.width * 0.8269625,
        size.height * 0.3805981,
        size.width * 0.8272898,
        size.height * 0.2012715);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5662909, size.height * -20.55098),
        Offset(size.width * 0.8352619, size.height * 0.2590064), [
      const Color(0xff62c3d2).withOpacity(1),
      const Color(0xff00afce).withOpacity(1),
      const Color(0xff0090d5).withOpacity(1),
      const Color(0xff003f97).withOpacity(1)
    ], [
      0,
      0.15,
      0.65,
      1
    ]);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
