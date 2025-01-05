//
//  ShelfWithDoctorView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/1/25.
//

import SwiftUI

struct ShelfWithDoctorView: View {
    let doctor: DoctorProfile

    @EnvironmentObject var viewModel: ViewModel

    @State private var isShowingLearnMoreScreen = false
    @State private var isShowingShareAdditionalMedicalInformationSheet = false

    private let defaultPatient = MockData.patientProfile // Jane Smith
    private var lettersWithDoctor: [Letter] {
        MockData.letters.filter { letter in
            (letter.fromUserName == doctor.userName && letter.toUserName == defaultPatient.userName) ||
            (letter.fromUserName == defaultPatient.userName && letter.toUserName == doctor.userName)
        }.sorted { $0.timestamp > $1.timestamp }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Shelf with \(doctor.fullName)")
                        .customFont(size: 20, weight: .bold)
                    
                    if let specialty = doctor.specialization, let hospital = doctor.hospital {
                        Text("\(specialty) • \(hospital)")
                            .customFont(size: 14, weight: .regular)
                            .foregroundStyle(.secondary)
                    } else if let specialty = doctor.specialization {
                        Text(specialty)
                            .customFont(size: 14, weight: .regular)
                            .foregroundStyle(.secondary)
                    } else if let hospital = doctor.hospital {
                        Text(hospital)
                            .customFont(size: 14, weight: .regular)
                            .foregroundStyle(.secondary)
                    }


                    VStack(alignment: .leading, spacing: 4) {
                        Button {
                            isShowingShareAdditionalMedicalInformationSheet = true
                            HapticManager.shared.impact(style: .soft)
                        } label: {
                            HStack {
                                Image(systemName: "ecg.text.page")
                                    .foregroundStyle(.blue)

                                Text("Share Additional Medical Records")
                                    .foregroundStyle(.blue)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                        }.scaleButtonStyle()
                        
                        Button {
                            isShowingLearnMoreScreen = true
                            HapticManager.shared.impact(style: .soft)
                        } label: {
                            HStack {
                                Text("You have shared \(viewModel.currentAdditionalMedicalInformation.count) additional information with \(doctor.fullName). ").font(.caption).foregroundStyle(Color.gray) + Text("Learn more").font(.caption).foregroundStyle(Color.accentColor)
                            }.multilineTextAlignment(.leading)
                        }
                    }.sheet(isPresented: $isShowingLearnMoreScreen) { 
                        LearnMoreAboutAdditionalMedicalInformationSharing()
                    }
                    .sheet(isPresented: $isShowingShareAdditionalMedicalInformationSheet) { 
                        ShareAdditionalMedicalInformationView()
                    }
                }
                .alignView(to: .leading)
                .padding(.horizontal)

                Divider().padding(.horizontal)

                Text("\(lettersWithDoctor.count) letters")
                        .customFont(size: 14, weight: .medium)
                        .foregroundStyle(.secondary)
                        .alignView(to: .leading)
                        .padding(.horizontal)

                ForEach(lettersWithDoctor, id: \.timestamp) { letter in
                    NavigationLink {
                        LetterView(letter: letter)
                    } label: {
                        LetterCell(letter: letter)
                    }.scaleButtonStyle()
                }
                
                if lettersWithDoctor.isEmpty {
                    ContentUnavailableView(
                        "No Letters",
                        systemImage: "tray",
                        description: Text("There are no letters between \(defaultPatient.fullName) and \(doctor.fullName)")
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
        ShelfWithDoctorView(doctor: MockData.doctorProfile2)
            .environmentObject(ViewModel())
    }
}
