import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_celline/widgets/profile_info_item.dart';
import 'package:wisata_candi_celline/providers/favorite_provider.dart';
import 'package:wisata_candi_celline/providers/auth_provider.dart';
import 'package:wisata_candi_celline/screens/sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // 1. Deklarasi variabel state
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;
  final counter = ValueNotifier<int>(0);

  // TODO: 5. Implementasi fungsi signIn
  void _signIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  // TODO: 6. Implementasi fungsi signOut
  void signOut() {
    // ignore: invalid_use_of_protected_member
    setState(() {
      // isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil jumlah favorit secara real-time menggunakan Provider di dalam build()
    // Catatan: Sesuaikan '.favoriteList.length' atau '.count' dengan isi property di FavoriteProvider Anda
    final favoriteCount = context.watch<FavoriteProvider>().count;

    // ProfileScreen, di dalam build()
    final auth = context.watch<AuthProvider>();

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
                  padding: const EdgeInsets.only(top: 130),
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
                        if (auth.isSignedIn)
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

                      const SizedBox(height: 10),
                      Divider(color: Colors.deepPurple[100]),
                      const SizedBox(height: 10),

                      ProfileInfoItem(
                        icon: Icons.person,
                        label: 'Nama',
                        value: fullName,
                        showEditIcon: auth.isSignedIn,
                        onEditPressed: () => debugPrint('Icon edit ditekan'),
                        iconColor: Colors.blue,
                      ),

                      const SizedBox(height: 10),
                      Divider(color: Colors.deepPurple[100]),
                      const SizedBox(height: 10),

                      // Baris Favorit menggunakan data dari Provider
                      ProfileInfoItem(
                        icon: Icons.favorite,
                        label: 'Favorit',
                        value: favoriteCount > 0 ? '$favoriteCount' : '0',
                        iconColor: Colors.red,
                      ),

                      const SizedBox(height: 24),

                      // TODO: 4. Buat ProfileActions (tombol sign in/out)
                      Divider(color: Colors.deepPurple[100]),
                      const SizedBox(height: 20),
                      // ganti isSignedIn dengan auth.isSignedIn
                      auth.isSignedIn
                          ? TextButton(
                              onPressed: () =>
                                  context.read<AuthProvider>().signOut(),
                              child: const Text(
                                'Sign Out',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : TextButton(
                              onPressed: _signIn,
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
