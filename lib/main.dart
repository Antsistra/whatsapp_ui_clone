import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Clone',
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 43, 88, 46),
            title: const Text(
              'Whatsapp Clone',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'STATUS',
                ),
                Tab(
                  text: 'CALLS',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const Center(
                child: Text('Camera'),
              ),
              FakeChat(faker: faker),
              ListStatus(),
              FakeCall(faker: faker),
            ],
          ),
        ),
      ),
    );
  }
}

class ListStatus extends StatelessWidget {
  final List<Map<String, dynamic>> Status = [
    {
      'id': 1,
      'link': 'https://picsum.photos/id/1/200/300',
    },
    {
      'id': 2,
      'link': 'https://picsum.photos/id/2/200/300',
    },
    {
      'id': 3,
      'link': 'https://picsum.photos/id/3/200/300',
    },
    {
      'id': 4,
      'link': 'https://picsum.photos/id/4/200/300',
    },
    {
      'id': 5,
      'link': 'https://picsum.photos/id/5/200/300',
    },
    {
      'id': 6,
      'link': 'https://picsum.photos/id/5/200/300',
    },
    {
      'id': 7,
      'link': 'https://picsum.photos/id/5/200/300',
    },
    {
      'id': 8,
      'link': 'https://picsum.photos/id/5/200/300',
    },
    {
      'id': 9,
      'link': 'https://picsum.photos/id/5/200/300',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Status",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          margin: EdgeInsets.fromLTRB(14, 12, 12, 4),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Status.map((data) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey, // Set the border color
                        width: 3, // Set the border width
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                        data['link'],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Saluran",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Jelajahi  >",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                    fontSize: 14),
              )
            ],
          ),
        ),
        Expanded(
          // Use Expanded to allow ListView to take up remaining space
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/id/$index/200/300",
                  ),
                ),
                title: Text(faker.person.name()),
                subtitle: Text(faker.lorem.sentence()),
                trailing: Text(faker.date.justTime()),
              );
            },
          ),
        )
      ],
    );
  }
}

class FakeChat extends StatelessWidget {
  final Faker faker;

  FakeChat({required this.faker});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("https://picsum.photos/id/$index/200/300"),
          ),
          title: Text(faker.person.name()),
          subtitle: Text(faker.lorem.sentence()),
          trailing: Text(faker.date.justTime()),
        );
      },
    );
  }
}

class FakeCall extends StatelessWidget {
  final Faker faker;
  FakeCall({required this.faker});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        8,
        (index) => ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("https://picsum.photos/id/$index/200/300"),
          ),
          title: Text(faker.animal.name()),
          subtitle: Text("Today, " + faker.date.justTime()),
          trailing: Icon(Icons.call),
        ),
      ),
    );
  }
}
