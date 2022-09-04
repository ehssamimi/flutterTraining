import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:study/screens/Home.dart';



void main(){
  runApp(
      CustomMyApp()
  );
}

class TopText  extends StatelessWidget {
  final String title;

  TopText({ required this.title});

  @override
  Widget build(BuildContext context) {
     return Text(title);
  }
}


class CustomMyApp extends StatelessWidget{
  // const CustomMyApp({Key? key}) : super(key: key);
  const CustomMyApp({Key? key}) : super(key: key);
  static const _title="احسان";


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'Vaziri',
        scaffoldBackgroundColor: Colors.grey[100]
        // scaffoldBackgroundColor: Colors.deepOrange[100],
        // primarySwatch: Colors.orange
      ),

      debugShowCheckedModeBanner: false,
        home:Home()
    );
  }
}

class MyHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  _MyHome();
  }

}
class _MyHome  extends State with TickerProviderStateMixin{
  static const _title="احسان";
     int LikeCount=0;
  late TabController _tabController;
  late int _selectedIndex ;

  @override

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _selectedIndex = 0;
   }
   void ChangeIndexBottomNavigation( int Index){
    setState(() {
      _selectedIndex = Index;
    });
   }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading:
      Builder(builder: (context) =>IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer()
      )),


      title: TopText(
          title:_title
      ),
      actions:  [
        Builder(builder: (context) =>IconButton(
            icon: Icon(Icons.search),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Awesome Snackbar!'),
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {
                    // Code to execute.
                  },
                ),
              ),
            )
        )),
      ],
      bottom: TabBar(
        controller: _tabController,
        tabs: [
           Tab(
          text: "tab1",
          ),
          Tab(
            text: "tab2",
          )
        ],

      ),
    ),

    floatingActionButton: FloatingActionButton.extended(onPressed: (){setState(() {

      LikeCount++;
    });}, label: Text("like"),icon: Icon(Icons.thumb_up), ),
    drawer:Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            child: Text("header"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(title: Text("first Title")),
          ListTile(title: Text("second Title")),
          ListTile(title: Text("third Title")),
        ],
      ),
    ),
    // body:  Center(child: Text( this.LikeCount),),
    body:
    TabBarView(
      controller: _tabController,
      children: [
        Center(child: ElevatedButton(
          child:   Text(' تعداد لایک های شما :$LikeCount',
            style: const TextStyle(
                fontFamily: 'Vaziri',
                fontWeight:FontWeight.bold,
                fontSize: 18
            ),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Awesome Snackbar!'),
                action: SnackBarAction(
                  label:"action" ,


                  onPressed: () {
                    // Code to execute.
                  },
                ),
              ),
            );
          },

        )),
        Center(child:  Text('tab2')),
      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      onTap: ChangeIndexBottomNavigation,
      currentIndex:_selectedIndex ,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.directions_train),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.car_rental_outlined),label: "explor"),
        BottomNavigationBarItem(icon: Icon(Icons.air_outlined),label: "profile")
      ],
    ),
  );
  }


}

class MyStatelessWidget extends StatelessWidget {
  final int LikeCount;
   MyStatelessWidget({Key? key , required this.LikeCount}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:   Text(' تعداد لایک های شما :$LikeCount',
      style: const TextStyle(
        fontFamily: 'Vaziri',
        fontWeight:FontWeight.bold,
        fontSize: 18
      ),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Awesome Snackbar!'),
            action: SnackBarAction(
              label:"action" ,


              onPressed: () {
                // Code to execute.
              },
            ),
          ),
        );
      },
    );
  }
}


// void main(){
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  // TODO: implement build
  //   throw UnimplementedError();
    return MaterialApp(
      title: "MyApp",

      // home: new MyScaffeld(),
      home: new DefaultScafeld(),
        debugShowCheckedModeBanner:false

    );

  }

}

class DefaultScafeld extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title:new Text("MyApp") ,
          leading: new IconButton(onPressed:(){print("onPress Button");},tooltip: "Menu", icon: Icon(Icons.menu)),
          actions: [
            new IconButton(onPressed:(){print("click on search ");}, icon: Icon(Icons.search))
          ],

        ),
        body: new Center(
          child: new Text("this is text "),
        ),
        floatingActionButton: new FloatingActionButton(onPressed: null,tooltip: "add",child: new Icon(Icons.add),),
      );
  }

}

class MyScaffeld extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Material(
        child:  new Column(
            children:[
              new Header(title:new Text("hiiiiiiiiiiii")),
              Expanded(child: new Center(child:new Text("hiiiiiiiiiiiii")))
            ]

        ),


    );

  }
}
class Header  extends StatelessWidget{
  final Widget title;

  Header({ required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
      decoration: BoxDecoration(color:Colors.blue[500]),
      child:new Row(
        children: [
          new IconButton(onPressed:(){print("onPress Button");}, icon: Icon(Icons.menu)),
          new Expanded(child: title),
          new IconButton(onPressed:(){print("click on search ");}, icon: Icon(Icons.search))
        ],
      )
    );
   }

}
