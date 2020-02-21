//
//  ChoseRowView.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/19.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct ChoseRowView: View {
    
    private var isOn: Bool = true
    
    var body: some View {
        HStack {
            ZStack (alignment: .leading) {
                Rectangle (
                )
                    .frame(height: 50)
                    .foregroundColor(Color.white)
                    .cornerRadius(5)
                    .padding()
                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 1, y: 2)
                
                HStack {
                    Button(action: {}){
                        Image(systemName: "chevron.left")
                            .frame(width: 45, height: 45, alignment: .center)
                            .clipped()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(5)
                            .foregroundColor(self.isOn ? Color.gray : Color.white)
                        
                    }
                   // .offset(x: 5, y: 0)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                   // .padding(.trailing)
                    .animation(.default)
                    
                    Text("Test")
                }
            }
            
            
        }
        .padding()
    }
}

#if DEBUG
struct ChoseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChoseRowView()
    }
}
#endif
