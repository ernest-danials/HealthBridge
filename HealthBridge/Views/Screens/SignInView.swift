//
//  SignInView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/1/25.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var welcomeText = "Welcome to\nHealthBridge"
    
    func handleSignIn(as userType: UserType, withName name: String) {
        withAnimation(.spring(duration: 1.5)) { welcomeText = "Welcome back,\n\(name)" }
        HapticManager.shared.impact(style: .soft)
        
        // Delay the user type change by 0.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            viewModel.changeUserType(to: userType)
            HapticManager.shared.impact(style: .soft)
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
                .frame(height: 60)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(welcomeText)
                    .customFont(size: 32, weight: .bold)
                    .multilineTextAlignment(.leading)
                
                if welcomeText == "Welcome to\nHealthBridge" {
                    Text("Sign in to continue")
                        .customFont(size: 16, weight: .semibold)
                        .foregroundColor(.secondary)
                } else {
                    HStack(spacing: 8) {
                        ProgressView()

                        Text("Signing in...")
                            .customFont(size: 16, weight: .semibold)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .alignView(to: .leading)
            .padding(.horizontal, 32)
            
            Spacer()
            
            VStack(spacing: 16) {
                Button {
                    handleSignIn(as: .patient, withName: MockData.patientProfile.userName)
                } label: {
                    Text("Sign in as Patient")
                        .customFont(size: 20, weight: .semibold)
                        .alignView(to: .center)
                        .padding()
                        .background(UserType.patient.getThemeColor())
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }.scaleButtonStyle()
                
                Button {
                    handleSignIn(as: .doctor, withName: MockData.doctorProfile.userName)
                } label: {
                    Text("Sign in as Doctor")
                        .customFont(size: 20, weight: .semibold)
                        .alignView(to: .center)
                        .padding()
                        .background(UserType.doctor.getThemeColor())
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }.scaleButtonStyle()
            }
            .padding(.horizontal, 32)
        }.background(Material.ultraThin)
    }
}

#Preview {
    SignInView()
        .environmentObject(ViewModel())
}
