//
//  UserManager.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import Foundation
import SwiftUI
//
import Combine

final class User: ObservableObject {
    @Published var exams = examData
    @Published var profile = Profile.default
    @Published var currentIndex = 0
    
    var isFirstQuiz: Bool {
        get {
            return currentIndex == 0
        }
    }
    
    var isLastQuiz: Bool {
        get {
            return currentIndex == exams.count - 1
        }
    }
    
    var quizCount: Int {
        get {
            return exams.count
        }
    }
    
    func getCurrQuizIndex() -> Int {
        return currentIndex
    }
    
    func getQuizNumofCounttoString() -> String
    {
        return "\(currentIndex+1)/\(exams.count)"
    }
    
    func getUserName() -> String {
        return profile.username
    }
    
    func getCurrentExam() -> Exam {
        return exams[currentIndex]
    }
    
    func setPrevQuizIndex() -> Void {
        currentIndex = (currentIndex > 0) ? currentIndex-1 : 0
    }
    
    func setNextQuizIndex() -> Void {
        currentIndex = (currentIndex < exams.count-1) ? currentIndex+1 : exams.count-1
    }
}
