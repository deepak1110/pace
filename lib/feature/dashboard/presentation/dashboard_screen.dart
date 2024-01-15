import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pace_pro/utls/color_constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Widget searchBar() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 10,
        right: 10,
      ),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/svg/search.svg",
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Search mutual funds",
            style: TextStyle(
              color: ColorConstants.light,
            ),
          )
        ],
      ),
    );
  }

  Widget activeMF() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 10,
        right: 10,
      ),
      margin: const EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorConstants.aquaPrimary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: ColorConstants.aquaPrimary,
            child: SvgPicture.asset(
              "assets/svg/vector.svg",
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Active mutual funds",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "complete setup & start investing",
                style: TextStyle(
                  color: ColorConstants.typographyBody,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            "assets/svg/15675_frame.svg",
            height: 30,
            width: 30,
          )
        ],
      ),
    );
  }

  Widget makeYourInvestment() {
    List<Map> items = [
      {
        "image": "assets/png/Frame_1000003834.png",
        "text": "index fund",
      },
      {
        "image": "assets/png/TAX.png",
        "text": "Tax saving mutual funds",
      },
      {
        "image": "assets/png/Liquid_Funds.png",
        "text": "Liquid mutual funds",
      },
      {
        "image": "assets/png/Direct_MF_v8.png",
        "text": "Direct mutual funds",
      },
      {
        "image": "assets/png/Balanced_Funds.png",
        "text": "Balanced mutual funds",
      },
      {
        "image": "assets/png/Frame_1000003840.png",
        "text": "See More",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Make your first investment today",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        GridView.builder(
          itemCount: items.length,
          padding: const EdgeInsets.only(top: 10),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(
                  items[index]["image"],
                ),
                Text(
                  items[index]["text"],
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            searchBar(),
            activeMF(),
            const SizedBox(
              height: 20,
            ),
            makeYourInvestment(),
          ],
        ),
      ),
    );
  }
}
