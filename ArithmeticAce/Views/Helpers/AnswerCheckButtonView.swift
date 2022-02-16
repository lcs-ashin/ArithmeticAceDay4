//
//  AnswerCheckButtonView.swift
//  ArithmeticAce
//
//  Created by Eunbi Shin on 2022-02-15.
//

import SwiftUI

struct AnswerCheckButtonView: View {
    // MARK: Stored Properties
    let answerGiven: String
    var correctAnswer: Int
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    @Binding var inputGiven: String
    
    // MARK: Computed Properties
    var body: some View {
        Button(action: {
            
            // Answer has been checked!
            answerChecked = true
            
            // Convert the input given to an integer, if possible
            guard let answerGiven = Int(inputGiven) else {
                // Sadness, not a number
                answerCorrect = false
                return
            }
            
            // Check the answer!
            if answerGiven == correctAnswer {
                // Celebrate! 👍🏼
                answerCorrect = true
            } else {
                // Sadness, they gave a number, but it's correct 😭
                answerCorrect = false
            }
        }, label: {
            Text("Check Answer")
                .font(.largeTitle)
        })

    }
}

//struct AnswerCheckButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnswerCheckButtonView()
//    }
//}
