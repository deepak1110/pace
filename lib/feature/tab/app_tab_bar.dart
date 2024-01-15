import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pace_pro/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:pace_pro/feature/location/presentation/location_view.dart';
import 'package:pace_pro/feature/photo/presentation/photo_image.dart';
import 'package:pace_pro/utls/color_constants.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({super.key});

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with TickerProviderStateMixin {
  TabController? _tabController;

  Tab _tab(String text, bool isSelected) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? ColorConstants.primaryColor
                : ColorConstants.tabBkColor,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppTabBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _tabController?.addListener(() {
      setState(() {});
    });
    super.didChangeDependencies();
  }

  Widget appBar() {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.1412446893.1704844800&semt=ais",
          ),
          radius: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Invest",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.bgColor,
        title: appBar(),
        actions: [
          SvgPicture.asset(
            "assets/svg/gift.svg",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            "assets/svg/notification.svg",
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorConstants.tabBkColor,
            ),
            indicatorPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            labelColor: ColorConstants.primaryColor,
            padding: EdgeInsets.zero,
            tabs: [
              _tab("Dashboard", _tabController?.index == 0),
              _tab("Location", _tabController?.index == 1),
              _tab("Gallery", _tabController?.index == 2),
            ],
            controller: _tabController,
            tabAlignment: TabAlignment.start,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                // Content for the 'Home' tab
                Dashboard(),

                // Content for the 'Search' tab
                LocationView(),

                // Content for the 'Profile' tab
                PhotoImage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
