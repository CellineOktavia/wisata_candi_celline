import 'package:flutter/material.dart';
import 'package:wisata_candi_celline/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // 1. Deklarasi variabel
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO: 5. Implementasi fungsi signIn
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  // TODO: 6. Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // 2. ProfileHeader (Foto Profil)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 130,
                  ), // Mengatur posisi avatar melayang di batas ungu
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'images/placeholder_image.png',
                            ),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 3. ProfileInfo (Info Pengguna)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                        // Baris Pengguna / Username
                        ProfileInfoItem(
                          icon: Icons.lock,
                          label: 'Pengguna',
                          value: userName,
                          iconColor: Colors.amber,
                        ),

                        // SizedBox, Divider, SizedBox
                        ProfileInfoItem(
                          icon: Icons.person,
                          label: 'Nama',
                          value: fullName,
                          showEditIcon: isSignedIn,
                          onEditPressed: () => debugPrint('Icon edit ditekan'),
                          iconColor: Colors.blue,
                        ),

                        // SizedBox, Divider, SizedBox
                        ProfileInfoItem(
                          icon: Icons.favorite,
                          label: 'Favorit',
                          value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                          iconColor: Colors.red,
                        ),

                const SizedBox(height: 24),

                // TODO: 4. Buat ProfileActions (tombol sign in/out)
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 20),
                isSignedIn
                    ? TextButton(
                        onPressed: signOut,
                        child: const Text(
                          'Sign Out', 
                          style: TextStyle(color: Colors.red)),
                      )
                    : TextButton(
                        onPressed: signIn,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.green)),
                      ),
              ],
            ),
          ),
        ],
      ),
          ),
      ]),
    );
  }
}
