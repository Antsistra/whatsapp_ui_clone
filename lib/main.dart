import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

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
              FakeStatus(faker: faker),
              FakeCall(faker: faker),
            ],
          ),
        ),
      ),
    );
  }
}

class FakeStatus extends StatelessWidget {
  final Faker faker;
  FakeStatus({required this.faker});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 23,
              backgroundImage:
                  NetworkImage("https://picsum.photos/id/$index/200/300"),
            ),
          ),
          title: Text(faker.person.name()),
          subtitle: Text("Tap to view status"),
          trailing: Text(faker.date.justTime()),
        );
      },
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
