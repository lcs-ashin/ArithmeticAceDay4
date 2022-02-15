//
//  AnswerAndResultView.swift
//  ArithmeticAce
//
//  Created by Eunbi Shin on 2022-02-15.
//

import SwiftUI

struct AnswerAndResultView: View {
    // MARK: Stored Properties
    // These properties are NOT modified on the helper view
    // So, we can declare them as regular constants "let"
    let answerChecked: Bool
    let answerCorrect: Bool
    
    //This property is modified (by the TextField) in this
    // helper view AND we want to send its value back to
    // the source of truth on the originating view
    @Binding var inputGiven: String
    
    // MARK: Computed Properties
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                //        CONDITION      true  false
                    .opacity(answerCorrect == true ? 1.0 : 0.0)
                
                Image(systemName: "x.square")
                    .foregroundColor(.red)
                //        CONDITION1         AND     CONDITION2         true  false
                //       answerChecked = true     answerCorrect = false
                    .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
            }
            
            Spacer()
            
            TextField("",
                      text: $inputGiven)
                .multilineTextAlignment(.trailing)
        }

    }
}

//struct AnswerAndResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnswerAndResultView()
//    }
//}
