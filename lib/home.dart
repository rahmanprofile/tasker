import 'package:flutter/material.dart';
import 'package:taskfirst/items/community_page.dart';
import 'package:taskfirst/items/post_page.dart';
import 'package:taskfirst/items/stamp_page.dart';
import 'package:taskfirst/painter.dart';
import 'package:taskfirst/status.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<String> categories = ["Post", "Stamp Book", "Community"];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 320,
            left: -20,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 1.00,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
              ),
              child: CustomPaint(
                painter: OpenPainter(),
              ),
            ),
          ),
          Positioned(
            top: 50,
              right: 10,
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey[700],
                ),
                child: const Center(
                  child: Text("Following",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white)),
                ),
              )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 55),
              Center(
                child: Container(
                  height: 105,
                  width: 105,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.low,
                        image: NetworkImage(
                            "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg")),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Column(
                  children: [
                    Text("Shane Mathias",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    Text("Co Founder ♘",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    itemCount: statusItems.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: status(
                            title: statusItems[index].title,
                            imageUrl: statusItems[index].imageUrl,
                            onView: () {}),
                      );
                    }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rowData(quantity: "2", trigger: "Post"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      height: 40,
                      width: 1,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  rowData(quantity: "1", trigger: "Followers"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      height: 40,
                      width: 1,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  rowData(quantity: "2", trigger: "Following"),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: TabBar(
                  labelColor: Colors.white,
                  dividerColor: Colors.blueGrey.shade700,
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),
                  labelStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),
                  controller: _tabController,
                  tabs: categories.map((category) {
                    return Tab(text: category);
                  }).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    PagePage(),
                    StampPage(),
                    CommunityPage(),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget status({required String title, required String imageUrl, required VoidCallback onView}) {
    return InkWell(
      onTap: onView,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget rowData({required String quantity, required String trigger}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(quantity,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white)),
        Text(trigger,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: Colors.white)),
      ],
    );
  }
}
