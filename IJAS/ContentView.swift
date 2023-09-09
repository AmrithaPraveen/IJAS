//
//  ContentView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/2/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @Binding var presentSideMenu: Bool
    @State var isLoggedIn: Bool = false
    @State var isUserLoggingIn: Bool = false
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            VStack(){
                HStack{
                    Button{
                        presentSideMenu.toggle()

                    } label:{
                        Image("menu").resizable().frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                ZStack{
                    Color.green
                    HStack{
                        Image("ijaslogo")
                        Text("IJAS").font(.largeTitle)
                        
                    }
                    .padding(10.0)
                    
                }
                
                Spacer()
                HStack{
                    Text("The Illinois Junior Academy of Science exists for the benefit of students in the state of Illinois, by guiding them and hosting several science fairs throughout Illinois, which culminate with the State Exposition. The process students follow when participating gives them insights into the problems faced by scientists and methodologies scientists use. It encourages students to find information concerning new investigations and discoveries in science. It allows students to get experience with scientific equipment, while also allowing them to develop their own investigation beyond the classroom and progress towards a career in STEM")
                }
                Spacer()
                HStack{
                    VStack{
                        Text("Save the Date: 2024 IJAS State Exposition")
                        Text("Millikin University: May 3rd and 4th")
                    }
                }
            }
            .padding(.horizontal, 24)
            .opacity(isLoggedIn ? 1 : 0)
            
            Button("Login") {
                isUserLoggingIn = true
            }
            .opacity(isLoggedIn || isUserLoggingIn ? 0 : 1)
            
            
            VStack {
                TextField("Email", text: $email)
                TextField("Pass", text: $password)
                
                Button("Log me In") {
                    handleLogin()
                }

            }
            .textFieldStyle(.roundedBorder)
            .padding(24)
            .opacity(isUserLoggingIn ? 1 : 0)

            
        }
        .onAppear {
            isLoggedIn = Auth.auth().currentUser != nil
        }
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
        
//        do {
//            try Auth.auth().createUser(withEmail: email, password: password)
//            self.isUserLoggingIn = false
//            self.isLoggedIn = true
//        } catch {
//            print(error)
//        }
    }

}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presentSideMenu: .constant(true))
    }
}


