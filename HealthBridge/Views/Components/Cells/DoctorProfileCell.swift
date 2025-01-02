//
//  DoctorProfileCell.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 1/1/25.
//

import SwiftUI

struct DoctorProfileCell: View {
    let doctor: DoctorProfile
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "stethoscope")
                        .foregroundColor(UserType.doctor.getThemeColor())
                    
                    Text(doctor.userName)
                        .font(.headline)
                    
                    Spacer()
                }
                
                if let hospital = doctor.hospital {
                    HStack {
                        Image(systemName: "building.2")
                            .foregroundColor(.gray)

                        Text(hospital)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                if let specialization = doctor.specialization {
                    HStack {
                        Image(systemName: "cross.case")
                            .foregroundColor(.gray)

                        Text(specialization)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                if let licenseNumber = doctor.licenseNumber {
                    HStack(spacing: 2) {
                        Image(systemName: "number")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text("License: \(licenseNumber)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }

            Spacer()
            
            VStack(alignment: .trailing) {
                let letterCount = MockData.letters.filter { 
                    ($0.fromUserName == doctor.userName && $0.toUserName == MockData.patientProfile.userName) ||
                    ($0.fromUserName == MockData.patientProfile.userName && $0.toUserName == doctor.userName)
                }.count
                
                Text("\(letterCount)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(UserType.doctor.getThemeColor())
                
                Text("Letters")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(UserType.doctor.getThemeColor().opacity(0.1))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(UserType.doctor.getThemeColor().opacity(0.3), lineWidth: 1)
        }
        .padding(.horizontal)
    }
}

#Preview {
    DoctorProfileCell(doctor: MockData.doctorProfile)
        .environmentObject(ViewModel())
}
