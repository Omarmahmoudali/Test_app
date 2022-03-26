import 'package:app/widgets/category_btn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPressed = false;
  List<int>indexPressed = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/image/omar.jpg'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Feed',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ],
        ),
        actions:  [
          IconButton(
            onPressed: () { },
            icon: const Icon(Icons.add,
              color: Colors.black,
            ),

          ),

           IconButton(
             icon: const Icon(Icons.message,
               color: Colors.black,), onPressed: () { },
           ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: SingleChildScrollView(child: Column(
          children: [
           SizedBox(
             height: MediaQuery.of(context).size.height*0.04,
             child: ListView.builder(
               itemCount: 8,
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemBuilder: (_,index){
                 return  Padding(
                   padding: const EdgeInsets.only(right: 15),
                   child: CategoryBtn(text: '#trending', isPressed: (isPressed&&indexPressed.contains(index)), onPressed: (){
                     setState(() {
                       isPressed = true;
                       indexPressed.add(index);
                     });
                   }),
                 );
               },
             ),
           ),
            const SizedBox(height: 20,),
            Center(
              child: Wrap(
                runSpacing: 20,
                spacing: 15,
                children: List.generate(10, (index) => buildItem(context)),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        )),
      )
    );
  }
}


Widget buildItem(BuildContext context) => Container(
  height: MediaQuery.of(context).size.height*0.35,
  width: MediaQuery.of(context).size.width*0.45,
  decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.4),
        blurRadius: 14,
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: MediaQuery.of(context).size.height*0.22,
        width: MediaQuery.of(context).size.width*0.45,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage('assets/image/enemy.jpg'),fit: BoxFit.cover,
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Ingrid Bergman Selfie Dare accepted',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.0,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '23 min ago',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 10.0
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);