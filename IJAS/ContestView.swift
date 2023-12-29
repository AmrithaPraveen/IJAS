//
//  ResourcesView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/3/23.
//

import Foundation
import SwiftUI
import MapKit

struct ContestView: View {
    
//    @Binding var presentSideMenu: Bool

    var body: some View {
        VStack{
//            HStack{
//                Button{
//                Button{
//                    presentSideMenu.toggle()
//                } label: {
//                    Image("menu")
//                        .resizable()
//                        .frame(width: 32, height: 32)
//                }
//                Spacer()
//
//        }

            HStack{
                WebView(url: URL(string: "https://sites.google.com/ijas.org/ijas/students/contests")!)
                
            }
    
        }
        .padding(.horizontal, 24)

            
        }
    }



