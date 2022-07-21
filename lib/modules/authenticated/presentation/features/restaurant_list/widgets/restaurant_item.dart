import 'package:flutter/material.dart';
import 'package:resto_app/modules/authenticated/data/models/restaurant_model.dart';

import '../../restaurant_detail/restaurant_detail.dart';

class RestaurantItem extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantItem({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 4,
      hoverColor: Colors.orange,
      splashColor: Colors.red,
      focusColor: Colors.yellow,
      highlightColor: Colors.grey,
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetail.routeName,
            arguments: restaurant);
      },
      // focusColor: Colors.amber,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    restaurant.pictureId,
                    width: 120,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(3, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.grey[200]),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            restaurant.city,
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow[900],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            restaurant.rating.toString(),
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
