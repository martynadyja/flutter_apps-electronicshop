import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController controller;

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException(
            "Wystąpił błąd podczas konwersji koloru.");
      }
    }
    return val;
  }

  @override
  void initState(
      ){
    super.initState();
    controller = new TabController(
        length: 4,
        vsync: this);
  }

  @override
  void dispose(
      ){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        width: double.infinity,
                        color: Color(getColorHexFromStr(
                            '#CD48FD'
                        )),
                      ),
                      Positioned(
                          bottom: 50.0,
                          right: 100.0,
                          child: Container(
                            height: 400.0,
                            width: 400.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    300.0
                                ),
                                color: Color(
                                    getColorHexFromStr(
                                        '#B767F5'
                                    )
                                )
                            ),
                          )),
                      Positioned(
                          bottom: 100.0,
                          left: 150.0,
                          child: Container(
                            height: 300.0,
                            width: 300.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    300
                                ),
                                color: Color(
                                    getColorHexFromStr(
                                        '#B767F5'
                                    )
                                ).withOpacity(
                                    0.5
                                )
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              height: 15.0
                          ),
                          Row(
                              children: <Widget>[
                                SizedBox(
                                    width: 15.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          25.0
                                      ),
                                      border: Border.all(
                                          color: Colors.blueAccent,
                                          style: BorderStyle.solid,
                                          width: 2.0
                                      ),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/avatar.jpeg'
                                          )
                                      )
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width - 120.0,
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  child: IconButton(
                                    icon: Icon(
                                        Icons.menu
                                    ),
                                    onPressed: () {},
                                    color: Colors.blueAccent,
                                    iconSize: 30.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                )
                              ]
                          ),
                          SizedBox(
                              height: 50.0
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0
                            ),
                            child: Text(
                              'Witaj, Lagoon',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 15.0
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0
                            ),
                            child: Text(
                              'Co chciałbyś kupić?',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),),
                          SizedBox(
                              height: 25.0
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0
                              ),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(
                                    5.0
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                          Icons.search,
                                          color: Color(
                                            getColorHexFromStr(
                                                '#CD48FD'
                                            ),
                                          ),
                                          size: 30.0
                                      ),
                                      contentPadding: EdgeInsets.only(
                                          left: 15.0,
                                          top: 15.0
                                      ),
                                      hintText: 'Szukaj',
                                      hintStyle: TextStyle(
                                          color: Colors.blueGrey,
                                          fontFamily: 'Raleway'
                                      )
                                  ),
                                ),)
                          ),
                          SizedBox(
                              height: 10.0
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                      height: 10.0
                  ),
                  Stack(
                    children: <Widget>[
                      SizedBox(
                          height: 10.0
                      ),
                      Material(
                        elevation: 1.0,
                        child: Container(
                            height: 75.0,
                            color: Colors.white70
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 75.0,
                            width: MediaQuery
                                .of(
                                context
                            )
                                .size
                                .width / 4,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/computer.png'
                                          )
                                      )
                                  ),
                                ),
                                Text(
                                  'Stacjonarki',
                                  style: TextStyle(
                                      fontFamily: 'Raleway'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 75.0,
                            width: MediaQuery
                                .of(
                                context
                            )
                                .size
                                .width / 4,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/laptop.png'
                                          )
                                      )
                                  ),
                                ),
                                Text(
                                  'Laptopy',
                                  style: TextStyle(
                                      fontFamily: 'Raleway'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 75.0,
                            width: MediaQuery
                                .of(
                                context)
                                .size
                                .width / 4,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/tablet.png'
                                          )
                                      )
                                  ),
                                ),
                                Text(
                                  'Tablety',
                                  style: TextStyle(
                                      fontFamily: 'Raleway'
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 75.0,
                            width: MediaQuery
                                .of(
                                context)
                                .size
                                .width / 4,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/smartfon.png'
                                          )
                                      )
                                  ),
                                ),
                                Text(
                                  'Smartfony',
                                  style: TextStyle(
                                      fontFamily: 'Raleway'
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  itemCard(
                      'G4M3R HERO i5',
                      'assets/computer2.png',
                      true
                  ),
                  itemCard2(
                      'SLV MNK KABEL',
                      'assets/usb.png',
                      true
                  ),
                  itemCard3(
                      'PS4 PLAYER10X',
                      'assets/PS4 Player.png',
                      true
                  )
                ],
              )
            ]
        ),
      bottomNavigationBar: Material(
        color: Colors.black,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.orange,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.add_to_home_screen,
                color: Colors.orangeAccent
              ),
            ),
            Tab(
              icon: Icon(
              Icons.timer,
                color: Colors.blueGrey
            )),
            Tab(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blueGrey
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person_outline,
                color: Colors.blueGrey
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemCard(String title,
      String imgPath,
      bool isFavorite) {
    return Padding(
      padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15.0
      ),
      child: Container(
        height: 205.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          imgPath
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                        width: 35.0
                    ),
                    Material(
                      elevation: isFavorite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(
                          20.0
                      ),
                      child: Container(
                        height: 40.0,
                        width: 33.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20.0
                            ),
                            color: isFavorite ? Colors.blueGrey.withOpacity(
                                0.2
                            )
                                : Colors.white
                        ),
                        child: Center(
                            child: isFavorite ?
                            Icon(
                                Icons.favorite_border
                            )
                                : Icon(
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            )
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 5.0
                ),
                Container(
                  width: 200.0,
                  child: Text(
                    'Komputery G4M3R HERO zaprojektowaliśmy tak, by rozgrywka była płynna przy wysokich detalach. Wybraliśmy komponenty, które najlepiej do siebie pasują, dzięki czemu zachowują niskie temperatury i cichą pracę.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'Raleway',
                        fontSize: 12.0
                    ),
                  ),
                ),
                SizedBox(
                    height: 5.0
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: 35.0
                    ),
                    Container(
                      height: 40.0,
                      width: 80.0,
                      color: Color(
                          getColorHexFromStr(
                              '#CD48FD')),
                      child: Center(
                        child: Text(
                          '6500,00 zł',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 100.0,
                      color: Color(
                          getColorHexFromStr(
                              '#B767F5'
                          )
                      ),
                      child: Center(
                        child: Text(
                          'Dodaj do koszyka',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),);
  }

  Widget itemCard2(String title,
      String imgPath,
      bool isFavorite) {
    return Padding(
      padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15.0
      ),
      child: Container(
        height: 205.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          imgPath
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                        width: 35.0
                    ),
                    Material(
                      elevation: isFavorite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(
                          20.0
                      ),
                      child: Container(
                        height: 40.0,
                        width: 33.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20.0
                            ),
                            color: isFavorite ? Colors.blueGrey.withOpacity(
                                0.2
                            )
                                : Colors.white
                        ),
                        child: Center(
                            child: isFavorite ?
                            Icon(
                                Icons.favorite_border
                            )
                                : Icon(
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            )
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 5.0
                ),
                Container(
                  width: 200.0,
                  child: Text(
                    'Wsparcie standardu DisplayPort 1.4 oznacza prawdziwe 8K. Imponujące realizmem i mnogością detali oraz perfekcyjnie odwzorowaną rzeczywistością. Dzięki pozłacanym końcówkom wtyków transmisja jest wolna od jakichkolwiek szumów.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'Raleway',
                        fontSize: 12.0
                    ),
                  ),
                ),
                SizedBox(
                    height: 5.0
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: 35.0
                    ),
                    Container(
                      height: 40.0,
                      width: 80.0,
                      color: Color(
                          getColorHexFromStr(
                              '#CD48FD')),
                      child: Center(
                        child: Text(
                          '49,00 zł',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 100.0,
                      color: Color(
                          getColorHexFromStr(
                              '#B767F5'
                          )
                      ),
                      child: Center(
                        child: Text(
                          'Dodaj do koszyka',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),);
  }
  Widget itemCard3(String title,
      String imgPath,
      bool isFavorite) {
    return Padding(
      padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15.0
      ),
      child: Container(
        height: 205.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          imgPath
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                        width: 35.0
                    ),
                    Material(
                      elevation: isFavorite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(
                          20.0
                      ),
                      child: Container(
                        height: 40.0,
                        width: 33.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20.0
                            ),
                            color: isFavorite ? Colors.blueGrey.withOpacity(
                                0.2
                            )
                                : Colors.white
                        ),
                        child: Center(
                            child: isFavorite ?
                            Icon(
                                Icons.favorite_border
                            )
                                : Icon(
                              Icons.favorite,
                              color: Colors.pinkAccent,
                            )
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 5.0
                ),
                Container(
                  width: 200.0,
                  child: Text(
                    'Brak napędu sprawia, że konsola jest w pełni cyfrowa, a dysk SSD NVMe o pojemności 512 GB i architekturze Xbox Velocity nie tylko pomieści Twoje ulubione gry, ale również błyskawicznie je wczyta.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'Raleway',
                        fontSize: 12.0
                    ),
                  ),
                ),
                SizedBox(
                    height: 5.0
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                        width: 35.0
                    ),
                    Container(
                      height: 40.0,
                      width: 80.0,
                      color: Color(
                          getColorHexFromStr(
                              '#CD48FD')),
                      child: Center(
                        child: Text(
                          '1485,00 zł',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 100.0,
                      color: Color(
                          getColorHexFromStr(
                              '#B767F5'
                          )
                      ),
                      child: Center(
                        child: Text(
                          'Dodaj do koszyka',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),);
  }
}
