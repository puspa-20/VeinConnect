import 'package:blood_donation/donorlist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List to track the selected state of each button
  List<bool> _selectedBloodTypes = List.generate(8, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 110, 101),
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Are you looking for blood?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter location',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Don't know about your blood type?",
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0), fontSize: 19),
            ),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3, // 3 buttons per row
              crossAxisSpacing: 8, // Space between columns
              mainAxisSpacing: 8, // Space between rows
              shrinkWrap: true,
              children: List.generate(8, (index) {
                final bloodTypes = [
                  'A+',
                  'A-',
                  'B+',
                  'B-',
                  'AB+',
                  'AB-',
                  'O+',
                  'O-'
                ];
                return _buildBloodTypeButton(
                  bloodTypes[index],
                  isSelected: _selectedBloodTypes[index],
                  onPressed: () {
                    setState(() {
                      // Toggle the selection state of the button
                      _selectedBloodTypes = List.generate(8, (i) => i == index);
                    });
                  },
                );
              }),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  'Donate Now',
                  Icons.bloodtype,
                  Colors.red,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DonorListPage()),
                    );
                  },
                ),
                _buildActionButton(
                  'Campaign',
                  Icons.campaign,
                  Colors.red,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DonorListPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodTypeButton(String type,
      {required bool isSelected, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black, // Text color
        backgroundColor:
            isSelected ? Colors.red : Colors.grey[200], // Background color
        minimumSize: Size(50, 50), // Smaller size for the button
        padding: EdgeInsets.zero, // Remove extra padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
      ),
      child: Text(
        type,
        style: TextStyle(fontSize: 14), // Smaller text size
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}
