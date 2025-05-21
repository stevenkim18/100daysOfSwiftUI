//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by seungwooKim on 5/21/25.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScoreAlert = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    @State private var round = 0
    @State private var wrongCountryName = ""
    
    private let finalRound = 5
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                
                VStack(spacing: 16) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            wrongCountryName = countries[number]
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.buttonBorder)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
                Button("Restart") {
                    scoreTitle = "Warning"
                    showingScoreAlert = true
                }.buttonStyle(.borderedProminent)
                
                Spacer()
                
            }.padding()
    
        }.alert(scoreTitle, isPresented: $showingScoreAlert) {
            if scoreTitle == "Warning" {
                // destructive 버튼이 있으면 자동으로 Cancel이 생김.
                Button("Restart", role: .destructive, action: reset)
            } else {
                Button("Ok") {
                    if round == finalRound {
                        reset()
                    } else {
                        askQuestion()
                    }
                }
            }
            
        } message: {
            if round == finalRound {
                Text("Your score is \(score)")
            } else {
                // 오답인 경우
                if scoreTitle == "Wrong" {
                    Text("This is \"\(wrongCountryName)\"")
                } else {
                    Text("Do You Want To Play Again?")
                }
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            askQuestion()
        } else {
            scoreTitle = "Wrong"
            showingScoreAlert = true
        }
        
        round += 1
        
        if round == finalRound {
            scoreTitle = "Game Over"
            showingScoreAlert = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        score = 0
        round = 0
        askQuestion()
    }
    
}

#Preview {
    ContentView()
}
