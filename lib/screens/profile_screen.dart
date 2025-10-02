import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 70,
              backgroundColor: Color(0xFF7165D6),
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: FaIcon(
                  FontAwesomeIcons.user,
                  size: 50,
                  color: Color(0xFF7165D6),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "John Doe",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "johndoe@example.com",
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileItem(
              icon: FontAwesomeIcons.userPen,
              title: "Edit Profile",
              onTap: () {},
            ),
            _buildProfileItem(
              icon: FontAwesomeIcons.bell,
              title: "Notifications",
              onTap: () {},
            ),
            _buildProfileItem(
              icon: FontAwesomeIcons.shield,
              title: "Security",
              onTap: () {},
            ),
            _buildProfileItem(
              icon: FontAwesomeIcons.circleQuestion,
              title: "Help Center",
              onTap: () {},
            ),
            _buildProfileItem(
              icon: FontAwesomeIcons.rightFromBracket,
              title: "Logout",
              onTap: () {},
              showDivider: false,
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
    bool isDestructive = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDestructive
                  ? Colors.red.withOpacity(0.1)
                  : const Color(0xFF7165D6).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FaIcon(
              icon,
              color: isDestructive ? Colors.red : const Color(0xFF7165D6),
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              color: isDestructive ? Colors.red : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: onTap,
        ),
        if (showDivider)
          const Divider(
            height: 0,
            indent: 70,
          ),
      ],
    );
  }
}
