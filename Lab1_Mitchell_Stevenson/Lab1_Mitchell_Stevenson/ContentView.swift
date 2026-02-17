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
            HStack{
                choiceView(
                    label: "Prime",
                    selectPrime: true
                )

                choiceView(
                    label: "Not Prime",
                    selectPrime: false
                )
            }
            
            HStack{
                Label("Correct \(correctCount)", systemImage: "checkmark.circle.fill")
                Label("Incorrect \(wrongCount)", systemImage: "xmark.circle.fill")
            }
            .padding(.top, 12)
            
        }
        
    }
    
//        .onAppear
    
    @ViewBuilder
    private func choiceView(label: String, selectPrime: Bool) -> some View{
        let answerIsPrime = isPrime(currNum)
        let correctChoice = (selectPrime = answerIsPrime)
        
        VStack{
            Button{
                guard !hasAnswered else {return}
                handleUserSelection(selectPrime: selectPrime)
            } label: {
                Text(label)
                    .font(.title2.bold())
                    .frame(width: 140, height: 70)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .disabled(hasAnswered)
            
            if showFeedback{
                if correctChoice{
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size:34))
                        .foregroundStyle(.green)
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size:34))
                        .foregroundStyle(.red)
                }
            } else {
                Color.clear.frame(height: 34)
            }
        }
    }
    
    private func handleUserSelection(selectPrime: Bool){
        hasAnswered = true
        wasPrime = selectPrime
        showFeedback = true
        
        let answerIsPrime = isPrime(currNum)
        let userWasCorrect = (selectPrime = answerIsPrime)
        
        recordAttempt(userWasCorrect: userWasCorrect)
        
    }
    
    private func recordAttempt(userWasCorrect: Bool){
        if userWasCorrect{
            correctCount += 1
        } else {
            wrongCount += 1
        }
        
        guesses += 1
        
        if guesses == 10{
            lastRoundCorrect = correctCount
            lastRoundWrong = wrongCount
            
            showSummary = true
            
            
            correctCount = 0
            wrongCount = 0
            guesses = 0
        }
    }
    
    private func nextNumber(){
        currNum = Int.random(in: 2...200)
        
        showFeedback = false
        wasPrime = nil
        hasAnswered = false
        seconds = 0
    }
    
    private func startTimer(){
        timer?.invalidate()
        seconds = 5
        hasAnswered = false
        showFeedback = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            _  in if seconds > 1 {
                seconds -= 1
                return
            }
            seconds = 0
            
            if !hasAnswered{
                hasAnswered = true
                showFeedback = true
                
                recordAttempt(userWasCorrect: false)
            } else {
                
            }
        }
        
        RunLoop.current.add(timer!, forMode: .common)
        
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
