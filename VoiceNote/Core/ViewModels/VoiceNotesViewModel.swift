import Foundation
import SwiftUI

class VoiceNotesViewModel: ObservableObject {
    @Published var voiceNotes: [VoiceNote] = []
    @Published var isRecordingSheetPresented = false
    
    func addVoiceNote(audioURL: URL, transcription: String) {
        let title = Date().formatted(date: .abbreviated, time: .shortened)
        let voiceNote = VoiceNote(title: title,
                                 transcription: transcription,
                                 audioURL: audioURL)
        voiceNotes.append(voiceNote)
    }
} 