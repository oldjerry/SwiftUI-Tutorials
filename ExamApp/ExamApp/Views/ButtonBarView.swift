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
                    Button(action: {self.user.setPrevQuizIndex()}){
                        Image(systemName: "chevron.left")
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(5)
                            .foregroundColor(self.user.isFirstQuiz ? Color.gray : Color.white)
                        
                    }
                    .disabled(self.user.isFirstQuiz)
                    .padding(.trailing)
                    .animation(.default)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Text("Submit")
                            .font(.title)
                    }
                    .disabled(!self.user.isLastQuiz)
                    .foregroundColor(self.user.isLastQuiz ? Color.white : Color.gray.opacity(0.2))
                    .shadow(color: Color.black.opacity(0.4), radius: 3, x: 1, y: 2)
                    .animation(.default)
                    
                    Spacer()
                    
                    Button(action: {self.user.setNextQuizIndex()}){
                        Image(systemName: "chevron.right")
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(5)
                            .foregroundColor(self.user.isLastQuiz ? Color.gray : Color.white)
                    }
                    .disabled(self.user.isLastQuiz)
                    .padding(.leading)
                    .animation(.default)
                }
                .padding()
                
            }
        
        }
        .frame(height: 50)
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
