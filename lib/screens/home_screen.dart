import 'package:flutter/material.dart';
import 'package:myapp/services/home_service.dart';
var city = "karachi";

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt = TextEditingController();

  var city_name = "";

  citytext() {
    setState(() {
      city = city_name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp)),
          title: TextField(
              controller: txt,
              onChanged: (value) {
                city_name = value;
              }),
          actions: [
            IconButton(
                onPressed: () {
                  citytext();
                  txt.clear();
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: FutureBuilder(
            future: getuser(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Text("NO data"),
                );
              } else {
                return Container(
                    child: Stack(children: [
                  Image.asset(
                    "assets/pic.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black38),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text(snapshot.data.name,
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text("${snapshot.data.timezone}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Text(
                                "${(snapshot.data.main.temp - 32) * 5 / 9}\u2103",
                                style: TextStyle(
                                    fontSize: 55,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white)),
                            Row(
                              children: [
                                Text("Night",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Wind Speed",
                                    style:  TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                Text("${snapshot.data.wind.speed}",
                                    style:  TextStyle(
                                        fontSize: 13, color: Colors.white))
                              ],
                            ),
                            Column(
                              children: [
                                Text("Pressure",
                                    style: TextStyle(
                                        fontSize: 18,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text("${snapshot.data.main.pressure}",
                                    style:  TextStyle(
                                        fontSize: 13, color: Colors.white))
                              ],
                            ),
                            Column(
                              children: [
                                Text("Humidity",
                                    style:  TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                Text("${snapshot.data.main.humidity}",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]));
              }
            }));
  }
}