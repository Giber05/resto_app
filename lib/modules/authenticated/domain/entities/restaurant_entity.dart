class RestaurantEntity {
    String id;
    String name;
    String description;
    String pictureId;
    String city;
    double rating;

    RestaurantEntity({
       required this.id,
       required this.name,
       required this.description,
       required this.pictureId,
       required this.city,
       required this.rating,
    });
}