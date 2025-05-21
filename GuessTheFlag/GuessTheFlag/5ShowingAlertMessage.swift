//
//  5ShowingAlertMessage.swift
//  GuessTheFlag
//
//  Created by seungwooKim on 5/21/25.
//

import SwiftUI

struct _ShowingAlertMessage: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            // 아무런 동작을 넣지 않으면 Alert가 dismiss 됨.
//            Button("OK") { }
            
            // 가로로 나열 됨.
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            // Alert 본문 내용
            Text("content")
        }
    }
}

#Preview {
    _ShowingAlertMessage()
}
