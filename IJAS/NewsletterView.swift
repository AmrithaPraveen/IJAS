import SwiftUI
import MapKit

struct NewsletterView: View {
    
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
               WebView(url: URL(string: "https://sites.google.com/ijas.org/ijas/students/newsletters?authuser=0")!)
//                Text ("Announcements").font(.largeTitle)
                //This is just test
                
            }
            Spacer()
        
        }
        .padding(.horizontal, 24)

            
        }
    }



