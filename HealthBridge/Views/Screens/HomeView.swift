//
//  HomeView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct HomeView: View {
    let geo: GeometryProxy
    @EnvironmentObject var viewModel: ViewModel
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        switch viewModel.userType {
                        case .doctor:
                            VStack {
                                Text("Your Shelves")
                                    .customFont(size: 20, weight: .bold)
                                    .alignView(to: .leading)
                                    .padding(.horizontal)
                                
                                ForEach(MockData.getPatientProfiles()) { patient in
                                    NavigationLink(value: patient) {
                                        PatientProfileCell(patient: patient)
                                    }.scaleButtonStyle()
                                }
                            }
                        case .patient:
                            VStack {
                                Text("Your Shelves")
                                    .customFont(size: 20, weight: .bold)
                                    .alignView(to: .leading)
                                    .padding(.horizontal)
                                
                                ForEach(MockData.getDoctorProfiles()) { doctor in
                                    NavigationLink(value: doctor) {
                                        DoctorProfileCell(doctor: doctor)
                                    }.scaleButtonStyle()
                                }
                            }
                        case .none:
                            Text("Error: User type not found")

                            Button("Debug: Change User Type to Patient") {
                                viewModel.changeUserType(to: .patient)
                            }.foregroundStyle(.red)

                            Button("Debug: Change User Type to Doctor") {
                                viewModel.changeUserType(to: .doctor)
                            }.foregroundStyle(.red)
                        }
                        
                        Spacer().frame(height: 100)
                    }
                }
                .prioritiseScaleButtonStyle()
                .navigationDestination(for: PatientProfile.self) { patient in
                    ShelfWithPatientView(patient: patient)
                }
                .navigationDestination(for: DoctorProfile.self) { doctor in
                    ShelfWithDoctorView(doctor: doctor)
                }
                .navigationTitle("Home")
            }
        }
        .onChange(of: viewModel.userType) { _, newValue in
            if newValue != .none {
                withAnimation { navigationPath = NavigationPath() }
            }
        }
        .onChange(of: self.navigationPath) {
            HapticManager.shared.impact(style: .soft)
            print("navigationPath: \(navigationPath)")
        }
    }
}

#Preview {
    GeometryReader { geo in
        HomeView(geo: geo)
            .environmentObject(ViewModel())
    }
}
