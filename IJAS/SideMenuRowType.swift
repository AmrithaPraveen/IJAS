enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case ijas
    case announcement
    case student
    case newsletter
    case chat
    case login
    
    var title: String{
        switch self {
        case .home:
            return "About"
        case .ijas:
            return "IJAS 2024"
        case .announcement:
            return "Announcements"
        case .student:
            return "Student"
        case .newsletter:
            return "Newsletter"
        case .chat:
            return "Chat"
            
            
        case .login:
            return "Login"
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
        case .student:
            return "student"
        case .newsletter:
            return "newsletter"
        case .chat:
            return "chat"
        case .login:
            return "resources"
        }
    }
}
