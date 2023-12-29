import SwiftUI
import MapKit

struct StudentView: View {
    
    @Binding var presentSideMenu: Bool
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 39.842_464,longitude: -88.974_295),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        NavigationView{
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
                Text ("Students").font(.title)

                HStack{
                    NavigationLink(destination: VideosView())
                    {
                        Image(systemName: "book.circle")
                            .foregroundColor(.green)
                            .imageScale(.large)
                        IJASButton(label:"How to Videos", buttonColor: .green)
                            .foregroundColor(.gray)
                            .font(.headline)
                        
                    }
                    
                }
                HStack{
                    NavigationLink(destination: ResourcesView())
                    {
                        Image(systemName: "book.circle")
                            .foregroundColor(.green)
                            .imageScale(.large)
                        IJASButton(label:"   Resources   ", buttonColor: .green)
                            .foregroundColor(.gray)
                            .font(.headline)
                        
                    }
                }
                    HStack{
                        NavigationLink(destination: ContestView())
                        {
                            Image(systemName: "book.circle")
                                .foregroundColor(.green)
                                .imageScale(.large)
                            IJASButton(label:"     Contest     ", buttonColor: .green)
                                .foregroundColor(.green)
                               
                                .font(.headline)
                            
                        }
                    }
                HStack{
                    NavigationLink(destination: NoteView())
                    {
                        Image(systemName: "book.circle")
                            .foregroundColor(.green)
                            .imageScale(.large)
                        IJASButton(label:" Student Notes",buttonColor: .green)
                            .foregroundColor(.green)
                            .font(.headline)
                        
                    }
                }
                    Spacer()
                }
                .padding(.horizontal, 24)
                Spacer()
            }
            
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


