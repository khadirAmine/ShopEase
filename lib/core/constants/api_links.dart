String serverIp = '192.168.0.121';
// String serverIp = '192.168.1.106';
// String serverIp = '192.168.1.105';
// String serverIp = '192.168.1.113';
// String serverIp = '192.168.137.1';

String serverName = 'http://$serverIp/buyingBackend/app';

String itemsImageRoot = 'http://$serverIp/buyingBackend/files/items';

String usersImagesRoot = 'http://$serverIp/buyingBackend/files/users';

String checkEmailExistsLink = '$serverName/auth/checkEmailExists.php';

String signUpLink = '$serverName/auth/signup/signupFunction.php';

String sendEmailLink = '$serverName/functions/sendEmail.php';

String selectCodeVirificationLink =
    '$serverName/auth/selectCodeVirification.php';

String changeCodeVirifiyAndValideLink =
    '$serverName/auth/changeCodeVirifiy.php';

String changeCodeVirification = '$serverName/auth/changeCodeVirifiy.php';

String changePasswordLink = '$serverName/auth/changePassword.php';

String selectUserDataLink = '$serverName/users/selectUserData.php';

String selectAllDataLink = '$serverName/functions/selectAllData.php';

String selectPasswordLink = '$serverName/auth/selectPassword.php';

String selectValidationLink = '$serverName/auth/selectValidation.php';

String selectByLink = '$serverName/functions/selectBy.php';

String searchItemLink = '$serverName/items/searchItem.php';

String selectItemDataLink = '$serverName/items/selectItemData.php';

String selectItemCategorieLink =
    '$serverName/catigories/selectItemCategorie.php';

String addFavoriteLink = '$serverName/favorite/addFavorite.php';

String selectFavoriteDataLink = '$serverName/favorite/selectFavoriteData.php';

String deletFavoriteLink = '$serverName/favorite/deletFavorite.php';

String selectFavoriteItemLink = '$serverName/items/selectItemFavorite.php';

String searchFavoriteLink = '$serverName/favorite/searchFavorite.php';

String insertUserImageLink = '$serverName/users/insertUserImage.php';

String deletUserProfileImageLink = '$serverName/functions/deletUsesrImage.php';

String deleteUserProfileImageLink =
    '$serverName/users/deleteUserProfileImage.php';

String insertOrderLink = '$serverName/cart/insertOrder.php';

String selectOrderDatalink = '$serverName/cart/selectOrders.php';

String selectOrderCountLink = '$serverName/cart/selectOrderCount.php';

String deleteOrderLink = '$serverName/cart/deleteOrder.php';

String deletAllOrdersLink = '$serverName/cart/deleteAllOrders.php';

String insertCommentLink = '$serverName/users/insertComment.php';
