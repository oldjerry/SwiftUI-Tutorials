//
//  Examination.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import Foundation
import SwiftUI


struct Exam: Decodable, Identifiable {
    var id: Int
    var type: QuizType
    var question: String
    var choices: [String]
    var answers: Set<String>
    var selected: Set<String>
    fileprivate var imageName: String
    
    var isRight: Bool {
        get {
            return answers == selected
        }
    }
    
    enum QuizType: String, CaseIterable, Codable, Hashable {
        case Single = "Single"   //Single choice
        case Multiple = "Multiple" //Multiple choice
    }
    
    enum SelectType: String, CaseIterable, Codable, Hashable {
        case A = "A"
        case B = "B"
        case C = "C"
        case D = "D"
    }
}

extension Exam {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
