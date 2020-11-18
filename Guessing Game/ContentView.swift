//
//  ContentView.swift
//  Guessing Game
//
//  Created by Abdul Ahad Khan on 2020-11-17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number = Int.random(in: 1...100)
    
    @State var guessString = ""
    @State var guess = 0
    
    @State private var tries = 0
    
    @State private var stateOfAnswer = ""
    
    @State private var numberIsEven = false
    
    @State private var hint = ""
    @State private var hintsLeft = 1
        
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
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                Section {
                    TextField("Enter guess here", text: $guessString)
                        .keyboardType(.numberPad)
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
                Section {
                    Text("\(hint)")
                    Button(action: {
                        Hints()
                    }) {
                        Text("Use Hint")
                            .foregroundColor(.red)
                    }
                }
                Section {
                    Button(action: {
                        PlayAgain()
                    }) {
                        Image("PlayAgain")
                            .resizable()
                            .scaledToFit()
                    }
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
        let hintChooser = Int.random(in: 1...4)
        let numberminus = number - Int.random(in: 1...10)
        let numberplus = number + Int.random(in: 1...10)
        if number % 2 == 0 {
            numberIsEven = true
        } else {
            numberIsEven = false
        }
        if hintsLeft == 0 {
            hint = "YOU USED YOUR HINT!"
        } else {
            if hintChooser == 4 {
                hint = "Number is below \(numberplus)"
            } else if hintChooser == 3 {
                hint = "Number is above \(numberminus)"
            } else if hintChooser == 2 {
                hint = "Number is between \(numberminus) and \(numberplus)"
            } else {
                switch numberIsEven {
                case true:
                    hint = "Number is even"
                case false:
                    hint = "Number is odd"
                }
            }
        }
        hintsLeft = 0
    }
    func PlayAgain() {
        number = Int.random(in: 1...100)
        hintsLeft = 1
        tries = 0
        stateOfAnswer = ""
        numberIsEven = false
        guessString = ""
        guess = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
