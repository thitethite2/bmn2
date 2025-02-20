import 'package:bmn_flutter/main_screens/account_center.dart';
import 'package:bmn_flutter/coin.dart';
import 'package:bmn_flutter/book_mark.dart';
import 'package:bmn_flutter/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bmn Beta version',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Colors.blue.shade200,
        useMaterial3: true,
        primaryColor: const Color.fromRGBO(208, 208, 208, 1.0),
        primaryColorLight: Colors.white,

        
      ),
      home:  const MyHomePage(title: 'BMN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   static List<Widget> screen = <Widget>[
     const Home(),const BookMark(),const Coin(),const AccountCenter()
  ];
  int _currentPage = 0;

   Widget coinBalanceCard() {
     return Container(
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         color: Colors.blue.shade50,
         borderRadius: BorderRadius.circular(15),
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.2),
             blurRadius: 5,
             offset: const Offset(0, 3),
           ),
         ],
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           _coinView(Icons.monetization_on, 'Paid', '2000', Colors.orange),
           _coinView(Icons.card_giftcard, 'Free', '2000', Colors.green),
         ],
       ),
     );
   }

   Widget _coinView(IconData icon, String label, String amount, Color color) {
     return Row(
       children: [
         CircleAvatar(
           backgroundColor: color.withOpacity(0.2),
           child: Icon(icon, color: color, size: 22),
         ),
         SizedBox(width: 8),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(label,
                 style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.w500,
                     color: Colors.grey[700])),
             Text(amount,
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
           ],
         ),
       ],
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.white,

        toolbarHeight: 75,

        title: Text(widget.title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,

       flexibleSpace: Padding(
         padding: const EdgeInsets.only(top:10,right: 10,left: 10),
         child: coinBalanceCard(),

       ),


      ),
      body: screen.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
          items:  const [
            BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: 'Bookmark'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance),label: 'Balance'),
            BottomNavigationBarItem(icon: Icon(Icons.account_box),label: 'Account')

          ],
        currentIndex: _currentPage,
        onTap: (index){
          setState(() {
            _currentPage = index;
          });
        },

        selectedItemColor: Colors.blue[300],
        unselectedItemColor: Colors.grey[600],



        

      ),


    );
  }
}
