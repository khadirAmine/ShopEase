import '../../data/remote/api_remote.dart';
import '../constants/variables.dart';
import 'select_favorite_data.dart';

Future addFavoriteData(
    int userId, itemId, Map<String, dynamic> itemData, var controller) async {
  try {
    favoriteItemData.add(itemData);
    favoriteIndex = favoriteItemData.length;
    controller.update();
    await ApiRemote.addFavorite(userId, itemId);
    await selectFavoriteData(userId);
  } catch (e) {
    null;
  }
}
