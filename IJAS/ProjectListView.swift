import Foundation
import SwiftUI

struct ProjectListView: View {
    @State private var searchQuery: String = ""

    @StateObject private var viewModel = ProjectViewModel()

    var filteredProjects: [Project] {
        if searchQuery.isEmpty {
            return viewModel.projects
        } else {
            // Filter projects based on search criteria (student name, project name, category, school name, etc.)
            return viewModel.projects.filter { project in
                project.ProjectName.localizedCaseInsensitiveContains(searchQuery) ||
                project.Category.localizedCaseInsensitiveContains(searchQuery) ||
                project.FirstStudentName.localizedCaseInsensitiveContains(searchQuery) ||
                project.SecondStudentName.localizedCaseInsensitiveContains(searchQuery) ||
                project.ThirdStudentName.localizedCaseInsensitiveContains(searchQuery) ||
                project.SchoolName.localizedCaseInsensitiveContains(searchQuery)
                // Add more criteria as needed
                // Example: project.StudentName.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    TextField("Search projects", text: $searchQuery)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                List(filteredProjects) { project in
                    NavigationLink(destination: ProjectDetail(project: project)) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(project.ProjectName)
                                .font(.headline)
                            Text(project.Category)
                                .font(.subheadline)
                                .foregroundColor(.gray)
    
                        }
                        //ProjectRow(project: project)
                    }
                }
                .navigationBarTitle( "Projects", displayMode: .inline)
                .onAppear {
                    viewModel.listentoRealtimeDatabase()
                }
                .onDisappear {
                    viewModel.stopListening()
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
    }

//    struct ProjectRow: View {
//        var project: Project
//
//        var body: some View {
//            VStack(alignment: .leading, spacing: 2) {
//
//                Text(project.Category)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                //Text("School Name: \(project.SchoolName)")
//                //    .font(.subheadline)
//                //    .foregroundColor(.gray)
//                // Add more project details as needed
//            }
//            .padding()
//            .navigationBarTitle("Projects", displayMode: .inline)
//
//        }
//    }

    struct ProjectDetail: View {
        var project: Project

        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("Project #  \(project.id)")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding(4)
                        .background(
                        RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(.green)
                        )
           
                    Text("Project Name: \(project.ProjectName)")
                        .font(.headline)
                    
                    Text("Category: \(project.Category)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("School Name: \(project.SchoolName)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("School ID: \(project.SchoolId)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Region ID: \(project.Region)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Group {
                    Text( "Student Name: \(project.FirstStudentName)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    if !project.SecondStudentName.isEmpty {
                        Text("Additional Student Name: \(project.SecondStudentName)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    if !project.ThirdStudentName.isEmpty {
                        Text("Third Student Name: \(project.ThirdStudentName)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                if !project.Score.isEmpty {
                    
                    Text("Score: \(project.Score)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                if project.SafetyCheck == "Done" {
                    HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Safety Check Done")
                                .foregroundColor(.green)
                                }
                                .font(.subheadline)
                            } else if project.SafetyCheck.isEmpty {
                                Text("Safety Check Not Done")
                                    .foregroundColor(.red)
                                    .font(.subheadline)
                            }
               
            }
            .padding()
            //.navigationBarTitle("Projects", displayMode: .inline)
        }
    }

}

