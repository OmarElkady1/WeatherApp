import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MySklton extends StatelessWidget {
  const MySklton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff81b0dc),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 10,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.black.withOpacity(.1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 10,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.black.withOpacity(1),
                      baseColor: Colors.black.withOpacity(.2),
                      child: Container(
                        height: 10,
                        width: 60,
                        color: Colors.black.withOpacity(.1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff81b0dc),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 40,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Shimmer.fromColors(
                            highlightColor: Colors.black.withOpacity(1),
                            baseColor: Colors.black.withOpacity(.2),
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.black.withOpacity(.1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff81b0dc),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        highlightColor: Colors.black.withOpacity(1),
                        baseColor: Colors.black.withOpacity(.2),
                        child: Container(
                          height: 10,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Colors.black.withOpacity(.1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                        highlightColor: Colors.black.withOpacity(1),
                        baseColor: Colors.black.withOpacity(.2),
                        child: Container(
                          height: 10,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Colors.black.withOpacity(.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        //color: Colors.grey,
                        // offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff81b0dc),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 15,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 15,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Shimmer.fromColors(
                                  highlightColor: Colors.black.withOpacity(1),
                                  baseColor: Colors.black.withOpacity(.2),
                                  child: Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: Colors.black.withOpacity(.1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
