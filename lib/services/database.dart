import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid = "0ZAa0wCsFtZdlosqlkwSfLcAO1w2";

  // collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  // Future<void> updateUserData(String sugars, String name, int strength) async {
  //   return await usersCollection.document(uid).setData({
  //     'sugars': sugars,
  //     'name': name,
  //     'strength': strength,
  //   });
  // }

  // user data from snapshots
  User? _userDataFromSnapshot(DocumentSnapshot snapshot) {
    print("a");
    print(snapshot.data());
    // return User(
    //     userId: uid,
    //     userName: snapshot['name'],
    //     userAge: snapshot.data['age'],
    //     userGender: snapshot.data['gender'],
    //     userHeight: snapshot.data['height'],
    //     userWeight: snapshot.data['weight'],
    //     userWorkingLevel: snapshot.data['working_level'],
    // );
  }

  // get user doc stream
  Stream<User?> get userData {

    return usersCollection.doc(uid).snapshots()
        .map((userSnapshot) => _userDataFromSnapshot(userSnapshot));
  }

}