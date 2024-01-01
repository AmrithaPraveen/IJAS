//
//  ResourcesView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/3/23.
//

import Foundation
import SwiftUI
import MapKit

struct ProjectView: View {
//    @Binding var presentSideMenu: Bool
    
    var body:some View{
        VStack{
//            HStack{
//                Button{
//                    presentSideMenu.toggle()
//                } label: {
//                    Image("menu")
//                        .resizable()
//                        .frame(width: 32, height: 32)
//                }
//                Spacer()
//
//            }
 //           Text("Project Directory").font(.title)
            List{
            
                HStack{
                    
                    Text("Project 1")
                    Spacer()
                    Text("Botany")
                    Spacer()
                    Text ("Name")
                    Text ("301")
                }
            }
            
            
        } .padding(.horizontal, 24)
            .navigationBarTitle("Projects", displayMode: .inline)

    }
    
}
