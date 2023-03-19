import 'package:flutter/material.dart';
import 'package:shopping_app/extentions/theme_extention.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          const Header(),
          const Banner(),
          10.height,
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  5,
                  (index) => Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10)),
                      )),
            ),
          )
        ],
      )),
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
