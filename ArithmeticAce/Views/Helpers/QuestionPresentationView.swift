//
//  QuestionPresentationView.swift
//  ArithmeticAce
//
//  Created by Eunbi Shin on 2022-02-15.
//

import SwiftUI

struct QuestionPresentationView: View {
    
    // MARK: Stored Properties
    let operation: String
    let firstValue: Int
    let secondValue: Int
    
    // MARK: Computed Properties
    var body: some View {
        HStack {
            Text("\(operation)")
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(firstValue)")
                Text("\(secondValue)")
            }
        }

    }
}

//struct QuestionPresentationView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionPresentationView()
//    }
//}
