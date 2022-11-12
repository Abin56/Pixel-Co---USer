import 'package:hive/hive.dart';
part 'database_hive.g.dart';

@HiveType(typeId: 1)
class DBUserFavourites {
  @HiveField(0)
  final String productname;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String id;

  DBUserFavourites({
    required this.productname,
    required this.image,
    required this.price,
    required this.id,
  });
}
