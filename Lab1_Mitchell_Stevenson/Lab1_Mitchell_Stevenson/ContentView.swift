//
//  ContentView.swift
//  Lab1_Mitchell_Stevenson
//

import SwiftUI

struct ContentView: View {
    
    @State private var currNum: Int = Int.random(in: 2...200)
    
    @State private var correctCount: Int = 0
    @State private var wrongCount: Int = 0
    
    @State private var guesses: Int = 0
    
    @State private var wasPrime: Bool? = nil
    @State private var showFeedback: Bool = false
    
    @State private var seconds: Int = 5
    @State private var timer: Timer? = nil
    @State private var hasAnswered: Bool = false
    
    @State private var showSummary: Bool = false
    @State private var lastRoundCorrect: Int = 0
    @State private var lastRoundWrong: Int = 0
    
    
    var body: some View {
        VStack {
            
            // Title
            Text("Prime or Not").font(.largeTitle.bold())
            
            // Timer
            Text("Next in... \(seconds)s").font(.headline).foregroundStyle(.secondary)
            
            // Number display
            Text("\(currNum)").font(.system(size: 72, weight: .bold)).padding(.top, 24)
            
            // Selector buttons
//            HStack{
//                choiceView(
//                    label: "Prime",
//                    selectPrime: true
//                )
//
//                choiceView(
//                    label: "Not Prime",
//                    selectPrime: false
//                )
//            }
            
            HStack{
                Label("Correct \(correctCount)", systemImage: "checkmark.circle.fill")
                Label("Incorrect \(wrongCount)", systemImage: "xmark.circle.fill")
            }
            .padding(.top, 12)
            
        }
        
    }
    
    
    
    
    private func isPrime(_ n: Int) -> Bool{
        if n < 2 {return false}
        if n == 2 {return true}
        if n % 2 == 0{ return false }
        
        var i = 3
        while i * i <= n {
            if n % i == 0 {return false}
            i += 2
        }
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
