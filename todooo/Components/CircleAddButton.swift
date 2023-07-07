//
//  CircleAddButton.swift
//  todooo
//
//  Created by Rafal Pawelec on 18/03/2023.
//

import SwiftUI

struct CircleAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.primary)
                .frame(width: 60)
            Image(systemName: "plus")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.heavy)
            
        }
        .preferredColorScheme(.dark)
        .frame(height: 60)
    }
}

struct CircleAddButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleAddButton()
    }
}
