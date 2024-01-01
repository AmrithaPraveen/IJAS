import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack{
            
            TabView(selection: $selectedSideMenuTab) {
                AboutTestView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                HomeView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                NewsletterTestView(presentSideMenu: $presentSideMenu)
                    .tag(2)
                StudentTestView(presentSideMenu: $presentSideMenu)
                    .tag(3)
                NewsletterTestView(presentSideMenu: $presentSideMenu)
                    .tag(4)
                LoginView(presentSideMenu: $presentSideMenu)
                    .tag(5)
//                StudentBoardView(presentSideMenu: $presentSideMenu)
//                    .tag(6)
//                StudentBoardView(presentSideMenu: $presentSideMenu)
//                    .tag(7)
                
//                ProjectView(presentSideMenu: $presentSideMenu)
//                    .tag(5)
//                LoginContentView()
//                    .tag(4)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
           // .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))

            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}
