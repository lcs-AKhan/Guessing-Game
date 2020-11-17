//
//  ContentView.swift
//  Guessing Game
//
//  Created by Abdul Ahad Khan on 2020-11-17.
//

import SwiftUI

struct ContentView: View {
    
    private var number = Int.random(in: 1...100)
    
    @State var guessString = ""
    @State var guess = 0
    
    @State private var tries = 0
    
    @State private var stateOfAnswer = ""
    
    @State private var numberEvenOrOdd = ""
    
    @State private var hint = ""
    
    var body: some View {
        VStack {
            Text("Guessing Game")
                .font(.largeTitle)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Form {
                Section {
                    Text("Im thinking of a number between 1 and 100 ... Can you guess this number?")
                        .font(.title)
                        .padding(.horizontal)
                }
                Section {
                    TextField("Enter guess here", text: $guessString)
                    Button(action: {
                        CheckGuess()
                    }) {
                        Text("Submit Guess")
                            .multilineTextAlignment(.center)
                    }
                }
                Section {
                    Text("\(stateOfAnswer)")
                    Text("Tries: \(tries)")
                }
            }
        }
    }
    func CheckGuess() {
        guess = Int(guessString) ?? 0
        if guess == number {
            stateOfAnswer = "You are right!"
        } else if guess < number {
            stateOfAnswer = "Guess higher"
        } else {
            stateOfAnswer = "Guess lower"
        }
        tries += 1
    }
    func Hints() {
        let hintChooser = Int.random(in: 1...10)
        if hintChooser > 5 {
            let numberplus10 = number + 10
            hint = "Number is below \(numberplus10)"
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
