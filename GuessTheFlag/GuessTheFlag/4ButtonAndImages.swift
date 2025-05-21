//
//  4ButtonAndImages.swift
//  GuessTheFlag
//
//  Created by seungwooKim on 5/21/25.
//

import SwiftUI

struct _ButtonAndImages: View {
    var body: some View {
        VStack(spacing: 8) {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            Button("Button 5") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            // 이미지와 텍스트가 가로 정렬이 됨.
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }
            
            // 커스텀하기 위해서 Label 사용.
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
}

#Preview {
    _ButtonAndImages()
}
