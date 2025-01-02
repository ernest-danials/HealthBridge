//
//  Profile.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import Foundation

struct PatientProfile: Identifiable, Codable, Hashable {
    let id: String
    
    let firstName: String
    let lastName: String
    let userName: String
    let dateOfBirth: Date
    let gender: Gender
    let height: Double
    let weight: Double
    let medicalHistory: [MedicalRecord]?
    let allergies: [String]?
    let currentMedications: [String]?
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }

    init(id: String = UUID().uuidString, firstName: String, lastName: String, userName: String, dateOfBirth: Date, gender: Gender, height: Double, weight: Double, medicalHistory: [MedicalRecord]? = nil, allergies: [String]? = nil, currentMedications: [String]? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.height = height
        self.weight = weight
        self.medicalHistory = medicalHistory
        self.allergies = allergies
        self.currentMedications = currentMedications
    }
}

struct DoctorProfile: Identifiable, Codable, Hashable {
    let id: String
    
    let firstName: String
    let lastName: String
    let userName: String
    let gender: Gender
    let specialization: String?
    let licenseNumber: String?
    let hospital: String?
    
    var fullName: String {
        "Dr. \(firstName) \(lastName)"
    }

    init(id: String = UUID().uuidString, firstName: String, lastName: String, userName: String, gender: Gender, specialization: String? = nil, licenseNumber: String? = nil, hospital: String? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.gender = gender
        self.specialization = specialization
        self.licenseNumber = licenseNumber
        self.hospital = hospital
    }
}

struct MedicalRecord: Codable, Hashable {
    let date: Date
    let condition: String
    let treatment: String
    let doctorId: UUID
} 
