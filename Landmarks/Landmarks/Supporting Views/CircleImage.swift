//
//  CircleImage.swift
//  Landmarks
//
//  Created by Jerry Sun on 2020/2/9.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth:4))
            .shadow(radius: 10)

    }
}

#if DEBUG
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
#endif
