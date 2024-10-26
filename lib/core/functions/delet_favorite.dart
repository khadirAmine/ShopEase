import '../../data/remote/api_remote.dart';
import '../config/constants/variables.dart';
import 'select_favorite_data.dart';

Future deletFavorite(int userId, itemId, index, var controller,
    {bool? home}) async {
  !(home ?? false) ? favoriteItemData.removeAt(index) : null;
  favoriteIndex = favoriteItemData.length;
  controller.update();
  try {
    await ApiRemote.deletFavorite(userId, itemId);
    await selectFavoriteData(userId);
    await favoriteController.selectFavoriteItemData();
  } catch (e) {
    null;
  }
}
