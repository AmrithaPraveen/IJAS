//
//  StudentView.swift
//  IJAS
//
//  Created by Amritha Praveen on 1/1/24.
//

import SwiftUI
struct StudentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Helpful Resources").font(.subheadline).foregroundColor(.primary)) {
                        LinkCard(destination: VideosView(), imageName: "video.fill", label: "How-To Videos")
                    

                        LinkCard(destination: ContestView(), imageName: "trophy.fill", label: "Contests")
                    

                        LinkCard(destination: HelpSessionView(), imageName: "lightbulb.fill", label: "Help Sessions")
                    
                }

                Section(header: Text( "Tools").font(.subheadline).foregroundColor(.primary)) {
                        LinkCard(destination: NotesView(), imageName: "note.text", label: "Student Notes")
                    
                }

                Section(header: Text( "Documents").font(.subheadline).foregroundColor(.primary)) {
                        LinkCard(destination: PolicyManualView(), imageName: "book.fill", label: "Policy Manual")
                    

                        LinkCard(destination: EndorsementFormsView(), imageName: "doc.text.fill", label: "Endorsement Forms")
                    
                }
            }
            .listStyle(InsetGroupedListStyle()) // Apply a more modern list style
            .navigationBarTitle("Student", displayMode: .inline)
        }
    }
}


struct PolicyManualView: View {
    var body: some View {
        WebView(url: URL(string:"https://drive.google.com/drive/folders/1PQ6FKTtrmuW3uDre93ju5vr49Dklxvyb")!)
            .navigationBarTitle("Policy Manual", displayMode: .inline)    }
}

struct EndorsementFormsView: View {
    var body: some View {

        WebView(url: URL(string:"https://drive.google.com/drive/folders/0B72J70LPcSv3SUk5NWZJNDhlTEk?resourcekey=0-W8o22y3QBW2ZMBXXprvrqA")!)
            .navigationBarTitle("Endorsement Forms", displayMode: .inline)
    }
}






struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}

