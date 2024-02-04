import SwiftUI
import MapKit

struct HomeView: View {
    
    @Binding var presentSideMenu: Bool
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 39.842_464,longitude: -88.974_295),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
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
                
                Spacer()
                HStack{
                    
                    VStack{
                        Text("IJAS STATE EXPOSITION 2024").font(.headline)
                        Text("May 3rd and 4th").font(.subheadline)
                        Text("Millikin University").font(.subheadline)
                        Text("1184 W Main St, Decatur, IL 62522").font(.subheadline)
                    }
                }
                HStack{
                    Map(coordinateRegion: $region)
                        .edgesIgnoringSafeArea(.all).frame(width:300, height:200)
                }
                Spacer()
                HStack{
                    NavigationLink(destination: ProjectListView())
                    {
                        
                        IJASButton(label:"Project Directory",buttonColor: .green)
                        
                        
                    }
                    
                }
                HStack{
                    NavigationLink(destination: ScheduleView())
                    {
                        
                        IJASButton(label:"     Schedule       ",buttonColor: .green)
                        
                    }
                }
                HStack{
                    NavigationLink(destination: AwardsView())
                    {
                        
                        IJASButton(label:"      Awards        ",buttonColor: .green)
                        
                        
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            Spacer()
        }
        
    }



struct IJASButton:View{
    let label: String
    let buttonColor: Color
    
    var body: some View{
        Text(label)
            .foregroundColor(.white)
            .padding(.vertical,15)
            .padding(.horizontal, 40)
            .background(buttonColor)
            .cornerRadius(10)
            .frame(width:280,height:80)
    }
    
}
