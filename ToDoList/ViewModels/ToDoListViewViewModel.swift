//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Anonymous on 21/07/23.
//

import Foundation

/// ViewModel for list of items view
/// Primary Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init() {}
    
    
    func delete(id: String) {
        
    }
}
