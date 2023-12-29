import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                ContentView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                HomeView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                AnnouncementsView(presentSideMenu: $presentSideMenu)
                    .tag(2)
                StudentView(presentSideMenu: $presentSideMenu)
                    .tag(3)
                NewsletterView(presentSideMenu: $presentSideMenu)
                    .tag(4)
                LoginView(presentSideMenu: $presentSideMenu)
                    .tag(5)
                
//                ProjectView(presentSideMenu: $presentSideMenu)
//                    .tag(5)
//                LoginContentView()
//                    .tag(4)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}
