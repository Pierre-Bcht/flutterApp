
import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';



class DetailsPage extends StatefulWidget {

  final String title;
  final String picture;
  final String summary;
  final String date;


  DetailsPage({this.title, this.picture, this.summary, this.date});

  @override
  DetailsPageState createState() => new DetailsPageState(
      title:this.title,
      picture:this.picture,
      summary:this.summary,
      date:this.date,
  );


}

class DetailsPageState extends State<DetailsPage> {
  final String title;
  final String picture;
  final String summary;
  final String date;


  DetailsPageState({this.title, this.picture, this.summary, this.date});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage())
            );
          },
        ),
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 10.0,

      ),

      //Corps de l'appli avec le STACK pour empiler les widgets
      body: Stack(
        children:[
          Image.network(
              "https://image.tmdb.org/t/p/w500/"+picture),

          //COntainer noir avec flou
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.45,0.6],
                    colors: [Colors.black, Colors.transparent]
                )
            ),


            //Début colonne information
            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container( //Container 1 TITRE

                    margin: const EdgeInsets.only(top: 350.0, left : 10.0),
                    //color: Colors.orange,
                    child: Text(
                      title??"titledefault" ,
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Container( //Container 2 AGE + DATE + NOTE
                    margin: const EdgeInsets.only(left: 10.0),

                    //color: Colors.blue,
                    child: Row(
                      children: [
                        Container(


                          //color: Colors.orange,
                          child: Text(
                              "11+    -",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white)
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          //color: Colors.blue,
                          child: Text(
                              date??"test",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white)
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 10.0),

                          //color: Colors.purple,
                          child: Row(
                            children: <Widget>[
                              Text(" "),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.0,),
                              Text(" 27.6",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.yellow))
                            ],
                          ),

                        ),
                      ],

                    ),
                  ),

                  Container( //Container 3 avec BOUTONS
                    //color: Colors.purple,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),

                          //color: Colors.orange,
                          child: RaisedButton(
                            onPressed: () {},
                            child: const Text('Crime', style: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          //color: Colors.blue,
                          child: RaisedButton(
                            onPressed: () {},
                            child: const Text('Drama', style: TextStyle(fontSize: 15)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),

                          //color: Colors.purple,
                          child: RaisedButton(
                            onPressed: () {},
                            child: const Text('Mystery', style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container( //Container 4 CAST
                      margin: const EdgeInsets.only(left: 10.0, top: 20.0),

                      //color: Colors.blue,
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: ' Cast : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,)),
                            TextSpan(text: 'Pierre Boucharlat, Luca Sardellitti, Ihssane Belhout',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                  color: Colors.white,)),
                          ],
                        ),
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                        "Summary : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                      summary??"testSUmmary",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,)),
                  ),




                ],
              ),
            ),
          )
        ],


        fit: StackFit.expand,
      ),

    );
  }
}
