//
//  MockData.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/31/24.
//

import SwiftUI

struct MockData {
    // MARK: - Mock Profiles
    static let doctorProfile = DoctorProfile(
        firstName: "John",
        lastName: "Doe",
        userName: "Dr. John Doe",
        gender: .male,
        specialization: "Family Medicine",
        licenseNumber: "MD12345",
        hospital: "Central Hospital"
    )
    
    static let doctorProfile2 = DoctorProfile(
        firstName: "Sarah",
        lastName: "Chen",
        userName: "Dr. Sarah Chen",
        gender: .female,
        specialization: "Pediatrics",
        licenseNumber: "MD54321",
        hospital: "Children's Medical Center"
    )
    
    static let doctorProfile3 = DoctorProfile(
        firstName: "Michael",
        lastName: "Rodriguez",
        userName: "Dr. Michael Rodriguez",
        gender: .male,
        specialization: "Cardiology",
        licenseNumber: "MD98765",
        hospital: "Heart Institute"
    )
    
    static let doctorProfile4 = DoctorProfile(
        firstName: "Priya",
        lastName: "Patel",
        userName: "Dr. Priya Patel",
        gender: .female,
        specialization: "Dermatology",
        licenseNumber: "MD24680",
        hospital: "Skin & Wellness Center"
    )
    
    static let doctorProfile5 = DoctorProfile(
        firstName: "James",
        lastName: "Wilson",
        userName: "Dr. James Wilson",
        gender: .male,
        specialization: "Orthopedics",
        licenseNumber: "MD13579",
        hospital: "Sports Medicine Clinic"
    )

    static func getDoctorProfiles() -> [DoctorProfile] {
        return [doctorProfile, doctorProfile2, doctorProfile3, doctorProfile4, doctorProfile5]
    }
    
    static let patientProfile = PatientProfile(
        firstName: "Jane",
        lastName: "Smith",
        userName: "Jane Smith",
        dateOfBirth: Date(timeIntervalSince1970: 631152000), // Jan 1, 1990
        gender: .female,
        height: 165.0,
        weight: 60.0,
        medicalHistory: [
            MedicalRecord(
                date: Date().addingTimeInterval(-31536000), // 1 year ago
                condition: "Appendectomy",
                treatment: "Laparoscopic appendix removal",
                doctorId: UUID()
            ),
            MedicalRecord(
                date: Date().addingTimeInterval(-94608000), // 3 years ago
                condition: "Tonsillectomy",
                treatment: "Surgical removal of tonsils",
                doctorId: UUID()
            )
        ],
        allergies: ["Pollen", "Dust"],
        currentMedications: ["Cetirizine 10mg"]
    )
    
    static let patientProfile2 = PatientProfile(
        firstName: "Robert",
        lastName: "Johnson",
        userName: "Robert Johnson",
        dateOfBirth: Date(timeIntervalSince1970: 599616000), // Jan 1, 1989
        gender: .male,
        height: 180.0,
        weight: 75.0,
        medicalHistory: [
            MedicalRecord(
                date: Date().addingTimeInterval(-15768000), // 6 months ago
                condition: "ACL Tear",
                treatment: "Surgical reconstruction",
                doctorId: UUID()
            )
        ],
        allergies: ["Penicillin"],
        currentMedications: ["Ibuprofen 400mg"]
    )
    
    static let patientProfile3 = PatientProfile(
        firstName: "Maria",
        lastName: "Garcia",
        userName: "Maria Garcia",
        dateOfBirth: Date(timeIntervalSince1970: 662688000), // Jan 1, 1991
        gender: .female,
        height: 160.0,
        weight: 55.0,
        medicalHistory: [
            MedicalRecord(
                date: Date().addingTimeInterval(-63072000), // 2 years ago
                condition: "Asthma",
                treatment: "Inhaler therapy",
                doctorId: UUID()
            )
        ],
        allergies: ["Shellfish", "Latex"],
        currentMedications: ["Albuterol inhaler", "Montelukast 10mg"]
    )
    
