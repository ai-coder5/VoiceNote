import Foundation

struct VoiceNote: Identifiable, Codable {
    let id: UUID
    let title: String
    let transcription: String
    let audioURL: URL
    let createdAt: Date
    
    init(id: UUID = UUID(), title: String, transcription: String, audioURL: URL, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.transcription = transcription
        self.audioURL = audioURL
        self.createdAt = createdAt
    }
} 