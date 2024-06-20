import 'package:flutter/material.dart';
import 'user_page.dart';
import 'user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data User')),
      backgroundColor:
          Color.fromARGB(255, 2, 192, 186), // Ubah warna background di sini
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    title: Text('${user.name.first} ${user.name.last}'),
                    subtitle: Text(user.location.country ?? ''),
                    trailing: const Icon(Icons.chevron_right_outlined),
                    onTap: () => openPage(context, user),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: Color.fromARGB(66, 10, 228, 50));
                },
                itemCount: snapshot.data!.length,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  void openPage(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPage(user: user)),
    );
  }
}
