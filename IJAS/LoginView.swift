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
                Text("Login").font(.title)
                
            }
            Spacer()
    
        }
        .padding(.horizontal, 24)

            
        }
    }


