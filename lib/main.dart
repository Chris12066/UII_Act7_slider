import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Flutter Autopartes"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/Chris12066/Img_iOS/main/FlutterFlowA13/180sx.jpg",
    "https://raw.githubusercontent.com/Chris12066/Img_iOS/main/FlutterFlowA13/240Z.jpg",
    "https://raw.githubusercontent.com/Chris12066/Img_iOS/main/FlutterFlowA13/300zx.jpg",
    "https://raw.githubusercontent.com/Chris12066/Img_iOS/main/FlutterFlowA13/370z.jpg",
    "https://raw.githubusercontent.com/Chris12066/Img_iOS/main/FlutterFlowA13/nsx.jpg",
    "https://raw.githubusercontent.com/Chris12066/Img_iOS/main/FlutterFlowA13/rx7.jpg"
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Center(
                          child: Image.network(e),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator()
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              for (int i = 0; i < imgList.length; i++)
                Container(
                  margin: EdgeInsets.all(5),
                  height: i == _currentPage ? 7 : 5,
                  width: i == _currentPage ? 7 : 5,
                  decoration: BoxDecoration(
                      color: i == _currentPage ? Colors.black : Colors.grey,
                      shape: BoxShape.circle),
                )
            ],
          ),
        ),
      ],
    );
  }
}
