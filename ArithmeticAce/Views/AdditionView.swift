//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-08.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    @State var augend = Int.random(in: 1...143)
    @State var addend = 0
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct sum?
    var correctSum: Int {
        return augend + addend
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
                QuestionPresentationView(operation: "+",
                                         firstValue: augend,
                                         secondValue: addend)
            Divider()
            
            AnswerAndResultView(answerChecked: answerChecked,
                                answerCorrect: answerCorrect,
                                inputGiven: $inputGiven)

            ZStack {
                
                AnswerCheckButtonView(answerGiven: "sumGiven",
                                      correctAnswer: correctSum,
                                      answerChecked: $answerChecked,
                                      answerCorrect: $answerCorrect,
                                      inputGiven: $inputGiven)
                .padding()
                    .buttonStyle(.bordered)
                // Only show this button when an answer has not been checked
                    .opacity(answerChecked == false ? 1.0 : 0.0)
                
                Button(action: {
                    // Generate a new question
                    augend = Int.random(in: 1...144)
                    addend = Int.random(in: 1...144 - augend)
                    
                    // Reset properties that track what's happening with the current question
                    answerChecked = false
                    answerCorrect = false
                    
                    // Reset the input field
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                // Only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)
                
            }
         
//            // Reaction animation
//            ReactionAnimationView(answerChecked: answerChecked,
//                                  answerCorrect: answerCorrect)
            
            // List of prior questions
            List {
                HStack {
                    Text("143 + 1 = 144")
                        .font(.title3)
                    
                    Spacer()
                    
                    AnswerAndResultView(answerChecked: answerChecked,
                                        answerCorrect: answerCorrect,
                                        inputGiven: $inputGiven)
                        .font(.system(size: 25))
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        // This block of code runs once when the view is loaded
        .task {
            addend = Int.random(in: 1...144 - augend)
        }
        
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
