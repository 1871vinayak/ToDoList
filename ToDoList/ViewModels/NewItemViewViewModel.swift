//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Anonymous on 21/07/23.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var duedate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save(){
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard duedate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
