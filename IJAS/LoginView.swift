import FirebaseAuth
//
//  LoginView.swift
//  IJAS
//
//  Created by Krithik Praveen on 9/3/23.
//

//
//  ResourcesView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/3/23.
//

import Foundation
import SwiftUI
import MapKit

struct LoginView: View {
    
    @Binding var presentSideMenu: Bool
    @State var isLoggedIn: Bool = false
    @State var isUserLoggingIn: Bool = false
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
                
            }
            HStack{
                Button("Login") {
                    isUserLoggingIn = true
                }
                .opacity(isLoggedIn || isUserLoggingIn ? 0 : 1)
                
                
                VStack {
                    TextField("Email", text: $email)
                    TextField("Password (must be at least 6 characters)", text: $password)
                    
                    Button("Enter") {
                        handleLogin()
                    }
                    
                }
                .textFieldStyle(.roundedBorder)
                .padding(24)
            }
            Spacer()
            
        }
        .padding(.horizontal, 24)
        
        
    }
    
    
    private func handleLogin() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.isUserLoggingIn = false
                self.isLoggedIn = true
            } else {
                print(error)
                self.isUserLoggingIn = false
            }
        }
    }
}
