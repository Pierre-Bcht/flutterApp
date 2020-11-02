import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './details.dart';
import 'package:flutterapp/repository/repository.dart';
import 'repository/repository.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: MyHomePage(title: "",),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyLoginPage())
            );
          },
          child: Icon(Icons.power_settings_new),
          backgroundColor: Colors.red,
        ),

        body: Stack (

          children: [
            Container(
              color: Colors.black,



              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container( //Container 1 - TITRE
                    margin: const EdgeInsets.only(left: 10.0, top: 40.0),
                    child: Text(
                      "Popular Movies",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white)

                    ),
                  ),
                  Container( //Container 1 - LISTE
                    margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                    height: 180.0,
                    child: Expanded(

                      child: FutureBuilder(
                        future: RepoTMDB.getPopularMovies(),
                        builder: (BuildContext context, AsyncSnapshot snapchot){
                          if(snapchot.data == null){
                            return Container(
                              child: Center(
                                child: Text("Loading...", style: TextStyle(color: Colors.white),),
                              ),
                            );
                          }else {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapchot.data.length,
                                itemBuilder: (BuildContext context, int index) => GestureDetector(
                                        onTap: () => Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => new DetailsPage(
                                                  title:snapchot.data[index].title,
                                                  picture:snapchot.data[index].picture,
                                                  summary:snapchot.data[index].summary,
                                                  date:snapchot.data[index].date,

                                            )
                                          )
                                        ),
                                          child : Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: ClipRRect( borderRadius: BorderRadius.circular(5),
                                                child : Image(
                                                  image: NetworkImage(
                                                      "https://image.tmdb.org/t/p/w500/"+snapchot.data[index].picture
                                                  ),
                                                ),
                                              ),
                                          )
                                )
                            );
                          }
                        },
                      ),
                    ),
                  ),


                  Container( //Container 2 - TITRE
                    margin: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                        "Popular TV Shows",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white)
                    ),
                  ),
                  Container( //Container 2 - LISTE
                    height: 180.0,
                    margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Expanded(

                      child: FutureBuilder(
                        future: RepoTMDB.getPopularTVShows(),
                        builder: (BuildContext context, AsyncSnapshot snapchot){
                          if(snapchot.data == null){
                            return Container(
                              child: Center(
                                child: Text("Loading...", style: TextStyle(color: Colors.white),),
                              ),
                            );
                          }else {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapchot.data.length,
                                itemBuilder: (BuildContext context, int index) => GestureDetector(
                                    onTap: () => Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => new DetailsPage(
                                      title:snapchot.data[index].title,
                                      picture:snapchot.data[index].picture,
                                      summary:snapchot.data[index].summary,
                                      date:snapchot.data[index].date,

                                    )
                                    )
                                    ),
                                    child : Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ClipRRect( borderRadius: BorderRadius.circular(5),
                                        child : Image(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w500/"+snapchot.data[index].picture
                                          ),
                                        ),
                                      ),
                                    )
                                )
                            );
                          }
                        },
                      ),
                    ),
                  ),



                  Container(  //Container 3 - TITRE
                    margin: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Text(
                        "Best Movies",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white)
                    ),
                  ),
                  Container( //Container 3 - LISTE
                    height: 180.0,
                    margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Expanded(

                      child: FutureBuilder(

                        future: RepoTMDB.getBestMovies(),
                        builder: (BuildContext context, AsyncSnapshot snapchot){
                          if(snapchot.data == null){
                            return Container(
                              child: Center(
                                child: Text("Loading...", style: TextStyle(color: Colors.white),),
                              ),
                            );
                          }else {
                            return ListView.builder(

                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapchot.data.length,
                                itemBuilder: (BuildContext context, int index) => GestureDetector(
                                    onTap: () => Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => new DetailsPage(
                                      title:snapchot.data[index].title,
                                      picture:snapchot.data[index].picture,
                                      summary:snapchot.data[index].summary,
                                      date:snapchot.data[index].date,

                                    )
                                    )
                                    ),
                                    child : Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ClipRRect( borderRadius: BorderRadius.circular(5),
                                        child : Image(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w500/"+snapchot.data[index].picture
                                          ),
                                        ),
                                      ),
                                    )

                                )

                            );
                          }
                        },
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
            fit: StackFit.expand

        )
    );

  }


}




