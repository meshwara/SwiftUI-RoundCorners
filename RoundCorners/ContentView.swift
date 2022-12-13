//
//  ContentView.swift
//  RoundCorners
//
//  Created by D. Prameswara on 13/12/22.
//

import SwiftUI


struct RoundedShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text("modifier dengan cornerRadius")
                    .padding()
                Spacer()
            }
            .frame(height: 80)
            .background(.red)
            .cornerRadius(50)
            
            RoundedShape(radius: 40, corners: [.topRight, .bottomRight, .bottomLeft])
                .fill(.blue)
                .frame(height: 100)
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedShape(radius: 50, corners: [.topLeft, .bottomRight]))
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .frame(maxWidth: .infinity)
                .padding(30)
                .background(
                    RoundedShape(radius: 50, corners: [.topLeft, .bottomLeft])
                        .fill(.orange)
                )
        }
        .foregroundColor(.white)
        .padding()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
