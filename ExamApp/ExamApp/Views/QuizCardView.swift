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
    
    var body: some View {
        VStack (alignment: .leading) {
            Image("default")
                .cornerRadius(10)
                .padding()
            
            
            Text("Hello, World! \(user.exams[user.currentIndex].question)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.leading, 25)
                
        }
        
    }
}


#if DEBUG
struct QuizCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCardView()
            .environmentObject(User())
    }
}
#endif
