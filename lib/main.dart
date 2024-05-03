import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cano 0440',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act13GridView_FluttewFlow_Cano/Amor.jpg",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act13GridView_FluttewFlow_Cano/Beso.jpg",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act13GridView_FluttewFlow_Cano/BrilloRadiante.jpg",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act13GridView_FluttewFlow_Cano/Daca.jpg",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act13GridView_FluttewFlow_Cano/Descanso.jpg",
    "https://raw.githubusercontent.com/JesusRafaelCanoFlores5A/Img_FlutterFlow_IOS_6J/main/Act13GridView_FluttewFlow_Cano/Encarnaci%C3%B3n.jpg"
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffddedf2),
      appBar: AppBar(
        backgroundColor: const Color(0xff03a0fb),
        title: const Text(
          "Comex Cano 0440",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator(),
            const Text(
              "Prueba nuestra variedad de colores",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < imgList.length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          height: i == _currentPage ? 7 : 5,
          width: i == _currentPage ? 7 : 5,
          decoration: BoxDecoration(
              color: i == _currentPage
                  ? const Color(0xffffffff)
                  : const Color(0xff848484),
              shape: BoxShape.circle),
        )
    ]);
  }
}
