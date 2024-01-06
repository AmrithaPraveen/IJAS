import SwiftUI

struct NotesView: View {
    @State private var notes: [String] = []
    @State private var newNote: String = ""
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notes, id: \.self) { note in
                        Text(note)
                    }
                    .onDelete(perform: deleteNote)
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Notes",displayMode: .inline)
                .navigationBarItems(trailing: EditButton())

                HStack {
                    TextField("New Note", text: $newNote)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button("Save", action: saveNote)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .onAppear {
                loadNotes()
            }
        }
    }

    func saveNote() {
        guard !newNote.isEmpty else { return }
        notes.append(newNote)
        saveNotes()
        newNote = ""
    }

    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        saveNotes()
    }

    func saveNotes() {
        UserDefaults.standard.set(notes, forKey: "savedNotes")
    }

    func loadNotes() {
        if let savedNotes = UserDefaults.standard.stringArray(forKey: "savedNotes") {
            notes = savedNotes
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}

