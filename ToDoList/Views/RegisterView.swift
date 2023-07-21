//
//  RegisterView.swift
//  ToDoList
//
//  Created by Anonymous on 21/07/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start Organizing To Do",
                       angle: -15,
                       background: .purple)
            Form {
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green){
                    // Attempt Registration
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
