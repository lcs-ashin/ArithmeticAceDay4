//
//  ReactionAnimationView.swift
//  ArithmeticAce
//
//  Created by Eunbi Shin on 2022-02-15.
//

import SwiftUI

struct ReactionAnimationView: View {
    // MARK: Stored Properties
    let answerChecked: Bool
    let answerCorrect: Bool
    
    // MARK: Computed Properties
    var body: some View {
        ZStack {
            LottieView(animationNamed: "51926-happy")
                .opacity(answerCorrect == true ? 1.0 : 0.0)
                .padding()

            LottieView(animationNamed: "91726-sad-guy-is-walking")
                .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                .padding()
        }

    }
}

//struct ReactionAnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReactionAnimationView()
//    }
//}
