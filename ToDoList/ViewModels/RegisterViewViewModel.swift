//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Anonymous on 21/07/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    //@Published var errorMessage = ""
    
    init() {}

    func register() {
        guard validate() else {
            return
        }
        // Try Login
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error  in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }

    private func insertUserRecord(id: String)
    {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
