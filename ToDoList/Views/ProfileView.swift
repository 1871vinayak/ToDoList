//
//  ProfileView.swift
//  ToDoList
//
//  Created by Anonymous on 21/07/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Avatar
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile.....")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.crop.square.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.purple)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info: Name, Email, Member Since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        // Sign Out
               Button("Log Out"){
                   viewModel.logOut()
               }
               .tint(.red)
               .padding()
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
