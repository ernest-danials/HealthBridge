//
//  WriteLetterView.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/30/24.
//

import SwiftUI

struct WriteLetterView: View {
    let geo: GeometryProxy
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var diagnosis: String = ""
    @State private var diagnosisSummary: String = ""
    @State private var prescription: String = ""
    @State private var prescriptionSummary: String = ""
    @State private var followUpNotes: String = ""
    @State private var followUpNotesSummary: String = ""

    @State private var isShowingConnectToComputerView: Bool = false
    
    private let aiThemeColor = Color(red: 0.45, green: 0.27, blue: 0.85)

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                if viewModel.userType == .doctor {
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Writing to...")
                                    .font(.subheadline)

                                Spacer()

                                Text("Jane Smith")
                                    .font(.headline)
                            }
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemBlue).opacity(0.1))
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.systemBlue).opacity(0.3), lineWidth: 1)
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 4) {
                                Image(systemName: "sparkles")
                                    .font(.caption2)
                                
                                Text("HealthBridge AI").font(.caption2).bold()
                            }
                            .foregroundColor(aiThemeColor)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(aiThemeColor.opacity(0.3))
                            .clipShape(Capsule())

                            VStack(alignment: .leading, spacing: 3) {
                                Text("Turn your existing notes into a letter")
                                    .customFont(size: 18, weight: .bold)
                                
                                Text("Use the code below to connect to HealthBridge Extension. Our extension will read your notes on Cerner, HealthLink, etc., and import them into this letter automatically.")
                                    .customFont(size: 14)
                                    .opacity(0.7)
                            }

                            Text("A1B3C-5D7E9")
                                .customFont(size: 21, weight: .heavy)
                            
                            Text("This code expires in 10 minutes.")
                                .font(.caption)
                                .opacity(0.7)
                        }
                        .alignView(to: .leading)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(aiThemeColor.opacity(0.1))
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(aiThemeColor.opacity(0.3), lineWidth: 1)
                        }

                        // Diagnosis Section
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Diagnosis")
                                .font(.headline)
                            
                            TextField("Detailed diagnosis", text: $diagnosis, axis: .vertical)
                                .textFieldStyle(.plain)
                                .background(Color.white.opacity(0.001))
                                .lineLimit(4...8)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(viewModel.getThemeColor().opacity(0.1))
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(viewModel.getThemeColor().opacity(0.3), lineWidth: 1)
                        }
                        
                        // Prescription Section
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Prescription")
                                .font(.headline)
                            
                            TextField("Detailed prescription", text: $prescription, axis: .vertical)
                                .textFieldStyle(.plain)
                                .background(Color.white.opacity(0.001))
                                .lineLimit(4...8)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(viewModel.getThemeColor().opacity(0.1))
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(viewModel.getThemeColor().opacity(0.3), lineWidth: 1)
                        }
                        
                        // Follow-up Notes Section
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Follow-up Notes")
                                .font(.headline)
                            
                            TextField("Detailed follow-up notes", text: $followUpNotes, axis: .vertical)
                                .textFieldStyle(.plain)
                                .background(Color.white.opacity(0.001))
                                .lineLimit(4...8)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(viewModel.getThemeColor().opacity(0.1))
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(viewModel.getThemeColor().opacity(0.3), lineWidth: 1)
                        }

                        Spacer().frame(height: 100)
                    }
                    .padding(.top)
                    .padding(.horizontal, 10)
                } else {
                    Text("Write Letter View for Patient")
                }
            }
        }
        .alignView(to: .center)
        .background(Material.ultraThin)
    }
}

#Preview {
    GeometryReader { geo in
        WriteLetterView(geo: geo)
            .environmentObject(ViewModel())
    }
}
