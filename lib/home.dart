import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/extentions/theme_extention.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: ListView(
            children: [
              const Header(),
              10.height,
              const Banner(),
              25.height,
              const Deals(),
              30.height,
              const SpecialForYou(),
              30.height,
              const Products(),
              25.height,
              const Products(),
              25.height,
              const SpecialForYou(),
            ],
          )),
    );
  }
}

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

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
                  "Popular Products",
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
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    width: 150,
                    height: 10,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [],
                    ),
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
    super.key,
  });

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
                itemCount: 2,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    width: 240,
                    height: 60,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                            width: double.infinity, child: Text("Product 1")),
                        SizedBox(
                            width: double.infinity, child: Text("18 Brands")),
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
                  color: Colors.white38,
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
                color: Colors.white38,
                borderRadius: BorderRadius.circular(100)),
            height: 56,
            width: 56,
            child: const Icon(Icons.shopping_cart_outlined),
          ),
          5.width,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white38,
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
