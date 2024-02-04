import SwiftUI

struct AwardsListView: View {
    @State private var searchQuery: String = ""

    @StateObject private var viewModel = AwardViewModel()

    var filteredAwards: [Award] {
        if searchQuery.isEmpty {
            return viewModel.awards
        } else {
            return viewModel.awards.filter { award in
                award.AwardName.localizedCaseInsensitiveContains(searchQuery) ||
                award.Name.localizedCaseInsensitiveContains(searchQuery) ||
                award.Division.localizedCaseInsensitiveContains(searchQuery) ||
                award.Region.localizedCaseInsensitiveContains(searchQuery) ||
                award.School.localizedCaseInsensitiveContains(searchQuery) ||
                award.Category.localizedCaseInsensitiveContains(searchQuery)

            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Search awards", text: $searchQuery)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                List(filteredAwards) { award in
                    NavigationLink(destination: AwardDetailView(award: award)) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(award.AwardName)
                                .font(.headline)
                            Text(award.Category)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationBarTitle("Awards", displayMode: .inline)
                .onAppear {
                    viewModel.listentoRealtimeDatabase()
                }
                .onDisappear {
                    viewModel.stopListening()
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .accentColor(.green)
    }

    struct AwardDetailView: View {
        var award: Award
        
        var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("Award Name: \(award.AwardName)")
                        .font(.headline)
                        .foregroundColor(.green)
                    
                    Text("Category: \(award.Category)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Division: \(award.Division)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Region: \(award.Region)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("School: \(award.School)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
        
    }
}

