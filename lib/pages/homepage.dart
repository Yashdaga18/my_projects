import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/coffeetile.dart';
import '../utils/coffeetype.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeTypes = [
    ['Cappucino', true],
    ['Latte', false],
    ['Milk', false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(37, 158, 158, 158),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 57,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Find your coffee..",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            // color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: ((context, index) {
                return CoffeeType(
                  coffeeType: coffeeTypes[index][0],
                  isSelected: coffeeTypes[index][1],
                  onTap: (() {
                    coffeeTypeSelected(index);
                  }),
                );
              }),
            ),
          ),
          // horizontal listview of coffee tiles

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'assets/images/cappucino.png',
                  coffeeName: 'Cappucino',
                  coffeePrice: '4.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/latte.png',
                  coffeeName: 'Latte',
                  coffeePrice: '5.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/milk.png',
                  coffeeName: 'Milk',
                  coffeePrice: '3.00',
                ),

                // CoffeeTile(),
                // CoffeeTile(),
                // CoffeeTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
