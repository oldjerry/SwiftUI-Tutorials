//
//  RegisterView.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: User
    @ObservedObject var keyboardHandler: KeyboardFollower
    
    private let title = "Welcome to Exams"
    @State private var showHome = false
    @State private var name: String = ""
    
    init(keyboardHandler: KeyboardFollower) {
          self.keyboardHandler = keyboardHandler
        }
    
    func registerUser() {
      if name.isEmpty == false {
        user.profile = Profile(username: name)
      }
      showHome = true
    }
    
    func isUserNameValid() -> Bool {
      return self.name.count >= 0
    }
    
    var body: some View {
        Group {
            if showHome {
                HomeView()
            } else {
                VStack{
                    Text(title)
                        .font(.title)
                        .animation(.spring())
                    TextField("Enter your name", text: $name)
                        .multilineTextAlignment(.center)
                        .bordered()
                        .padding()
                    Button(action: {
                        self.registerUser()
                    }) {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text("OK")
                        }
                    }
                    .bordered()
                    .foregroundColor(isUserNameValid() ? Color.black : Color.gray)
                    .disabled(!isUserNameValid())
                }
                .padding(.bottom, keyboardHandler.keyboardHeight)
                .padding()
                .onAppear { self.keyboardHandler.subscribe() }
                .onDisappear { self.keyboardHandler.unsubscribe() }
            }
        }
    }
}

#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(keyboardHandler: KeyboardFollower())
            .environmentObject(User())
    }
}
#endif
