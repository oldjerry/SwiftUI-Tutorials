//
//  Profile.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/18.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import Foundation

struct Profile {
    var username: String
    
    static let `default` = Self(username: "Anonymous")
    
    init ( username: String ) {
        self.username = username
    }
}
