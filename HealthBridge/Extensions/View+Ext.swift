//
//  View+Ext.swift
//  HealthBridge
//
//  Created by Myung Joon Kang on 12/7/24.
//

import SwiftUI

extension View {
    func alignView(to: HorizontalAlignment) -> some View {
        var result: some View {
            HStack {
                if to != .leading {
                    Spacer()
                }
                
                self
                
                if to != .trailing {
                    Spacer()
                }
            }
        }
        
        return result
    }
    
    func alignViewVertically(to: VerticalAlignment) -> some View {
        var result: some View {
            VStack {
                if to != .top {
                    Spacer()
                }
                
                self
                
                if to != .bottom {
                    Spacer()
                }
            }
        }
        
        return result
    }
    
    func customFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.font(.system(size: size, weight: weight, design: design))
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func alertTextField(title: String, message: String, hintText: String, primaryTitle: String, secondaryTitle: String, primaryAction: @escaping (String) -> (), secondaryAction: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in
            secondaryAction()
        }))
        
        alert.addAction(.init(title: primaryTitle, style: .default, handler: { _ in
            if let text = alert.textFields?[0].text {
                primaryAction(text)
            } else {
                primaryAction("")
            }
        }))
        
        rootController().present(alert, animated: true)
    }
    
    private func rootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
    
    func standardColor(colorScheme: ColorScheme) -> Color {
        let result = (colorScheme == .light ? Color.black : .white)
        
        return result
    }
}

// Needed for custom cornerRadius modifier.
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
