//
//  QuizCardView.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct QuizCardView: View {
    @EnvironmentObject var user: User
    let exam: Exam
    
    var body: some View {
        VStack (alignment: .leading) {
            Image("default")
                .resizable()
               // .clipShape(Rect)
                .cornerRadius(10)
                .padding()
            
            
            Text(exam.question)
                .font(.subheadline)
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
