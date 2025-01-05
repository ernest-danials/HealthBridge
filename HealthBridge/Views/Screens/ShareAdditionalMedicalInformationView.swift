//
//  ShareAdditionalMedicalInformationView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/4/25.
//

import SwiftUI

struct ShareAdditionalMedicalInformationView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedItems: Set<String> = []
    @State private var isShowingLearnMoreSheet = false
    
    let medicalInformationTypes = [
        "Allergies and adverse reactions",
        "Current medications and dosages",
        "Chronic conditions",
        "Past surgeries and procedures",
        "Family medical history",
        "Lifestyle factors",
        "Emergency contact information"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: "ecg.text.page.fill")
                            .customFont(size: 65)
                            .foregroundStyle(.blue)
                        
                        Text("Share Additional Medical Information")
                            .customFont(size: 23, weight: .bold)
                            .multilineTextAlignment(.center)

                        Text("This information will be shared with your doctor to help them provide you with the best care possible.")
                            .customFont(size: 14, weight: .regular)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                        
                        Button {
                            isShowingLearnMoreSheet = true
                            HapticManager.shared.impact(style: .soft)
                        } label: {
                            Text("Learn more")
                                .customFont(size: 14)
                                .foregroundStyle(Color.accentColor)
                        }.scaleButtonStyle()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Select information to share")
                            .customFont(size: 17, weight: .semibold)
                        
                        ForEach(medicalInformationTypes, id: \.self) { item in
                            Button {
                                if selectedItems.contains(item) {
                                    selectedItems.remove(item)
                                } else {
                                    selectedItems.insert(item)
                                }
                                HapticManager.shared.impact(style: .soft)
                            } label: {
                                HStack {
                                    Image(systemName: selectedItems.contains(item) ? "checkmark.square.fill" : "square")
                                        .foregroundStyle(selectedItems.contains(item) ? .blue : .gray)
                                        .customFont(size: 20, weight: .medium)
                                    
                                    Text(item)
                                        .customFont(size: 16, weight: .regular)
                                        .foregroundStyle(.primary)
                                    
                                    Spacer()
                                }
                                .scaleButtonStyle()
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                            }
                            .scaleButtonStyle()
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer().frame(height: 70)
                }
                .padding(.vertical)
            }
            .prioritiseScaleButtonStyle()
            .overlay(alignment: .bottom) {
                ZStack {
                    ProgressBlurView()
                        .blur(radius: 10)
                        .frame(height: 200)
                        .padding(.horizontal, -15)
                        .padding(.bottom, -100)
                    
                    Button {
                        viewModel.currentAdditionalMedicalInformation = Array(selectedItems)
                        dismiss()
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        CapsuleButtonLabel(
                            imageName: "checkmark.circle.fill",
                            text: "Share Selected Information",
                            height: 30
                        )
                    }
                    .scaleButtonStyle()
                    .padding(.horizontal)
                    .disabled(selectedItems.isEmpty)
                    .opacity(selectedItems.isEmpty ? 0.6 : 1.0)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                        HapticManager.shared.impact(style: .soft)
                    } label: {
                        Text("Cancel")
                            .customFont(size: 16, weight: .medium)
                    }
                }
            }
        }
        .task {
            withAnimation {
                self.selectedItems = Set(viewModel.currentAdditionalMedicalInformation)
            }
        }
        .sheet(isPresented: $isShowingLearnMoreSheet) {
            LearnMoreAboutAdditionalMedicalInformationSharing()
        }
    }
}

#Preview {
    ShareAdditionalMedicalInformationView()
        .environmentObject(ViewModel())
}