    static let patientProfile4 = PatientProfile(
        firstName: "David",
        lastName: "Kim",
        userName: "David Kim",
        dateOfBirth: Date(timeIntervalSince1970: 694224000), // Jan 1, 1992
        gender: .male,
        height: 175.0,
        weight: 70.0,
        medicalHistory: [
            MedicalRecord(
                date: Date().addingTimeInterval(-126144000), // 4 years ago
                condition: "Migraine",
                treatment: "Preventive medication",
                doctorId: UUID()
            )
        ],
        allergies: [],
        currentMedications: ["Sumatriptan 50mg"]
    )
    
    static let patientProfile5 = PatientProfile(
        firstName: "Emily",
        lastName: "Brown",
        userName: "Emily Brown",
        dateOfBirth: Date(timeIntervalSince1970: 725760000), // Jan 1, 1993
        gender: .female,
        height: 170.0,
        weight: 65.0,
        medicalHistory: [
            MedicalRecord(
                date: Date().addingTimeInterval(-7884000), // 3 months ago
                condition: "Anxiety",
                treatment: "CBT and medication",
                doctorId: UUID()
            )
        ],
        allergies: ["Sulfa drugs"],
        currentMedications: ["Sertraline 50mg"]
    )

    static func getPatientProfiles() -> [PatientProfile] {
        return [patientProfile, patientProfile2, patientProfile3, patientProfile4, patientProfile5]
    }
    
