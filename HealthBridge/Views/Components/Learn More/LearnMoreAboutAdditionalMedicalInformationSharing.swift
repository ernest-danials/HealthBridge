//
//  LearnMoreAboutAdditionalMedicalRecordsSharing.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/1/25.
//

import SwiftUI

struct LearnMoreAboutAdditionalMedicalInformationSharing: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: "ecg.text.page.fill")
                            .customFont(size: 65)
                            .foregroundStyle(.blue)
                        
                        Text("About Additional Medical Information Sharing")
                            .customFont(size: 23, weight: .bold)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.vertical, 8)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Text("What is Additional Medical Information Sharing?")
                            .customFont(size: 17, weight: .semibold)
                        
                        Text("Additional Medical Information is a feature that allows patients to share specific health-related information beyond their basic profile. This system empowers patients to provide relevant medical history, ongoing conditions, and other health-related data that they believe would be valuable for their healthcare providers.")
                            .customFont(size: 15, weight: .regular)
                            .foregroundStyle(.secondary)
                            .padding(.top, -16)
                        
                        Text("How It Works")
                            .customFont(size: 17, weight: .semibold)
                        
                        Text("Patients can choose which information to share when creating a new Shelf. They maintain complete control over their data and can update or revoke access at any time. When a patient shares information, their healthcare providers receive a notification and can access this data during consultations or through the patient's medical record section.")
                            .customFont(size: 15, weight: .regular)
                            .foregroundStyle(.secondary)
                            .padding(.top, -16)
                        
                        Text("Types of Shareable Information")
                            .customFont(size: 17, weight: .semibold)
                        
                        Text("• Allergies and adverse reactions\n• Current medications and dosages\n• Chronic conditions\n• Past surgeries and procedures\n• Family medical history\n• Lifestyle factors\n• Emergency contact information")
                            .customFont(size: 15, weight: .regular)
                            .foregroundStyle(.secondary)
                            .padding(.top, -16)
                        
                        Text("Privacy and Security")
                            .customFont(size: 17, weight: .semibold)
                        
                        Text("The system uses end-to-end encryption, and access is limited to authorised healthcare providers only. Patients receive notifications when their information is accessed, ensuring complete transparency.")
                            .customFont(size: 15, weight: .regular)
                            .foregroundStyle(.secondary)
                            .padding(.top, -16)
                        
                        Text("Benefits")
                            .customFont(size: 17, weight: .semibold)
                        
                        Text("This sharing system helps improve the quality of care by:\n• Ensuring healthcare providers have comprehensive patient information\n• Reducing the risk of medical errors\n• Saving time during consultations\n• Enabling more informed medical decisions\n• Allowing patients to have contol over their information")
                            .customFont(size: 15, weight: .regular)
                            .foregroundStyle(.secondary)
                            .padding(.top, -16)
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                Spacer().frame(height: 80)
            }
            .navigationTitle("Learn More")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        Text("Done")
                            .customFont(size: 16, weight: .medium)
                    }
                }
            }
            .onAppear { HapticManager.shared.impact(style: .soft) }
        }
    }
}

#Preview {
    LearnMoreAboutAdditionalMedicalInformationSharing()
}
