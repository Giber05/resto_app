import 'package:flutter/material.dart';
import 'package:resto_app/modules/authenticated/data/models/restaurant_model.dart';

class RestaurantDetail extends StatefulWidget {
  static const routeName = 'resto-detail';

  final RestaurantModel restaurant;
  const RestaurantDetail({required this.restaurant});

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  int _selectedNavbar = 0;
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
                pinned: true,
                foregroundColor: Colors.white,
                backgroundColor: Color(0XFFFA4A0C),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          widget.restaurant.pictureId,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        color: Colors.black26,
                      )
                    ],
                  ),
                  title: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      widget.restaurant.name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                ))
          ];
        },
        body: widget.restaurant == null
            ? Center(
                child: Text("Failed to load data"),
              )
            : _selectedNavbar == 0
                ? _restaurantDescription(context, widget.restaurant)
                : _selectedNavbar == 1
                    ? _restaurantDrinks(context, widget.restaurant)
                    : _restaurantFoods(context, widget.restaurant),
      ),
      bottomNavigationBar: _botttomNavigation(),
    );
  }

  Widget _botttomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Description',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_drink),
          label: 'Drinks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'Foods',
        ),
      ],
      currentIndex: _selectedNavbar,
      selectedItemColor: Color(0XFFFA4A0C),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _changeSelectedNavBar,
    );
  }

  Widget _restaurantDrinks(BuildContext context, RestaurantModel restaurant) {
    return GridView.count(
      crossAxisCount: 2,
      children: restaurant.menus.drinks.map((drink) {
        return Container(
          child: Card(
            child: GridTile(
              child: Column(
                children: [
                  Image.network(
                    'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image-300x225.png',
                  ),
                ],
              ),
              footer: GridTileBar(
                title: Text(
                  drink.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _restaurantFoods(BuildContext context, RestaurantModel restaurant) {
    return GridView.count(
      crossAxisCount: 2,
      children: restaurant.menus.foods.map((food) {
        return Container(
          child: Card(
            child: GridTile(
              child: Column(
                children: [
                  Image.network(
                    'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image-300x225.png',
                  ),
                ],
              ),
              footer: GridTileBar(
                title: Text(
                  food.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _restaurantDescription(
      BuildContext context, RestaurantModel restaurant) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                new BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              restaurant.city,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                new BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[900],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              restaurant.rating.toString(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.restaurant)
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            new BorderRadius.all(Radius.circular(15))),
                    child: Text(restaurant.description)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
