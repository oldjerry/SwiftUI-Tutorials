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
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(user.profile.username)
                    Spacer()
                    Text("\(user.currentIndex+1)/\(user.quizCount)")
                }
                 Divider()
            }
             .padding()
            Spacer()
            QuizCardView()
                .padding()
            Spacer()
            VStack {
                ButtonBarView()
                .padding()
                 
            }
             .padding()
        }
        
        
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
