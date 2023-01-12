// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilltest/presentation/controller/datacontroller.dart';
import 'package:skilltest/presentation/discription.dart';
import 'package:skilltest/presentation/widget/customtext.dart';

class SearchBar extends StatefulWidget {
  final List search;

  const SearchBar({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchState();
}

class _SearchState extends State<SearchBar> {
  DataController controller = Get.find();

  // List controller.movielist = [];
  // String data = "";
  // int data = 0;
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    controller.movielist.addAll(widget.search);
    debugPrint("length => ${controller.movielist.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const CustomText(
                text: "Search", color: Colors.blue, size: true),
            backgroundColor: Colors.transparent),
        backgroundColor: Colors.black,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            height: 50,
            color: Colors.white,
            child: TextField(
                controller: search,
                onChanged: (value) {
                  controller.data.value = value;
                  debugPrint("val   ===>   ${controller.data.value}");
                  // controller.movielist.clear();
                  // widget.search.map((e) {
                  //   if(value.isEmpty) {
                  //     controller.movielist.add(e);
                  //   } else if(e['title'].toString().toLowerCase().startsWith(value.toLowerCase())) {
                  //     controller.movielist.add(e);
                  //   } else {
                  //     controller.movielist.clear();
                  //   }
                  // });
                  // debugPrint("val  1   ===>   ${controller.movielist.length}");
                },
                decoration:
                    const InputDecoration(suffixIcon: Icon(Icons.search))),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: SingleChildScrollView(
              child: ListView.builder(
                  itemCount: controller.movielist.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      if (controller.data.value.isEmpty) {
                        debugPrint("data if   ===>");
                        return InkWell(
                          child: SizedBox(
                              width: 160,
                              child: Row(
                                children: [
                                  Container(
                                      height: 144,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500" +
                                                      controller.movielist[
                                                      index][
                                                      'poster_path'])))),
                                  CustomText(
                                    text: controller.movielist[index]
                                    ['title'] ?? "loading",
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Description(
                                    description: controller.movielist[index]
                                    ['overview'],
                                    name: controller.movielist[index]
                                    ['title'],
                                    bannerurl:
                                    "https://image.tmdb.org/t/p/w500" +
                                        controller.movielist[index]
                                        ['backdrop_path'],
                                    posturl:
                                    "https://image.tmdb.org/t/p/w500" +
                                        controller.movielist[index]
                                        ['poster_path'],
                                    vote: controller.movielist[index]
                                    ['vote_average']
                                        .toString(),
                                    launchon: controller.movielist[index]
                                    ['release_date']);
                              },
                            ));
                          },
                        );
                      } else if (controller.movielist[index]['title']
                          .toString()
                          .toLowerCase()
                          .startsWith(
                          controller.data.value.toLowerCase())) {
                        debugPrint(
                            "data else if   ===> ${controller.movielist[index]['title']} => ${controller.movielist[index]['title'].runtimeType} => ${controller.data.value}");
                        return InkWell(
                          child: SizedBox(
                              width: 160,
                              child: Row(
                                children: [
                                  Container(
                                      height: 144,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500" +
                                                      controller.movielist[
                                                      index][
                                                      'poster_path'])))),
                                  CustomText(
                                    text: controller.movielist[index]
                                    ['title'] ?? "loading",
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Description(
                                    description: controller.movielist[index]
                                    ['overview'],
                                    name: controller.movielist[index]
                                    ['title'],
                                    bannerurl:
                                    "https://image.tmdb.org/t/p/w500" +
                                        controller.movielist[index]
                                        ['backdrop_path'],
                                    posturl:
                                    "https://image.tmdb.org/t/p/w500" +
                                        controller.movielist[index]
                                        ['poster_path'],
                                    vote: controller.movielist[index]
                                    ['vote_average']
                                        .toString(),
                                    launchon: controller.movielist[index]
                                    ['release_date']);
                              },
                            ));
                          },
                        );
                      } else {
                        debugPrint("data else   ===>");
                        return const SizedBox();
                      }
                    });
                // return Container(height: 100, width: 100, color: Colors.amber, margin: const EdgeInsets.all(10),);
              }),
            ),
          ),
          // ListView.builder(
          //   itemCount: controller.movielist.length,
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return Obx(() {
          //       if (controller.data.value.isEmpty) {
          //         debugPrint("data if   ===>");
          //         return InkWell(
          //           child: SizedBox(
          //               width: 160,
          //               child: Column(
          //                 children: [
          //                   Container(
          //                       height: 144,
          //                       decoration: BoxDecoration(
          //                           borderRadius:
          //                           BorderRadius.circular(20),
          //                           image: DecorationImage(
          //                               image: NetworkImage(
          //                                   "https://image.tmdb.org/t/p/w500" +
          //                                       controller.movielist[
          //                                       index][
          //                                       'poster_path'])))),
          //                   Expanded(
          //                     child: CustomText(
          //                       text: controller.movielist[index]
          //                       ['title'] ?? "loading",
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                 ],
          //               )),
          //           onTap: () {
          //             Navigator.push(context, MaterialPageRoute(
          //               builder: (context) {
          //                 return Description(
          //                     description: controller.movielist[index]
          //                     ['overview'],
          //                     name: controller.movielist[index]
          //                     ['title'],
          //                     bannerurl:
          //                     "https://image.tmdb.org/t/p/w500" +
          //                         controller.movielist[index]
          //                         ['backdrop_path'],
          //                     posturl:
          //                     "https://image.tmdb.org/t/p/w500" +
          //                         controller.movielist[index]
          //                         ['poster_path'],
          //                     vote: controller.movielist[index]
          //                     ['vote_average']
          //                         .toString(),
          //                     launchon: controller.movielist[index]
          //                     ['release_date']);
          //               },
          //             ));
          //           },
          //         );
          //       } else if (controller.movielist[index]['title']
          //           .toString()
          //           .toLowerCase()
          //           .startsWith(
          //           controller.data.value.toLowerCase())) {
          //         debugPrint(
          //             "data else if   ===> ${controller.movielist[index]['title']} => ${controller.movielist[index]['title'].runtimeType} => ${controller.data.value}");
          //         return InkWell(
          //           child: SizedBox(
          //               width: 160,
          //               child: Column(
          //                 children: [
          //                   Container(
          //                       height: 144,
          //                       decoration: BoxDecoration(
          //                           borderRadius:
          //                           BorderRadius.circular(20),
          //                           image: DecorationImage(
          //                               image: NetworkImage(
          //                                   "https://image.tmdb.org/t/p/w500" +
          //                                       controller.movielist[
          //                                       index][
          //                                       'poster_path'])))),
          //                   Expanded(
          //                     child: CustomText(
          //                       text: controller.movielist[index]
          //                       ['title'] ?? "loading",
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                 ],
          //               )),
          //           onTap: () {
          //             Navigator.push(context, MaterialPageRoute(
          //               builder: (context) {
          //                 return Description(
          //                     description: controller.movielist[index]
          //                     ['overview'],
          //                     name: controller.movielist[index]
          //                     ['title'],
          //                     bannerurl:
          //                     "https://image.tmdb.org/t/p/w500" +
          //                         controller.movielist[index]
          //                         ['backdrop_path'],
          //                     posturl:
          //                     "https://image.tmdb.org/t/p/w500" +
          //                         controller.movielist[index]
          //                         ['poster_path'],
          //                     vote: controller.movielist[index]
          //                     ['vote_average']
          //                         .toString(),
          //                     launchon: controller.movielist[index]
          //                     ['release_date']);
          //               },
          //             ));
          //           },
          //         );
          //       } else {
          //         debugPrint("data else   ===>");
          //         return const SizedBox();
          //       }
          //     });
          //   },
          // )
        ]));
  }
}
