//
//  ContentView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
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
    }
    

}


