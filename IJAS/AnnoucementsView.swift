import SwiftUI
import MapKit

struct AnnouncementsView: View {
    
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
//                WebView(url: URL(string: "https://sites.google.com/ijas.org/ijas/about/announcements")!)
                Text ("Announcements").font(.largeTitle)
                
            }
            Spacer()
        
        }
        .padding(.horizontal, 24)

            
        }
    }


