import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:riverpod_tut/screens/vote_voicw_connect/widgets/custom_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/custom_icons.dart';

class VoteCoiceConnect extends StatefulWidget {
  const VoteCoiceConnect({super.key});

  @override
  State<VoteCoiceConnect> createState() => _VoteCoiceConnectState();
}

class _VoteCoiceConnectState extends State<VoteCoiceConnect> {
  int activeIndex = 0;
  final items = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
  ];

  final dataMap = <String, double>{
    "Pending": 15,
    "Resolved": 20,
    "Rejected": 10,
  };

  final colorList = <Color>[
    Colors.redAccent,
    Colors.blueAccent.shade400,
    Colors.amberAccent,
  ];

  final dataMap1 = <String, double>{
    "Pending": 10,
    "Resolved": 20,
    "Rejected": 15,
  };

  final colorList1 = <Color>[
    Colors.redAccent,
    Colors.blueAccent.shade400,
    Colors.amberAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      floatingActionButton: SizedBox(
        width: 150,
        child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            onPressed: () {},
            isExtended: true,
            backgroundColor: Colors.blueAccent.shade400,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(60)),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/icons/volunteering.png",
                    width: 20,
                  ),
                ),
                const Text(
                  "Become a\nVolunteer",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
      ),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: const Color(0xffffffff),
        title: const Text(
          "Vote Voice Connect",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(60)),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              "assets/icons/language.png",
              width: 20,
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xffebeef5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: items.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    reverse: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.easeInBack,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: MediaQuery.of(context).size.width / 2.7,
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: items.length,
                    effect: WormEffect(
                        dotHeight: 7,
                        dotWidth: 7,
                        activeDotColor: Colors.blueAccent.shade700,
                        dotColor: const Color(0xffffffff),
                        type: WormType.normal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "#explore",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  backgroundColor: Color(0xffbbecd7),
                  iconColor: Color(0xff41b8be),
                  numbers: '12',
                  title: 'Articles',
                  icons: 'assets/icons/application.png',
                ),
                CustomContainer(
                  backgroundColor: Color(0xffd4ddff),
                  iconColor: Color(0xff0032e6),
                  numbers: '4',
                  title: 'Events',
                  icons: 'assets/icons/marketing-plan.png',
                ),
                CustomContainer(
                  backgroundColor: Color(0xfffeefd7),
                  iconColor: Color(0xff8d9702),
                  numbers: '10+',
                  title: 'Govt. Scheme',
                  icons: 'assets/icons/government.png',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "#connnetwithus",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              spacing: 14,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcons(
                  icons: 'assets/icons/report.png',
                  title: 'Reports',
                ),
                CustomIcons(
                  icons: 'assets/icons/man.png',
                  title: 'Complaints',
                ),
                CustomIcons(
                  icons: 'assets/icons/video.png',
                  title: 'Videos',
                ),
                CustomIcons(
                  icons: 'assets/icons/image-gallery.png',
                  title: 'Gallery',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "#reports",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/ring-chart.png",
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Complaints\nchart",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/icons/pie-chart.png",
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Events\nchart",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PieChart(
                    dataMap: dataMap,
                    ringStrokeWidth: 25,
                    chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValuesOutside: true,
                        showChartValuesInPercentage: true),
                    legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.bottom,
                        showLegendsInRow: true),
                    centerWidget: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: PieChart(
                        dataMap: dataMap1,
                        ringStrokeWidth: 25,
                        legendOptions: const LegendOptions(showLegends: false),
                        chartType: ChartType.disc,
                        baseChartColor: Colors.grey[300]!,
                        colorList: colorList1,
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                      ),
                    ),
                    chartType: ChartType.ring,
                    baseChartColor: Colors.grey[300]!,
                    colorList: colorList,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
