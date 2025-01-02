//
//  ShelfWithPatientView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/1/25.
//

import SwiftUI

struct ShelfWithPatientView: View {
    let patient: PatientProfile

    @EnvironmentObject var viewModel: ViewModel

    @State private var showingMedicalRecordsSheet = false

    private let defaultDoctor = MockData.doctorProfile // Dr. John Doe
    private var lettersWithPatient: [Letter] {
        MockData.letters.filter { letter in
            (letter.fromUserName == defaultDoctor.userName && letter.toUserName == patient.userName) ||
            (letter.fromUserName == patient.userName && letter.toUserName == defaultDoctor.userName)
        }.sorted { $0.timestamp > $1.timestamp }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Shelf with \(patient.fullName)")
                        .customFont(size: 20, weight: .bold)
                    
                    Text("Age \(Calendar.current.dateComponents([.year], from: patient.dateOfBirth, to: Date()).year ?? 0) • \(patient.gender.rawValue)")
                        .customFont(size: 14, weight: .regular)
                        .foregroundStyle(.secondary)
                    
                    Text("\(String(format: "%.1f", patient.height)) cm • \(String(format: "%.1f", patient.weight)) kg")
                        .customFont(size: 14, weight: .regular)
                        .foregroundStyle(.secondary)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Button {
                            HapticManager.shared.impact(style: .soft)
                        } label: {
                            HStack {
                                Image(systemName: "ecg.text.page")
                                    .foregroundStyle(.blue)

                                Text("Additional Medical Records")
                                    .foregroundStyle(.blue)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                        }.scaleButtonStyle()
                        
                        Button {
                            showingMedicalRecordsSheet = true
                        } label: {
                            HStack {
                                Text("\(patient.firstName) has shared 3 additional information with you. ").font(.caption).foregroundStyle(Color.gray) + Text("Learn more").font(.caption).foregroundStyle(Color.accentColor)
                            }.multilineTextAlignment(.leading)
                        }
                    }.sheet(isPresented: $showingMedicalRecordsSheet) { LearnMoreAboutAdditionalMedicalInformationSharing() }
                }
                .alignView(to: .leading)
                .padding(.horizontal)

                Divider().padding(.horizontal)

                Text("\(lettersWithPatient.count) letters")
                        .customFont(size: 14, weight: .medium)
                        .foregroundStyle(.secondary)
                        .alignView(to: .leading)
                        .padding(.horizontal)

                ForEach(lettersWithPatient, id: \.timestamp) { letter in
                    NavigationLink {
                        LetterView(letter: letter)
                    } label: {
                        LetterCell(letter: letter)
                    }.scaleButtonStyle()
                }
                
                if lettersWithPatient.isEmpty {
                    ContentUnavailableView(
                        "No Letters",
                        systemImage: "tray",
                        description: Text("There are no letters between \(defaultDoctor.fullName) and \(patient.fullName)")
                    )
                    .padding(.top, 40)
                }
            }
            .padding(.vertical)

            Spacer().frame(height: 100)
        }
        .prioritiseScaleButtonStyle()
        .navigationTitle("Shelf")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ShelfWithPatientView(patient: MockData.patientProfile2)
            .environmentObject(ViewModel())
    }
}
