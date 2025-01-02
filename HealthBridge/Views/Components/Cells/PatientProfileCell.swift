//
//  PatientProfileCard.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/1/25.
//

import SwiftUI

struct PatientProfileCell: View {
    let patient: PatientProfile
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(UserType.patient.getThemeColor())
                    
                    Text(patient.userName)
                        .font(.headline)
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                    
                    let age = Calendar.current.dateComponents([.year], from: patient.dateOfBirth, to: Date()).year ?? 0
                    Text("\(age) years old")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: "figure.dress.line.vertical.figure")
                        .foregroundColor(.gray)
                    
                    Text(patient.gender.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: "ruler")
                        .foregroundColor(.gray)
                    
                    Text("\(Int(patient.height)) cm, \(Int(patient.weight)) kg")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                let letterCount = MockData.letters.filter { 
                    ($0.fromUserName == patient.userName && $0.toUserName == MockData.doctorProfile.userName) ||
                    ($0.fromUserName == MockData.doctorProfile.userName && $0.toUserName == patient.userName)
                }.count
                
                Text("\(letterCount)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(UserType.patient.getThemeColor())
                
                Text("Letters")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(UserType.patient.getThemeColor().opacity(0.1))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(UserType.patient.getThemeColor().opacity(0.3), lineWidth: 1)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PatientProfileCell(patient: MockData.patientProfile)
}
