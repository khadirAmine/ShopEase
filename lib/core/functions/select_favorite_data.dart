import '../../data/remote/api_remote.dart';
import '../constants/variables.dart';

Future selectFavoriteData(int userId) async {
  favoriteItemId = [];
  favoriteData = await ApiRemote.selectFavorite(userId);
  // ignore: avoid_function_literals_in_foreach_calls
  favoriteData.forEach((element) {
    favoriteItemId.add(element["favorite_item_id"]);
  });
}
