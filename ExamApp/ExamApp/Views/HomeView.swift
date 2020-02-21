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
   // @State var select: String = "A"
    
    func onSelectBotton(select: String) -> Void {
        let exam = user.exams[user.currentIndex]
        
        if user.exams[user.currentIndex].selected.contains(select) {
            user.exams[user.currentIndex].selected.remove(select)
        } else {
            if exam.type == .Single {
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
                Text(user.profile.username)
                Spacer()
                Text("\(user.currentIndex+1)/\(user.quizCount)")
            }
            Spacer()
            Divider()
            
            //       Spacer()
            
            QuizCardView(exam: self.user.exams[self.user.currentIndex])
                .padding()
            
            
            VStack {
                ChoseRowView(onButtonTaped: onSelectBotton, select: "A", isOn: isSelected(select: "A") )
                ChoseRowView(onButtonTaped: onSelectBotton, select: "B", isOn: isSelected(select: "B") )
                ChoseRowView(onButtonTaped: onSelectBotton, select: "C", isOn: isSelected(select: "C") )
                ChoseRowView(onButtonTaped: onSelectBotton, select: "D", isOn: isSelected(select: "D") )
            }
            .padding()
            
//            Button(action: {self.select = "B"}){
//                Text("test")
//            }
            
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
