//
//  Home.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var user: User
    let startingValue = Int(("A" as UnicodeScalar).value) // 65
    
    func onSelectBotton(select: String) -> Void {
         
        if user.exams[user.currentIndex].selected.contains(select) {
            user.exams[user.currentIndex].selected.remove(select)
        } else {
            if user.exams[user.currentIndex].type == .Single {
                user.exams[user.currentIndex].selected.removeAll()
            }
            user.exams[user.currentIndex].selected.insert(select)
        }
//        switch exam.type {
//        case .Single:
//            if user.exams[user.currentIndex].selected.contains(select) {
//                user.exams[user.currentIndex].selected.remove(select)
//            } else
//            {
//                user.exams[user.currentIndex].selected.removeAll()
//                user.exams[user.currentIndex].selected.insert(select)
//            }
//        case .Multiple:
//            if user.exams[user.currentIndex].selected.contains(select) {
//                user.exams[user.currentIndex].selected.remove(select)
//            } else
//            {
//                user.exams[user.currentIndex].selected.insert(select)
//            }
//        }
    }
    
    func isSelected(select: String) -> Bool {
        return user.exams[user.currentIndex].selected.contains(select)
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Text(user.getUserName())
                Spacer()
                Text(user.getQuizNumofCounttoString())
            }
            Spacer()
            Divider()
            
            //       Spacer()
            QuizCardView(exam: user.getCurrentExam())
                .padding()
            
            
            VStack {
                ChoicesView(choices: user.getCurrentExam().choices)
            }
            .padding()
            
            
            //    Spacer()
            ButtonBarView()
                .padding()
        }
        .padding()
        
    }
    
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
          .environmentObject(User())
    }
}
#endif
