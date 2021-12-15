import 'package:abc_food_app/business/services/firestore_user.dart';
import 'package:abc_food_app/business/services/local_storage_user.dart';
import 'package:abc_food_app/models/user_model.dart';
import 'package:abc_food_app/presentation/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  String? email, password, name;

  final Rxn<User>? _user = Rxn<User>();

  String? get user => _user?.value?.email;

  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _user!.bindStream(_auth.authStateChanges());
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        saveUser(value);
      });
      Get.offAll(ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar('failed to login...', errorMessage,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        FirestoreUser().getUserFromFirestore(user.user!.uid).then((doc) {
          saveUserLocal(
              UserModel.fromJson(doc.data() as Map<dynamic, dynamic>));
        });
      });
      Get.offAll(ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar('failed to login...', errorMessage,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
    } catch (error) {
      print(error);
    }
  }

  void saveUser(UserCredential userCredential) {
    UserModel _userModel = UserModel(
      userId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: name == null ? userCredential.user!.displayName! : name!,
      pic: userCredential.user!.photoURL == null
          ? 'default'
          : userCredential.user!.photoURL! + "?width=400",
    );
    FirestoreUser().addUserToFirestore(_userModel);
    saveUserLocal(_userModel);
  }

  void saveUserLocal(UserModel userModel) async {
    LocalStorageUser.setUserData(userModel);
  }
}
