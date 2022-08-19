//---- Firestore code--

//guard let userEmail = user.profile.email
//        let firstName = user.profile.givenName,
//        let lastName = user.profile.familyName
//        else {
//            return print("no email")
//        }
//  (save data when login)
//        let db = Firestore.firestore()
//
//         //searching
//        db.collection("users").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    if(document.documentID == userEmail){
//                        print("found")
//                    }
//                    else{
//                        print("not found")
//                    }
//                }
//            }
//        }
        
//        // Add a new document
//        var ref = db.collection("users").document(userEmail)
//            .setData([
//            "first name": firstName,
//            "last name": lastName,
//            "email": userEmail,
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added")
//            }
//        }
