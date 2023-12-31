//
//  ContentView.swift
//  IJAS APP
//
//  Created by Amritha Praveen on 9/2/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @Binding var presentSideMenu: Bool

    
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
                    .padding(3)
                    
                }
                
                HStack{
                    Text("The Illinois Junior Academy of Science exists for the benefit of students in the state of Illinois, by guiding them and hosting several science fairs throughout Illinois, which culminate with the State Exposition. The process students follow when participating gives them insights into the problems faced by scientists and methodologies scientists use. It encourages students to find information concerning new investigations and discoveries in science. It allows students to get experience with scientific equipment, while also allowing them to develop their own investigation beyond the classroom and progress towards a career in STEM")
                }

            }
            .padding(.horizontal, 24)
//            .opacity(isLoggedIn ? 1 : 0)
//
   
//            .opacity(isUserLoggingIn ? 1 : 0)

            
        }
//        .onAppear {
//            isLoggedIn = Auth.auth().currentUser != nil
        }
    }
    
    

        
//        do {
//            try Auth.auth().createUser(withEmail: email, password: password)
//            self.isUserLoggingIn = false
//            self.isLoggedIn = true
//        } catch {
//            print(error)
//        }
    





struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presentSideMenu: .constant(true))
    }
}



