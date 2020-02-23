//
//  ChooseView.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/23.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct ChoicesView: View {
    
    @EnvironmentObject var user: User
    let startingValue = Int(("A" as UnicodeScalar).value) // 65
    
    let choices: [String]
    
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
            ForEach(0..<choices.count) { (index) in
                ChoiceRowView(onButtonTaped: self.onSelectBotton,
                              choice: self.choices[index],
                             select: String(UnicodeScalar(index + self.startingValue) ?? "A"),
                             isOn: self.isSelected(select: String(UnicodeScalar(index + self.startingValue) ?? "A") ) )
            }

        }
        .padding()
    }
}

#if DEBUG
struct ChoicesView_Previews: PreviewProvider {
    static var previews: some View {
        ChoicesView(choices: ["1","2","3","4"])
    }
}
#endif
