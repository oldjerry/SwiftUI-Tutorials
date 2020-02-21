//
//  ButtonBarView.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct ButtonBarView: View {
    
    @EnvironmentObject var user: User
    
    var isFirstQuiz: Bool {
        get {
            return self.user.currentIndex == 0
        }
    }
    
    var isLastQuiz: Bool {
        get {
            return self.user.currentIndex == self.user.exams.count - 1
        }
    }
    
    var quizCount: Int {
        get {
            return self.user.exams.count
        }
    }
    
    func getCurrQuizIndex() -> Int {
        return self.user.currentIndex
    }
    
    func setPrevQuizIndex() -> Void {
        self.user.currentIndex = (self.user.currentIndex > 0) ? self.user.currentIndex-1 : 0
    }
    func setNextQuizIndex() -> Void {
        self.user.currentIndex = (self.user.currentIndex < self.user.exams.count-1) ?
            self.user.currentIndex+1 : self.user.exams.count-1
    }
    
    var body: some View {
        HStack {
            
            ZStack {
                Rectangle (
                )
                .frame(height: 50)
                .foregroundColor(Color.gray.opacity(0.1))
                //.blur(radius: 20)
                .cornerRadius(5)
                .padding()

                
                HStack {
                    Button(action: {self.setPrevQuizIndex()}){
                        Image(systemName: "chevron.left")
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(5)
                            .foregroundColor(self.isFirstQuiz ? Color.gray : Color.white)
                        
                    }
                    .disabled(self.isFirstQuiz)
                    .padding(.trailing)
                    .animation(.default)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Text("Submit")
                            .font(.title)
                    }
                    .disabled(!self.isLastQuiz)
                    .foregroundColor(self.isLastQuiz ? Color.white : Color.gray.opacity(0.2))
                    .shadow(color: Color.black.opacity(0.4), radius: 3, x: 1, y: 2)
                    .animation(.default)
                    
                    Spacer()
                    
                    Button(action: {self.setNextQuizIndex()}){
                        Image(systemName: "chevron.right")
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(5)
                            .foregroundColor(self.isLastQuiz ? Color.gray : Color.white)
                    }
                    .disabled(self.isLastQuiz)
                    .padding(.leading)
                    .animation(.default)
                }
                .padding()
                
            }
            
            
            
            
            
        }
        
    }
}

#if DEBUG
struct ButtonBarView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBarView()
            .environmentObject(User())
    }
}
#endif
