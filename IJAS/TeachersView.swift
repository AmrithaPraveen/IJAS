
//  ResourcesView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/3/23.
//

import Foundation
import SwiftUI
import MapKit

struct TeachersView: View {
    

    var body: some View {
        VStack{

            HStack{
                WebView(url: URL(string: "https://sites.google.com/ijas.org/ijas/teachersdonors/teacherssponsors?authuser=0s")!)
                
            }
    
        }
        .padding(.horizontal, 24)
        .navigationBarTitle("Teachers", displayMode: .inline)
            
        }
    }



