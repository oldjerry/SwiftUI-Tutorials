//
//  UserData.swift
//  Landmarks
//
//  Created by Jerry Sun on 2020/2/10.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import Foundation
import SwiftUI
//
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
//
