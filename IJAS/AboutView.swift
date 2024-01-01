import SwiftUI

//struct AboutView: View {
//    var body: some View {
//        VStack {
//            // Logo with Green Background
//            Image("ijaslogo")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 100, height: 100)
//                .padding()
//                .background(Color.green) // Green background for the logo
//                .cornerRadius(10) // Optional: Add corner radius for a rounded look
//
//            // Text Content
//            Text("The Illinois Junior Academy of Science exists for the benefit of students in the state of Illinois, by guiding them and hosting several science fairs throughout Illinois, which culminate with the State Exposition. The process students follow when participating gives them insights into the problems faced by scientists and methodologies scientists use. It encourages students to find information concerning new investigations and discoveries in science. It allows students to get experience with scientific equipment, while also allowing them to develop their own investigation beyond the classroom and progress towards a career in STEM.")
//                .padding()
//
//            // Theme Note with Green Text
//            Text("FROM BRAINS TO GRAINS")
//                .font(.headline)
//                .foregroundColor(.green) // Green text color for the theme
//
//            Spacer()
//        }
//        .padding()
//        .navigationBarTitle("About", displayMode: .inline)
//    }
//}
struct AboutView: View {
    var body: some View {
//        ZStack {
//            // Background Gradient
//            Image("agriculture_background")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
            VStack {
                // Logo with Green Background and Corner Radius
                Image("ijaslogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(15) // Updated corner radius
                
                // Title "IJAS" with Bold Style and Larger Font
                Text("IJAS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.bottom, 10) // Add some spacing below the title
                
                // Text Content with Improved Typography and Alignment
                Text("The Illinois Junior Academy of Science exists for the benefit of students in the state of Illinois, by guiding them and hosting several science fairs throughout Illinois, which culminate with the State Exposition. The process students follow when participating gives them insights into the problems faced by scientists and methodologies scientists use. It encourages students to find information concerning new investigations and discoveries in science. It allows students to get experience with scientific equipment, while also allowing them to develop their own investigation beyond the classroom and progress towards a career in STEM.")
                    .padding()
                    .multilineTextAlignment(.center) // Center-align the text
                
                Spacer()
            }
            .padding(20) // Consistent padding
            .navigationBarTitle("About", displayMode: .inline)
        }
    //}
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

