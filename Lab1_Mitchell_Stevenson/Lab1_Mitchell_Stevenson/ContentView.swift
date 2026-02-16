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
            
            Text("Prime or Not").font(.largeTitle.bold())
            
            Text("Next in... \(seconds)s").font(.headline).foregroundStyle(.secondary)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
