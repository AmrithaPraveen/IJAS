import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.schedules.reduce(into: Dictionary<String, [Schedule]>()) { $0[$1.Date, default: []].append($1) }.sorted(by: { $0.key < $1.key })), id: \.key) { date, events in
                    Section(header: Text(formattedDate(date))
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .padding(.vertical, 8)
                                .foregroundColor(.primary)
                    ) {
                        ForEach(events) { schedule in
                            NavigationLink(destination: ScheduleDetail(schedule: schedule)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(schedule.Time)
                                            .font(.subheadline)
                                        Text(schedule.Name)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(schedule.Place)
                                            .font(.subheadline)
                                    }
                                    
                                }
                                }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.listentoRealtimeDatabase()
            }
            .onDisappear {
                viewModel.stopListening()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Schedule", displayMode: .inline)
            
        }
    }

    func formattedDate(_ date: String) -> String {
        guard let originalDate = dateFormatter.date(from: date) else {
            return date
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        return outputFormatter.string(from: originalDate)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}

struct Schedule: Identifiable, Codable {
    var id: String
    var Date: String
    var Time: String
    var Name: String
    var Description: String
    var Place: String
}

struct ScheduleRow: View {
    var schedule: Schedule
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                Text("Date: \((schedule.Date))")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Time: \(schedule.Time)")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Event: \(schedule.Name)")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Description: \(schedule.Description)")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("Place: \(schedule.Place)")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
        }
    }
}
struct ScheduleDetail: View {
    var schedule: Schedule

    var body: some View {
        VStack {
            Text("Schedule Detail")
                .font(.headline)
                .padding()

            ScheduleRow(schedule: schedule)
            // Add more details about the schedule as needed
        }
    }
}

