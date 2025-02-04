import SwiftUI

struct RecordingView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var recordingManager = AudioRecordingManager()
    @ObservedObject var viewModel: VoiceNotesViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(recordingManager.transcribedText)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    if recordingManager.isRecording {
                        let (audioURL, transcription) = recordingManager.stopRecording()
                        viewModel.addVoiceNote(audioURL: audioURL, transcription: transcription)
                        dismiss()
                    } else {
                        recordingManager.startRecording()
                    }
                } label: {
                    Image(systemName: recordingManager.isRecording ? "stop.circle.fill" : "mic.circle.fill")
                        .font(.system(size: 64))
                        .foregroundColor(recordingManager.isRecording ? .red : .blue)
                }
            }
            .padding()
            .navigationTitle("录音")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("取消") {
                    dismiss()
                }
            }
        }
    }
} 