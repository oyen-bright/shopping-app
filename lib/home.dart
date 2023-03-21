// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/cubit/hidebottomnav_cubit.dart';
import 'package:shopping_app/extentions/theme_extention.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController scrollcontroller;
  @override
  void initState() {
    scrollcontroller = ScrollController();
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.userScrollDirection ==
          ScrollDirection.forward) {
        context.read<HidebottomnavCubit>().showBottomNav(false);
      } else {
        context.read<HidebottomnavCubit>().showBottomNav(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Scrollbar(
            controller: scrollcontroller,
            child: ListView(
              controller: scrollcontroller,
              children: [
                const Header(),
                10.height,
                const Banner(),
                25.height,
                const Deals(),
                30.height,
                SpecialForYou(
                  data: specialProduct,
                ),
                30.height,
                Products(
                  title: "Popular Products",
                  products: popularProduct,
                ),
                25.height,
                Products(
                  title: "Electronics",
                  products: popularProduct2,
                ),
                25.height,
              ],
            ),
          )),
    );
  }
}

List<String> popularProduct = [
  "assets/images/PS5-Controller-PNG-Image.png",
  "assets/images/pngwing.com (7).png",
  "assets/images/pngwing.com (6).png",
];

List<String> popularProduct2 = [
  "assets/images/pngwing.com (10).png",
  "assets/images/pngwing.com (12).png",
  "assets/images/pngwing.com (11).png",
];
List<Map> specialProduct = [
  {"image": "assets/images/pngwing.com (8).png", "title": "Smartphones"},
  {"image": "assets/images/pngwing.com (9).png", "title": "Makeups"}
];

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.products,
    required this.title,
  });
  final List<String> products;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text("more")
              ],
            ),
          ),
          15.height,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 140,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(products[index])),
                        color: const Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.circular(20)),
                    width: 150,
                    height: 10,
                    padding: const EdgeInsets.all(15),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SpecialForYou extends StatelessWidget {
  const SpecialForYou({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special for you",
                  style: context.theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text("more")
              ],
            ),
          ),
          15.height,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            opacity: 1,
                            alignment: Alignment.bottomCenter,
                            image: AssetImage(data[index]["image"])),
                        color: const Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.circular(20)),
                    width: 240,
                    height: 60,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        // SizedBox(
                        //     width: double.infinity,
                        //     child: Text(
                        //       "Product 1",
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.bold),
                        //     )),
                        // SizedBox(
                        //     width: double.infinity, child: Text("18 Brands")),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Deals extends StatelessWidget {
  const Deals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            final data = [
              {"icon": FontAwesomeIcons.bolt, "title": "Flash Deal"},
              {"icon": FontAwesomeIcons.receipt, "title": "Bill"},
              {"icon": FontAwesomeIcons.gamepad, "title": "Game"},
              {"icon": FontAwesomeIcons.gift, "title": "Daily Gift"},
              {"icon": FontAwesomeIcons.list, "title": "More"}
            ];
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: FaIcon(
                    data[index]["icon"] as IconData,
                    color: Colors.white,
                  ),
                ),
                10.height,
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: SizedBox(
                        child: Text(
                          data[index]["title"].toString(),
                          style: context.theme.textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          })),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "A summer suprice",
            style: context.theme.textTheme.bodySmall!
                .copyWith(color: Colors.white),
          ),
          2.height,
          Text(
            "Cashback 20%",
            style: context.theme.textTheme.titleLarge!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 243, 243),
                  borderRadius: BorderRadius.circular(10)),
              height: 56,
              child: Row(
                children: [
                  const Icon(Icons.search),
                  5.width,
                  const Expanded(child: Text("Search product"))
                ],
              ),
            ),
          ),
          5.width,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 243),
                borderRadius: BorderRadius.circular(100)),
            height: 56,
            width: 56,
            child: const Icon(Icons.shopping_cart_outlined),
          ),
          5.width,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 243),
                borderRadius: BorderRadius.circular(100)),
            height: 56,
            width: 56,
            child: const Badge(
                label: Text("3"), child: Icon(Icons.notifications_outlined)),
          )
        ],
      ),
    );
  }
}
