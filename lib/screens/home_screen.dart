import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'doctor_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> categories = [
    {
      "icon": FontAwesomeIcons.heartPulse,
      "title": "Heart",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "title": "Lungs",
    },
    {
      "icon": FontAwesomeIcons.tooth,
      "title": "Dental",
    },
    {
      "icon": FontAwesomeIcons.brain,
      "title": "Brain",
    },
  ];

  List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Sarah Johnson",
      "specialty": "Heart Surgeon",
      "rating": 4.9,
      "reviews": 135,
      "isAvailable": true,
    },
    {
      "name": "Dr. Michael Chen",
      "specialty": "Pulmonologist",
      "rating": 4.8,
      "reviews": 89,
      "isAvailable": true,
    },
    {
      "name": "Dr. Emily White",
      "specialty": "Dentist",
      "rating": 4.7,
      "reviews": 72,
      "isAvailable": false,
    },
    {
      "name": "Dr. James Wilson",
      "specialty": "Neurologist",
      "rating": 4.9,
      "reviews": 98,
      "isAvailable": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Find Your Doctor",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFF7165D6),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search for doctors",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: index == 0
                            ? const Color(0xFF7165D6)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: index != 0
                            ? Border.all(color: Colors.grey[300]!)
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            categories[index]["icon"],
                            color: index == 0
                                ? Colors.white
                                : const Color(0xFF7165D6),
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index]["title"],
                            style: GoogleFonts.poppins(
                              color: index == 0
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Doctors",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF7165D6),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailsScreen(
                            doctor: doctors[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7165D6).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              color: Color(0xFF7165D6),
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctors[index]["name"],
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                doctors[index]["specialty"],
                                style: GoogleFonts.poppins(
                                  color: Colors.black54,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber[400],
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    doctors[index]["rating"].toString(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "(${doctors[index]["reviews"]} Reviews)",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: doctors[index]["isAvailable"]
                                ? Colors.green[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            doctors[index]["isAvailable"]
                                ? "Available"
                                : "Unavailable",
                            style: GoogleFonts.poppins(
                              color: doctors[index]["isAvailable"]
                                  ? Colors.green[800]
                                  : Colors.red[800],
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
