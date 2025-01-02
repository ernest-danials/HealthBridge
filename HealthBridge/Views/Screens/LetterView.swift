//
//  LetterView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/1/25.
//

import SwiftUI

struct LetterView: View {
    let letter: Letter
    @EnvironmentObject private var viewModel: ViewModel
    
    private var isFromDoctor: Bool {
        switch letter.type {
        case .fromDoctor: return true
        case .fromPatient: return false
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
    
    private let aiThemeColor = Color(red: 0.45, green: 0.27, blue: 0.85)
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                letterHeader
                summarySection
                Divider()
                
                switch letter.type {
                case .fromDoctor(let content):
                    doctorLetterContent(content)
                case .fromPatient(let content):
                    patientLetterContent(content)
                }
            }
            .padding()

            Spacer().frame(height: 100)
        }
        .navigationTitle(isFromCurrentUser ? "My Letter" : "Letter from \(fromDisplayName)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { HapticManager.shared.impact(style: .soft) }
    }
    
    private var letterHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("From: \(fromDisplayName)")
                    .font(.headline)
                Spacer()
                Text(letter.timestamp.formatted(date: .abbreviated, time: .shortened))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text("To: \(toDisplayName)")
                .font(.headline)
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
    }
    
    private var summarySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 4) {
                Image(systemName: "sparkles")
                    .font(.caption2)
                
                Text("Summary by ").font(.caption2).fontWeight(.medium) +
                Text("HealthBridge AI").font(.caption2).bold()
            }
            .foregroundColor(aiThemeColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(aiThemeColor.opacity(0.3))
            .clipShape(Capsule())

            switch letter.type {
            case .fromDoctor(let content):
                summaryText("Diagnosis", content.diagnosisSummary)
                if let prescription = content.prescriptionSummary {
                    summaryText("Prescription", prescription)
                }
                if let followUp = content.followUpNotesSummary {
                    summaryText("Follow-up", followUp)
                }
            case .fromPatient(let content):
                summaryText("Symptoms", content.symptomsSummary)
                summaryText("Duration", content.durationSummary)
                if let treatments = content.previousTreatmentsSummary {
                    summaryText("Previous Treatments", treatments)
                }
                if let questions = content.questionsSummary {
                    summaryText("Questions", questions)
                }
            }
        }
        .alignView(to: .leading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(aiThemeColor.opacity(0.1))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(aiThemeColor.opacity(0.3), lineWidth: 1)
        }
    }
    
    private func summaryText(_ title: String, _ content: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(content)
                .font(.body)
        }
    }
    
    private func doctorLetterContent(_ content: Letter.DoctorLetterContent) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            letterSection(
                title: "Diagnosis",
                details: content.diagnosis
            )
            
            if let prescription = content.prescription {
                letterSection(
                    title: "Prescription",
                    details: prescription
                )
            }
            
            if let followUpNotes = content.followUpNotes {
                letterSection(
                    title: "Follow-up Notes",
                    details: followUpNotes
                )
            }
        }
    }
    
    private func patientLetterContent(_ content: Letter.PatientLetterContent) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            letterSection(
                title: "Symptoms",
                details: content.symptoms
            )
            
            letterSection(
                title: "Duration",
                details: content.duration
            )
            
            if let previousTreatments = content.previousTreatments {
                letterSection(
                    title: "Previous Treatments",
                    details: previousTreatments
                )
            }
            
            if let questions = content.questions {
                letterSection(
                    title: "Questions",
                    details: questions
                )
            }
        }
    }
    
    private func letterSection(title: String, details: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            
            Text(details)
                .font(.body)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }
}

#Preview {
    NavigationView {
        LetterView(letter: MockData.letters[1])
        .environmentObject(ViewModel())
    }
}
