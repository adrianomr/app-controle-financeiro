import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FullScreenSliderComponentAux extends StatelessWidget {
  List<Widget> widgetList;
  Function callback;

  FullScreenSliderComponentAux(this.widgetList, this.callback);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final double height = MediaQuery.of(context).size.height;
      return CarouselSlider(
        options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              callback(index);
            }),
        items: widgetList,
      );
    });
  }
}

class FullScreenSliderComponent extends StatefulWidget {
  List<Widget> widgetList;

  FullScreenSliderComponent(this.widgetList);

  @override
  State<StatefulWidget> createState() {
    return _FullScreenSliderComponentState();
  }
}

class _FullScreenSliderComponentState extends State<FullScreenSliderComponent> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Column(children: [
      Expanded(
        child: FullScreenSliderComponentAux(widget.widgetList, (index) {
          setState(() {
            _current = index;
          });
        }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.widgetList.map((widget) {
          index++;
          return Container(
            width: _current == index - 1 ? 20 : 4,
            height: 4,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: _current == index - 1
                  ? Color.fromRGBO(0, 0, 0, 0.6)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
