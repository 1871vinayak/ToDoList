//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Anonymous on 21/07/23.
//

import FirebaseFirestore
import Foundation

/// ViewModel for list of items view
/// Primary Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete To-Do List Item
    /// - Parameter id: Item Id To Be Deleted
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
