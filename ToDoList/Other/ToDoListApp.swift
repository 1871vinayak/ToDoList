//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Anonymous on 21/07/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
