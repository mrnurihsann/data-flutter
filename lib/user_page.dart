import 'package:flutter/material.dart';
import 'user_service.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${user.name.first} ${user.name.last}')),
      backgroundColor:
          Color.fromARGB(255, 0, 110, 220), // Ubah warna background di sini
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            if (user.location.city != null)
              Text(
                user.location.city!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            if (user.location.city == null)
              Text(
                'City not available',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 30),
            if (user.location.country != null) Text(user.location.country!),
            if (user.location.country == null) Text('Country not available'),
          ],
        ),
      ),
    );
  }
}
