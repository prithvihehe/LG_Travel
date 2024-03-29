import 'package:dartssh2/dartssh2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/components/connection_flag.dart';
import 'package:food/models/category_models.dart';
import 'package:food/models/places.dart';
import 'package:food/pages/config_page.dart';
import 'package:food/cities/constants.dart';
import 'package:food/monuments/constants.dart';
import 'package:food/services/lg_connection.dart';
import 'package:flutter/material.dart';
import 'package:food/services/ssh.dart';
import 'package:logger/logger.dart';
import 'package:food/models/places.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() {
    return DashboardPageState();
  }
}

bool connectionStatus = false;

class DashboardPageState extends State<DashboardPage> {
  late SSH ssh;
  var logger = Logger();
  List<CategoryModel> categories = [];
  List<PlaceModel> places = [];

  bool loaded = false;
  bool loadedData = false;
  String date = '';

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    places = PlaceModel.getPlaces();
  }

  @override
  void initState() {
    super.initState();
    ssh = SSH();
    _connectToLG();
  }

  Future<void> _connectToLG() async {
    bool? result = await ssh.connectToLG();
    setState(() {
      connectionStatus = result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    _connectToLG();
    // initState();
    // checkConnectionStatus();

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar(context),
        body: ListView(
          children: [
            const SizedBox(height: 20),
            _popularBreakfasts(),
            const SizedBox(height: 20),
            _popularMonuments()
          ],
        ));
  }

  Column _popularMonuments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Popular Monuments in ",
              style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 200,
          // decoration: const BoxDecoration(color: Colors.amber),
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    width: 50,
                  ),
              itemCount: places.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: places[index].boxColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 65,
                              height: 65,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(places[index].iconPath)),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Text(places[index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 0, 0, 1))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              String page = places[index].name;
                              switch (page) {
                                case 'Taj Mahal':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TajMahalPage()),
                                  );
                                  break;

                                case 'Colosseum':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ColosseumPage()),
                                  );
                                  break;

                                case 'The Great Pyramid':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PyramidPage()),
                                  );
                                  break;

                                case 'The Great Wall of China':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChinaPage()),
                                  );
                                  break;

                                case 'Christ the Redeemer':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const RioPage()),
                                  );
                                  break;

                                case 'Petra':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PetraPage()),
                                  );
                                  break;

                                case 'Chichen Itza':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChichenPage()),
                                  );
                                  break;

                                case 'Machu Picchu':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const PeruPage()),
                                  );
                                  break;

                                default:
                                  break;
                              }
                            },
                            child: Container(
                              height: 25,
                              width: 80,
                              // color: Colors.green,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Text("Let's Go",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                            ),
                          ),
                        ]));
              }),
        )
      ],
    );
  }

  Column _popularBreakfasts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Popular Breakfasts in ",
              style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 200,
          // decoration: const BoxDecoration(color: Colors.amber),
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    width: 35,
                  ),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 65,
                              height: 65,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  SvgPicture.asset(categories[index].iconPath)),
                          Text(categories[index].name,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 0, 0, 1))),
                          GestureDetector(
                            onTap: () async {
                              String page = categories[index].name;
                              switch (page) {
                                case 'Delhi':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DelhiPage()),
                                  );
                                  break;

                                case 'Paris':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ParisPage()),
                                  );
                                  break;

                                case 'London':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LondonPage()),
                                  );
                                  break;

                                case 'Madrid':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MadridPage()),
                                  );
                                  break;

                                case 'Mumbai':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MumbaiPage()),
                                  );
                                  break;

                                case 'Berlin':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BerlinPage()),
                                  );
                                  break;

                                case 'Rome':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const RomePage()),
                                  );
                                  break;

                                case 'Barcelona':
                                  SSH ssh =
                                      SSH(); //Re-initialization of the SSH instance to avoid errors for beginners
                                  await ssh.connectToLG();
                                  SSHSession? execResult =
                                      await ssh.execute(page);
                                  if (execResult != null) {
                                    print('Command executed successfully');
                                  } else {
                                    print('Failed to execute command');
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BarcelonaPage()),
                                  );
                                  break;

                                default:
                                  break;
                              }
                            },
                            child: Container(
                              height: 25,
                              width: 80,
                              // color: Colors.green,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: Text("Let's Go",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                            ),
                          ),
                        ]));
              }),
        )
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
      ),
      title: const Row(children: [
        SizedBox(width: 15),
        Text(
          'Welcome traveller',
          style: TextStyle(color: Colors.white),
        ),
      ]),
      actions: [
        const SizedBox(width: 15),
        IconButton(
            iconSize: 35,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage()));
            },
            icon: const Icon(Icons.settings)),
        // IconButton(
        //     iconSize: 35,
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => const AboutPage()));
        //     },
        //     icon: const Icon(Icons.info))
      ],
    );
  }
}
