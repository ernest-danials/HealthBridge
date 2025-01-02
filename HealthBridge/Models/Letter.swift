//
//  Letter.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import Foundation

enum LetterType: Codable {
    case fromDoctor(Letter.DoctorLetterContent)
    case fromPatient(Letter.PatientLetterContent)
}

struct Letter: Identifiable, Codable {
    let id: String
    let fromUserName: String
    let toUserName: String
    let timestamp: Date
    let type: LetterType

    init(id: String = UUID().uuidString, fromUserName: String, toUserName: String, timestamp: Date, type: LetterType) {
        self.id = id
        self.fromUserName = fromUserName
        self.toUserName = toUserName
        self.timestamp = timestamp
        self.type = type
    }
    
    struct PatientLetterContent: Codable {
        let symptomsSummary: String
        let symptoms: String
        let durationSummary: String
        let duration: String
        let previousTreatmentsSummary: String?
        let previousTreatments: String?
        let questionsSummary: String?
        let questions: String?
    }
    
    struct DoctorLetterContent: Codable {
        let diagnosisSummary: String
        let diagnosis: String
        let prescriptionSummary: String?
        let prescription: String?
        let followUpNotesSummary: String?
        let followUpNotes: String?
    }
}
