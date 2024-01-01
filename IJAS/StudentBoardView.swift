import SwiftUI
import MapKit
import FirebaseAuth

struct StudentBoardView: View {    

    @StateObject private var viewModel = StudentViewModel()
    
    
    var body: some View {
        List(viewModel.birds) { contact in
            VStack(alignment: .leading) {
                Text("\(contact.FirstName) \(contact.LastName)")
                    .font(.headline)
                Text(contact.Position)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Email: \(contact.Email)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(2)
        }
        .navigationBarTitle("Student Board Contacts",displayMode: .inline)
        .onAppear{viewModel.listentoRealtimeDatabase()}
        .onDisappear(){
            viewModel.stopListening()
    }
}
    
  
}
    
    
    
    
    
    



