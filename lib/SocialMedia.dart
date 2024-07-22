import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Social Media'),
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 214, 212, 219),
          child: IconButton(
            icon: const Icon(Icons.person_outline_sharp,
                size: 35, color: Color.fromARGB(255, 101, 95, 95)),
            onPressed: () {},
          ),
        ),
        backgroundColor: Color.fromARGB(255, 117, 76, 229),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_sharp,
                color: Color.fromARGB(255, 236, 232, 232)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person,
                color: Color.fromARGB(255, 231, 227, 227)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          Center(
            child: ListView(
              children: [
                Posts(name: "Danyal Shakeel"),
                const SizedBox(
                  height: 20,
                ),
                Posts(name: "Awais Ali"),
                const SizedBox(
                  height: 20,
                ),
                Posts(name: "Ali"),
                const SizedBox(
                  height: 20,
                ),
                Posts(name: "Sikandar"),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: const EdgeInsets.all(10),
            children: List.generate(
              18,
              (index) => Posts(name: "Search Side"),
            ),
          ),
          Column(
            children: [
              Card(
                child: Container(
                  color: Colors.blueGrey,
                  height: 400,
                  width: 340,
                ),
              ),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: List.generate(
                    10,
                    (index) => Profile(
                      setting: "Name of setting ",
                      subtitle: "Subtitle",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.deepPurple[900],
        onTap: _onItemTapped,
      ),
    );
  }
}

class Posts extends StatelessWidget {
  Posts({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20), // Spacing for aesthetics

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 50,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 212, 219),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.person_outline_sharp,
                        size: 24.0,
                        color: Color.fromARGB(255, 51, 47, 47),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert,
                  color: Color.fromARGB(255, 234, 231, 231)),
              onPressed: () {},
            ),
          ],
        ),

        const SizedBox(height: 10), // Additional spacing

        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center text
            children: [
              Text(
                "Captions",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    // return Container(
    //   height: 200,
    //   width: 200,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: Center(
    //     child: Text(
    //       text,
    //       style: const TextStyle(
    //         color: Colors.white,
    //         fontSize: 30,
    //         fontWeight: FontWeight.bold,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    // );
  }
}

class Profile extends StatelessWidget {
  Profile({super.key, required this.setting, required this.subtitle});
  String setting;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.deepPurple[900]!, Colors.deepPurple[300]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 214, 212, 219),
              child: IconButton(
                icon: const Icon(Icons.person_outline_sharp,
                    size: 25, color: Color.fromARGB(255, 101, 95, 95)),
                onPressed: () {},
              ),
            ),
            title: Text(
              setting,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
