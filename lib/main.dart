
import 'package:bmn_flutter/account_center.dart';
import 'package:bmn_flutter/coin.dart';
import 'package:bmn_flutter/BookMark.dart';
import 'package:bmn_flutter/home.dart';
import 'package:bmn_flutter/widget/text_style.dart';
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
        highlightColor: const Color.fromRGBO(50, 53, 50, 1),
        useMaterial3: true,
        primaryColor: const Color.fromRGBO(208, 208, 208, 1.0),
        primaryColorLight: Colors.white,

        
      ),
      home:  const MyHomePage(title: 'BMN -beta version'),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Theme.of(context).highlightColor,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10)
          )
        ),
        title: Text(widget.title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions:  const [


           Padding(
             padding: EdgeInsets.only(top: 8.0),
             child: Column(
                  children: [
                    Row(
                      children: [
                        CoinLabelText(text: 'Paid Coin'),
                        SizedBox(width: 10,),
                        CoinText(text: '2000')
                      ],
                    ),
                    Row(
                      children: [
                        CoinLabelText(text: 'Free Coin'),
                        SizedBox(width: 10,),
                        CoinText(text: '2000')
                      ],
                    ),
                  ],
                             ),
           ),


          SizedBox(width: 10,),




          ],


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

        selectedItemColor: Theme.of(context).highlightColor,
        unselectedItemColor: Colors.black,
        backgroundColor:Colors.black

        

      ),


    );
  }
}
