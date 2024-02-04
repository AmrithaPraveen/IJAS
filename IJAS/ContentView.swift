import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.green)
                    Text("About")
                }
            IJAS2024View()
                .tabItem {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("IJAS 2024")
                }
            AnnouncementsView()
                .tabItem {
                    Image(systemName: "megaphone")
                        .foregroundColor(.green)
                    Text("Announcements")
                }


            StudentView()
                     .tabItem {
                         Image(systemName: "person.fill")
                             .foregroundColor(.green)
                         Text("Student")
                     }
            NewslettersView()
                            .tabItem {
                                Image(systemName: "newspaper.fill")
                                    .foregroundColor(.green)
                                Text("Newsletters")
                            }
            TeachersView()
                          .tabItem {
                              Image(systemName: "person.3.fill")
                                  .foregroundColor(.green)
                              Text("Teachers")
                          }

            ContactsView()
                .tabItem {
                    Image(systemName: "phone")
                        .foregroundColor(.green)
                    Text("Contacts")
                }
            


        }.padding(.bottom,10)
            .onAppear {
                        // Disable scroll edge appearance adaptation
                        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
                    }
    }
}
struct ChatView: View {
    var body: some View {
        Text("Chat Content Goes Here")
            .navigationBarTitle("Chat", displayMode: .inline)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

