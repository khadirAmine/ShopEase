import '../../data/remote/api_remote.dart';
import '../constants/variables.dart';

Future addOrder(int itemId) async {
  await ApiRemote.insertOrder(userData[0]['user_id'], itemId);
}
