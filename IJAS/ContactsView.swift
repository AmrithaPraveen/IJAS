import SwiftUI

struct SocialMediaLink: Identifiable {
    let id = UUID()
    let platform: String
    let link: String
}

struct ContactsView: View {
    let socialMediaLinks: [SocialMediaLink] = [
        SocialMediaLink(platform: "Facebook", link: "https://www.facebook.com/IJASorg"),
        SocialMediaLink(platform: "Twitter", link: "https://www.twitter.com"),
        SocialMediaLink(platform: "Instagram", link: "https://www.instagram.com/ijas_il/?hl=en"),
        SocialMediaLink(platform: "YouTube", link: "https://www.youtube.com")
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Social Media Links").font(.subheadline)) {
                    ForEach(socialMediaLinks) { link in
                        if let url = URL(string: link.link) {
                            Link(destination: url) {
                                Text(link.platform)
                            }
                        }
                    }
                }

                Section(header: Text("Student Board").font(.subheadline)) {
                    NavigationLink(destination: StudentBoardView()) {
                        Text("Student Board Contacts")
                    }

                    // Uncomment the following section if you need it
                    /*
                    NavigationLink(destination: StudentBoardChatView()) {
                        Text("Chat with a student board member")
                    }
                    */
                }
            }
            .navigationBarTitle("Contacts", displayMode: .inline)
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

