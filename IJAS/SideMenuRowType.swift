enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case ijas
    case announcement
    case resources
//    case login
    
    var title: String{
        switch self {
        case .home:
            return "About"
        case .ijas:
            return "IJAS 2024"
        case .announcement:
            return "Announcements"
        case .resources:
            return "Resources"
//        case .login:
//            return "Login"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "ijaslogo"
        case .ijas:
            return "ijaslogo"
        case .announcement:
            return "announcement"
        case .resources:
            return "resources"
//        case .login:
//            return "resources"
        }
    }
}
