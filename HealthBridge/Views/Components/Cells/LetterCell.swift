//
//  LetterCell.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/31/24.
//

import SwiftUI

struct LetterCell: View {
    let letter: Letter
    @EnvironmentObject private var viewModel: ViewModel
    
    private var isFromDoctor: Bool {
        switch letter.type {
        case .fromDoctor: return true
        case .fromPatient: return false
        }
    }
    
    private var letterContent: String {
        switch letter.type {
        case .fromDoctor(let content):
            return """
                Diagnosis: \(content.diagnosisSummary)
                \(content.prescriptionSummary != nil ? "Prescription: \(content.prescriptionSummary!)" : "")
                \(content.followUpNotesSummary != nil ? "Follow-up: \(content.followUpNotesSummary!)" : "")
                """.trimmingCharacters(in: .whitespacesAndNewlines)
        case .fromPatient(let content):
            return """
                Symptoms: \(content.symptomsSummary)
                Duration: \(content.durationSummary)
                \(content.questionsSummary != nil ? "Questions: \(content.questionsSummary!)" : "")
                """.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    private var isFromCurrentUser: Bool {
        let userMatches = switch viewModel.userType {
        case .doctor: letter.fromUserName == MockData.doctorProfile.userName
        case .patient: letter.fromUserName == MockData.patientProfile.userName
        case .none: false
        }
        return userMatches
    }
    
    private var isToCurrentUser: Bool {
        switch (viewModel.userType, letter.type) {
        case (.doctor, .fromPatient),
             (.patient, .fromDoctor):
            return true
        default:
            return false
        }
    }
    
    private var fromDisplayName: String {
        isFromCurrentUser ? "Me" : letter.fromUserName
    }
    
    private var toDisplayName: String {
        isToCurrentUser ? "Me" : letter.toUserName
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: isFromDoctor ? "stethoscope" : "person.fill")
                    .foregroundColor(isFromDoctor ? UserType.doctor.getThemeColor() : UserType.patient.getThemeColor())
                
                Text(fromDisplayName)
                    .font(.headline)
                
                Spacer()
                
                Text(letter.timestamp.formatted())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Text("To: \(toDisplayName)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(letterContent)
                .font(.body)
                .lineLimit(7)
                .truncationMode(.middle)
                .padding(.top, 4)
            
            HStack(spacing: 4) {
                Image(systemName: "sparkles")
                    .font(.caption2)
                
                Text("Summarised by ").font(.caption2).fontWeight(.medium) + 
                Text("HealthBridge AI").font(.caption2).bold()
            }
            .foregroundColor(Color(red: 0.45, green: 0.27, blue: 0.85))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(red: 0.45, green: 0.27, blue: 0.85).opacity(0.3))
            .clipShape(Capsule())
            .padding(.bottom, 4)
            
            HStack {
                Image(systemName: isFromDoctor ? "cross.case" : "list.bullet.clipboard")
                    .foregroundColor(isFromDoctor ? UserType.doctor.getThemeColor() : UserType.patient.getThemeColor())
                
                Text("Read more")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(isFromDoctor ? .systemBlue : .systemGreen).opacity(0.1))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(isFromDoctor ? .systemBlue : .systemGreen).opacity(0.3), lineWidth: 1)
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 20) {
        LetterCell(letter: MockData.letters[0])
        LetterCell(letter: MockData.letters[1])
        LetterCell(letter: MockData.letters.last!)
    }.environmentObject(ViewModel())
}
