//
//  QuizCardView.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct QuizCardView: View {
   // @EnvironmentObject var user: User
    let exam: Exam
    
    func getQuiz() -> String {
        (self.exam.type == .Single) ? self.exam.question : "\(self.exam.question) [Multiple answers]"
    }
    
    var body: some View {
        
        VStack (alignment: .leading) {
            // Image("default")
            exam.image
                .resizable()
                .cornerRadius(10)
                .padding()
            
            Text(getQuiz())
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .frame(height:300)
    }
    
}


#if DEBUG
struct QuizCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCardView(exam: examData[0])
    }
}
#endif
