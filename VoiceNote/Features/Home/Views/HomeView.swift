import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = VoiceNotesViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.voiceNotes) { note in
                VStack(alignment: .leading, spacing: 8) {
                    Text(note.title)
                        .font(.headline)
                    Text(note.transcription)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("语音笔记")
            .toolbar {
                Button {
                    viewModel.isRecordingSheetPresented = true
                } label: {
                    Image(systemName: "mic.circle.fill")
                        .font(.title2)
                }
            }
            .sheet(isPresented: $viewModel.isRecordingSheetPresented) {
                RecordingView(viewModel: viewModel)
            }
        }
    }
} 