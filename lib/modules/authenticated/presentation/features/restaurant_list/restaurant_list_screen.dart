import 'package:flutter/material.dart';
import 'package:resto_app/modules/authenticated/data/models/restaurant_model.dart';
import 'package:resto_app/modules/authenticated/presentation/features/restaurant_list/widgets/restaurant_item.dart';

class RestaurantListScreen extends StatelessWidget {
  static const routeName = "resto-list";
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              elevation: 0,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                      child: Image.network(
                    'https://a.cdn-hotels.com/gdcs/production141/d778/6b200721-9661-4680-aca2-d6e33ce46cf0.jpg',
                    fit: BoxFit.cover,
                  )),
                  Container(
                    color: Colors.black54,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.0, bottom: 8.0),
                          child: Text(
                            'Restaurants',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ];
        },
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/dummy_data/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Sorry, Failed to load data"),
              );
            } else {
              final List<RestaurantModel> restaurants =
                  parseRestaurants(snapshot.data.toString());
              return SafeArea(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return RestaurantItem(restaurant: restaurants[index]);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
