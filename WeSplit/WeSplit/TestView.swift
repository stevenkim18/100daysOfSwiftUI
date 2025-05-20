//
//  TestView.swift
//  WeSplit
//
//  Created by seungwooKim on 5/19/25.
//

import SwiftUI

struct TestView: View {
    @State var value = ""
    
    var noUse: String { // 호출 안됨.
        print(#line)
        return ""
    }
    
    var use: String { // 다시 호출 됨.
        return value
    }
    
    var use2: String { // 다시 호출 됨.
        print(#line)
        return "asdasd"
    }
    
    var body: some View {
        TextField("test", text: $value)
        
        Text(use)
        Text(use2)
    }
}

#Preview {
    TestView()
}