    // MARK: - Mock Letters
    static let letters: [Letter] = [
        // Dr. John Doe's letters with all patients
        
        // With Jane Smith (keeping existing allergy and headache conversations)
        // Most recent conversation - Allergies
        Letter(
            fromUserName: "Dr. John Doe",
            toUserName: "Jane Smith",
            timestamp: Date(),
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Seasonal allergies and minor respiratory issues",
                diagnosis: """
                    Dear Jane,
                    
                    Thank you for coming to see me today. Based on our discussion and examination, I can confirm that you're experiencing seasonal allergies. Your nasal congestion, occasional coughing, and mild respiratory discomfort are typical symptoms for this time of year. I'm pleased to note that your lungs sound clear and I don't see any signs of infection or serious respiratory concerns.
                    """,
                prescriptionSummary: "Cetirizine 10mg daily",
                prescription: """
                    I'm prescribing the following medications to help manage your symptoms:

                    1. Cetirizine (Zyrtec) 10mg tablet
                       - Take one tablet by mouth daily in the morning
                       - I've prescribed 30 tablets with 2 refills
                    
                    2. Saline nasal spray
                       - Use as needed when you're feeling congested
                    """,
                followUpNotesSummary: "Follow up in 2 weeks if symptoms persist",
                followUpNotes: """
                    To get the best results from your treatment:
                    1. Take your medication at the same time each day
                    2. Try to keep your windows closed during high pollen times
                    3. You might want to consider using an air purifier in your bedroom
                    4. Please schedule a follow-up appointment if your symptoms worsen or don't improve within 2 weeks
                    5. Don't hesitate to seek immediate care if you experience any difficulty breathing or severe allergic reactions
                    
                    Please let me know if you have any questions about your treatment plan.
                    
                    Best regards,
                    Dr. John Doe
                    """
            ))
        ),
        Letter(
            fromUserName: "Jane Smith",
            toUserName: "Dr. John Doe",
            timestamp: Date().addingTimeInterval(-86400),
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Persistent cough and seasonal allergies",
                symptoms: """
                    Dear Dr. Doe,
                    
                    I hope this letter finds you well. I'm writing because I've been experiencing increasingly bothersome allergy symptoms over the past week. My main symptoms include:
                    - A persistent dry cough that's especially troublesome at night
                    - A stuffy and runny nose that continues throughout the day
                    - Sneezing fits that are particularly bad in the morning
                    - Feeling a bit more tired than usual
                    - A slight tightness in my chest when I cough
                    
                    I've noticed these symptoms are worse in the morning and whenever I spend time outdoors.
                    """,
                durationSummary: "1 week",
                duration: "I first noticed these symptoms about a week ago, and they've been gradually getting worse each day.",
                previousTreatmentsSummary: "Over-the-counter antihistamines",
                previousTreatments: """
                    I've tried several remedies to manage these symptoms:
                    1. Benadryl at night - it helps me sleep but leaves me feeling groggy the next day
                    2. A generic store-brand antihistamine - it barely seemed to help
                    3. Honey and tea for the cough - it provides some relief but only temporarily
                    """,
                questionsSummary: "COVID-19 concerns",
                questions: """
                    I have several concerns I'd like to discuss with you:
                    1. Given the current situation, should I be worried that this might be COVID-19? 
                    2. Are there specific allergy triggers I should watch out for this season?
                    3. Would you recommend something stronger than what I can get over-the-counter?
                    4. Do you think I should get tested for specific allergies?
                    
                    Thank you for taking the time to read my concerns.
                    
                    Best regards,
                    Jane
                    """
            ))
        ),
        
        // Headache follow-up
        Letter(
            fromUserName: "Dr. John Doe",
            toUserName: "Jane Smith",
            timestamp: Date().addingTimeInterval(-432000), // 5 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Headaches improving with current treatment",
                diagnosis: """
                    Dear Jane,
                    
                    I'm glad to hear back from you about your headaches. It's encouraging to know that you're experiencing some improvement with the current treatment plan. Based on what you've described, the reduction in frequency is a positive sign that we're on the right track.
                    """,
                prescriptionSummary: "Continue current medication",
                prescription: """
                    Please continue with your current medication regimen:
                    - Sumatriptan as needed for acute headaches
                    - Magnesium supplement daily
                    
                    If you find the timing isn't working well with your schedule, you can take the magnesium supplement with dinner instead of breakfast.
                    """,
                followUpNotesSummary: "Monitor stress and sleep",
                followUpNotes: """
                    To continue improving:
                    1. Keep tracking your headache frequency and intensity
                    2. Maintain your regular sleep schedule, even on weekends
                    3. Take short breaks during work to stretch and rest your eyes
                    4. Consider the stress management techniques we discussed
                    
                    Let's schedule another follow-up in two weeks to assess your progress. If your symptoms worsen before then, please don't hesitate to reach out.
                    
                    Best regards,
                    Dr. John Doe
                    """
            ))
        ),
        Letter(
            fromUserName: "Jane Smith",
            toUserName: "Dr. John Doe",
            timestamp: Date().addingTimeInterval(-518400), // 6 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Headaches less frequent but still present",
                symptoms: """
                    Dear Dr. Doe,
                    
                    I wanted to update you on my headache situation. The good news is that they're less frequent now - I'm down to about 2-3 times per week instead of almost daily. However, when they do occur, they're still quite uncomfortable, especially by the end of my workday.
                    """,
                durationSummary: "3 weeks total",
                duration: """
                    I've been dealing with these headaches for about three weeks now, though they've been less frequent this past week since starting the treatment you prescribed.
                    """,
                previousTreatmentsSummary: "Following prescribed treatment",
                previousTreatments: """
                    I've been following your treatment plan carefully:
                    - Taking the medication as prescribed
                    - Using the stress-relief exercises you recommended
                    - Taking regular breaks from my computer screen
                    
                    The combination seems to be helping, though I'm wondering about the timing of the medications.
                    """,
                questionsSummary: "Medication timing adjustment",
                questions: """
                    I have a couple of questions about the treatment:
                    1. Would it be better to take the magnesium supplement with dinner? I sometimes forget to take it in the morning.
                    2. Should I be concerned that I still get headaches, even though they're less frequent?
                    3. How long should I continue with this current treatment plan?
                    
                    Thank you for your continued support.
                    
                    Best regards,
                    Jane
                    """
            ))
        ),

        // With Robert Johnson
        Letter(
            fromUserName: "Dr. John Doe",
            toUserName: "Robert Johnson",
            timestamp: Date().addingTimeInterval(-1728000), // 20 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Annual physical results",
                diagnosis: """
                    Dear Mr. Johnson,
                    
                    I'm pleased to report that your annual physical results are generally good. Your blood pressure is slightly elevated at 135/85, but other vital signs are normal.
                    """,
                prescriptionSummary: "Lifestyle modifications recommended",
                prescription: """
                    No medications needed at this time. Please continue:
                    1. Regular exercise
                    2. Reduced sodium intake
                    3. Regular blood pressure monitoring
                    """,
                followUpNotesSummary: "Review in 3 months",
                followUpNotes: """
                    Please monitor your blood pressure weekly and maintain a log.
                    Schedule a follow-up in 3 months to review your progress.
                    """
            ))
        ),
        Letter(
            fromUserName: "Robert Johnson",
            toUserName: "Dr. John Doe",
            timestamp: Date().addingTimeInterval(-1814400), // 21 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Annual physical request",
                symptoms: "I would like to schedule my annual physical examination...",
                durationSummary: "Routine checkup",
                duration: "This is a routine annual physical request",
                previousTreatmentsSummary: "No current treatments",
                previousTreatments: "Following previous lifestyle recommendations",
                questionsSummary: "General health concerns",
                questions: """
                    I'd like to discuss:
                    1. Recent blood pressure readings
                    2. Diet recommendations
                    3. Exercise routine adjustments
                    """
            ))
        ),

        // With Maria Garcia
        Letter(
            fromUserName: "Dr. John Doe",
            toUserName: "Maria Garcia",
            timestamp: Date().addingTimeInterval(-2160000), // 25 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Upper respiratory infection",
                diagnosis: "Viral upper respiratory infection confirmed...",
                prescriptionSummary: "Symptomatic treatment",
                prescription: "Over-the-counter decongestants and rest recommended...",
                followUpNotesSummary: "Follow up if symptoms worsen",
                followUpNotes: "Monitor symptoms and return if fever develops..."
            ))
        ),
        Letter(
            fromUserName: "Maria Garcia",
            toUserName: "Dr. John Doe",
            timestamp: Date().addingTimeInterval(-2246400), // 26 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Cold symptoms",
                symptoms: "Experiencing congestion, sore throat, and cough...",
                durationSummary: "3 days",
                duration: "Symptoms started three days ago...",
                previousTreatmentsSummary: "Home remedies",
                previousTreatments: "Using honey and tea for sore throat...",
                questionsSummary: "Need for antibiotics",
                questions: "Should I be taking antibiotics for this condition?..."
            ))
        ),

        // Jane Smith's letters with all doctors
        
        // With Dr. Sarah Chen
        Letter(
            fromUserName: "Dr. Sarah Chen",
            toUserName: "Jane Smith",
            timestamp: Date().addingTimeInterval(-3456000), // 40 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Pediatric consultation for family planning",
                diagnosis: "Thank you for consulting about family planning considerations...",
                prescriptionSummary: "Prenatal vitamin recommendations",
                prescription: "Recommended prenatal vitamins and supplements...",
                followUpNotesSummary: "Follow up in 3 months",
                followUpNotes: "Let's schedule a follow-up to discuss your progress..."
            ))
        ),
        Letter(
            fromUserName: "Jane Smith",
            toUserName: "Dr. Sarah Chen",
            timestamp: Date().addingTimeInterval(-3542400), // 41 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Family planning consultation",
                symptoms: "Seeking advice about preparing for pregnancy...",
                durationSummary: "Planning phase",
                duration: "Beginning to plan for family...",
                previousTreatmentsSummary: "Current medications",
                previousTreatments: "Taking regular vitamins...",
                questionsSummary: "Preconception health",
                questions: "Questions about preconception health and preparation..."
            ))
        ),

        // With Dr. Michael Rodriguez
        Letter(
            fromUserName: "Dr. Michael Rodriguez",
            toUserName: "Jane Smith",
            timestamp: Date().addingTimeInterval(-4320000), // 50 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Cardiac evaluation normal",
                diagnosis: "Your cardiac evaluation shows normal heart function...",
                prescriptionSummary: "No cardiac medications needed",
                prescription: nil,
                followUpNotesSummary: "Routine follow-up in 1 year",
                followUpNotes: "Continue regular exercise and healthy diet..."
            ))
        ),
        Letter(
            fromUserName: "Jane Smith",
            toUserName: "Dr. Michael Rodriguez",
            timestamp: Date().addingTimeInterval(-4406400), // 51 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Heart health check",
                symptoms: "Requesting cardiac evaluation due to family history...",
                durationSummary: "Preventive check",
                duration: "Routine cardiac health evaluation",
                previousTreatmentsSummary: "No cardiac treatments",
                previousTreatments: nil,
                questionsSummary: "Preventive cardiac care",
                questions: "Questions about heart health and prevention..."
            ))
        ),

        // With Dr. Priya Patel
        Letter(
            fromUserName: "Dr. Priya Patel",
            toUserName: "Jane Smith",
            timestamp: Date().addingTimeInterval(-5184000), // 60 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Mild contact dermatitis",
                diagnosis: "You're experiencing contact dermatitis from new skincare products...",
                prescriptionSummary: "Topical treatment prescribed",
                prescription: "1% hydrocortisone cream for affected areas...",
                followUpNotesSummary: "Follow up if not improving",
                followUpNotes: "Avoid known irritants and monitor skin reaction..."
            ))
        ),
        Letter(
            fromUserName: "Jane Smith",
            toUserName: "Dr. Priya Patel",
            timestamp: Date().addingTimeInterval(-5270400), // 61 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Skin rash consultation",
                symptoms: "Developed rash after using new face cream...",
                durationSummary: "5 days",
                duration: "Rash appeared 5 days ago...",
                previousTreatmentsSummary: "Stopped using new products",
                previousTreatments: "Discontinued all new skincare products...",
                questionsSummary: "Allergy testing needed?",
                questions: "Should I get tested for specific skin allergies?..."
            ))
        ),

        // With Dr. James Wilson
        Letter(
            fromUserName: "Dr. James Wilson",
            toUserName: "Jane Smith",
            timestamp: Date().addingTimeInterval(-6048000), // 70 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Shoulder strain assessment",
                diagnosis: "Mild rotator cuff strain from overuse...",
                prescriptionSummary: "Physical therapy exercises",
                prescription: "Home exercise program and NSAIDs as needed...",
                followUpNotesSummary: "Follow up in 2 weeks",
                followUpNotes: "Continue prescribed exercises and ice therapy..."
            ))
        ),
        Letter(
            fromUserName: "Jane Smith",
            toUserName: "Dr. James Wilson",
            timestamp: Date().addingTimeInterval(-6134400), // 71 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Shoulder pain evaluation",
                symptoms: "Experiencing shoulder pain during overhead activities...",
                durationSummary: "2 weeks",
                duration: "Pain started after increasing workout intensity...",
                previousTreatmentsSummary: "Rest and ice",
                previousTreatments: "Using ice packs and limiting movement...",
                questionsSummary: "Exercise modifications",
                questions: "How should I modify my workout routine?..."
            ))
        ),

        // Additional letter between Jane and Dr. Michael Rodriguez (insert after existing letters)
        Letter(
            fromUserName: "Dr. Michael Rodriguez",
            toUserName: "Jane Smith",
            timestamp: Date().addingTimeInterval(-4492800), // 52 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Follow-up on heart palpitations",
                diagnosis: """
                    Dear Jane,
                    
                    Thank you for reporting your recent episodes of heart palpitations. Based on your description and the results of your recent Holter monitor test, these appear to be benign premature ventricular contractions (PVCs), which are common and often triggered by caffeine, stress, or lack of sleep.
                    """,
                prescriptionSummary: "Lifestyle modifications recommended",
                prescription: """
                    No medications are needed at this time, but please:
                    1. Limit caffeine intake to morning hours only
                    2. Practice the breathing exercises we discussed
                    3. Maintain regular sleep schedule
                    """,
                followUpNotesSummary: "Monitor and record episodes",
                followUpNotes: """
                    Please keep a log of when these episodes occur and what might have triggered them. If you experience:
                    - Dizziness with palpitations
                    - Chest pain
                    - Shortness of breath
                    Please seek immediate medical attention.
                    
                    Best regards,
                    Dr. Rodriguez
                    """
            ))
        ),

        // Additional letters between Jane and Dr. James Wilson (insert after existing letters)
        Letter(
            fromUserName: "Dr. James Wilson",
            toUserName: "Jane Smith",
            timestamp: Date().addingTimeInterval(-6220800), // 72 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Physical therapy progress review",
                diagnosis: """
                    Dear Jane,
                    
                    I'm pleased with your progress in physical therapy for your shoulder strain. The improvement in your range of motion and decreased pain levels indicate that the prescribed exercises are working effectively.
                    """,
                prescriptionSummary: "Continue PT with modifications",
                prescription: """
                    1. Continue current PT exercises with increased repetitions
                    2. Add resistance band exercises as demonstrated
                    3. NSAIDs as needed for post-exercise soreness
                    """,
                followUpNotesSummary: "Gradual return to activities",
                followUpNotes: """
                    You can begin gradually returning to your regular activities, but please:
                    1. Start with lower weights and higher repetitions
                    2. Avoid overhead movements that cause pain
                    3. Continue using proper form as demonstrated
                    
                    Let's schedule another review in 3 weeks.
                    
                    Best regards,
                    Dr. Wilson
                    """
            ))
        ),
        Letter(
            fromUserName: "Jane Smith",
            toUserName: "Dr. James Wilson",
            timestamp: Date().addingTimeInterval(-6307200), // 73 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "PT exercises causing discomfort",
                symptoms: """
                    Dear Dr. Wilson,
                    
                    I've been following the physical therapy routine, but I'm experiencing some discomfort with certain exercises, particularly:
                    - The external rotation with the resistance band
                    - Overhead stretches
                    - Wall slides
                    
                    The pain is different from the original injury - more of a burning sensation.
                    """,
                durationSummary: "1 week of PT",
                duration: "This new discomfort started after beginning the PT exercises last week",
                previousTreatmentsSummary: "Following prescribed PT",
                previousTreatments: """
                    I've been:
                    - Doing all prescribed exercises
                    - Using ice after sessions
                    - Taking breaks when needed
                    - Maintaining proper form
                    """,
                questionsSummary: "Exercise modifications needed",
                questions: """
                    I have some concerns:
                    1. Should I modify or skip certain exercises?
                    2. Is this type of discomfort normal during recovery?
                    3. Should I decrease the number of repetitions?
                    4. Would heat be better than ice for this type of pain?
                    
                    Thank you for your guidance.
                    
                    Best regards,
                    Jane
                    """
            ))
        ),

        // With David Kim
        Letter(
            fromUserName: "Dr. John Doe",
            toUserName: "David Kim",
            timestamp: Date().addingTimeInterval(-2592000), // 30 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Migraine management review",
                diagnosis: """
                    Dear David,
                    
                    Based on your migraine diary and our discussion today, your episodes have become more frequent but shorter in duration. The pattern suggests some improvement with the current preventive measures, though we may need to adjust the treatment plan.
                    """,
                prescriptionSummary: "Adjusted medication regimen",
                prescription: """
                    1. Continue Sumatriptan 50mg for acute attacks
                    2. Increase magnesium supplement to 500mg daily
                    3. Add CoQ10 100mg daily
                    """,
                followUpNotesSummary: "Continue monitoring triggers",
                followUpNotes: """
                    Please continue tracking:
                    1. Sleep patterns
                    2. Dietary triggers
                    3. Stress levels
                    4. Exercise routine
                    
                    Schedule a follow-up in 6 weeks to evaluate the new regimen.
                    
                    Best regards,
                    Dr. Doe
                    """
            ))
        ),
        Letter(
            fromUserName: "David Kim",
            toUserName: "Dr. John Doe",
            timestamp: Date().addingTimeInterval(-2678400), // 31 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Increased migraine frequency",
                symptoms: """
                    Dear Dr. Doe,
                    
                    I've noticed my migraines are occurring more frequently, though they don't last as long as before. I'm now having about 3-4 episodes per week, but they typically resolve within 4-6 hours with medication.
                    """,
                durationSummary: "Ongoing, increased frequency",
                duration: "Pattern change noticed over the past month",
                previousTreatmentsSummary: "Current medication regimen",
                previousTreatments: """
                    Current treatments:
                    - Sumatriptan for acute attacks
                    - Magnesium 400mg daily
                    - Regular exercise
                    - Sleep hygiene practices
                    """,
                questionsSummary: "Treatment adjustment needed",
                questions: """
                    Questions for our discussion:
                    1. Should we adjust my preventive medication?
                    2. Are there additional supplements that might help?
                    3. Could recent stress be a major factor?
                    4. Should we consider alternative therapies?
                    
                    Best regards,
                    David
                    """
            ))
        ),

        // With Emily Brown
        Letter(
            fromUserName: "Dr. John Doe",
            toUserName: "Emily Brown",
            timestamp: Date().addingTimeInterval(-3024000), // 35 days ago
            type: .fromDoctor(Letter.DoctorLetterContent(
                diagnosisSummary: "Anxiety management follow-up",
                diagnosis: """
                    Dear Emily,
                    
                    I'm glad to hear you're seeing some improvement with the combination of medication and therapy. Your symptoms appear to be responding well to the current treatment plan, though we can make some adjustments to better manage the morning anxiety.
                    """,
                prescriptionSummary: "Medication timing adjustment",
                prescription: """
                    1. Sertraline 50mg
                       - Take in the morning with breakfast
                       - Continue daily as prescribed
                    
                    2. As needed for acute anxiety:
                       - Deep breathing exercises
                       - Progressive muscle relaxation
                    """,
                followUpNotesSummary: "Continue therapy and monitoring",
                followUpNotes: """
                    Please continue:
                    1. Weekly therapy sessions
                    2. Daily meditation practice
                    3. Regular exercise routine
                    4. Sleep hygiene measures
                    
                    Let's schedule another check-in in 4 weeks.
                    
                    Best regards,
                    Dr. Doe
                    """
            ))
        ),
        Letter(
            fromUserName: "Emily Brown",
            toUserName: "Dr. John Doe",
            timestamp: Date().addingTimeInterval(-3110400), // 36 days ago
            type: .fromPatient(Letter.PatientLetterContent(
                symptomsSummary: "Anxiety improvement with some concerns",
                symptoms: """
                    Dear Dr. Doe,
                    
                    The medication and therapy have been helping overall, but I'm still experiencing heightened anxiety in the mornings, especially before work. The rest of the day is generally more manageable now.
                    """,
                durationSummary: "Ongoing treatment review",
                duration: "Two months on current treatment plan",
                previousTreatmentsSummary: "Current treatment regimen",
                previousTreatments: """
                    Current management:
                    - Sertraline 50mg daily
                    - Weekly therapy sessions
                    - Daily meditation
                    - Regular exercise
                    """,
                questionsSummary: "Morning anxiety concerns",
                questions: """
                    I have a few questions:
                    1. Should we adjust when I take the medication?
                    2. Are there specific techniques for morning anxiety?
                    3. Could my coffee intake be affecting the anxiety?
                    4. Should we consider any additional treatments?
                    
                    Thank you for your support.
                    
                    Best regards,
                    Emily
                    """
            ))
        )
    ]
}
