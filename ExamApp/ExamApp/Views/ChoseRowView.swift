//
//  ChoseRowView.swift
//  ExamApp
//
//  Created by Jerry Sun on 2020/2/19.
//  Copyright © 2020 Jerry Sun. All rights reserved.
//

import SwiftUI

struct ChoseRowView {
    
    private let onButtonTaped: (_ select:String) -> Void
    private let select: String
    private let isOn : Bool
    
    
    init(onButtonTaped action:  @escaping ((_ select:String) -> Void), select: String, isOn: Bool ) {
        self.onButtonTaped = action
        self.isOn = isOn
        self.select = select
    }

}

extension  ChoseRowView: View {
    var body: some View {
        HStack {
            ZStack (alignment: .leading) {
                Rectangle ()
                    .frame(height: 45)
                    .foregroundColor(Color.white)
                    .cornerRadius(5)
                    .padding()
                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 1, y: 2)

                HStack {
                    Button(action: {self.onButtonTaped(self.select)}){
                        ZStack {
                            Rectangle ()
                                .frame(width: 40, height: 40 )
                                .foregroundColor(isOn ? Color.black.opacity(0.8) : Color.gray.opacity(0.4))
                                .cornerRadius(5)
                                .padding()
                            Text(self.select)
                                .font(.headline)
                                .foregroundColor(isOn ? Color.white : Color.black)
                        }


                    }
                    // .offset(x: 5, y: 0)
                    // .padding(.trailing)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10))
                    .animation(.default)

                    Text("Test")
                }
            }
            
        }
        .frame(height: 50)
      //  .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

#if DEBUG
struct ChoseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChoseRowView(onButtonTaped: {_ in}, select: "A", isOn: true )
    }
}
#endif
