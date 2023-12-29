//
//  ResourcesView.swift
//  IJAS
//
//  Created by Amritha Praveen on 9/3/23.
//

import Foundation
import SwiftUI
import MapKit
import AVKit
struct VideosView: View {
//    @Binding var presentSideMenu: Bool
    
    var body:some View{
        
        VStack{
            HStack{
                List{
                    VideoPlayer(player: AVPlayer(url:  URL(string: "https://drive.google.com/file/d/1_i-IFGENhmGWwCwKtoQ9uk_SRz9V9fWo/view")!))
                        .frame(height: 300)
                    VStack {
                        Text("Purpose")
                            .foregroundStyle(.black)
                            .background(.white.opacity(0.7))
                        Spacer()
                    }
                    .frame(width: 400, height: 300)
                }
            }
            
        } .padding(.horizontal, 24)

    }
    
}

