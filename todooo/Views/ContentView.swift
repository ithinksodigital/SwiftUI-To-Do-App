//
//  ContentView.swift
//  todooo
//
//  Created by Rafal Pawelec on 17/03/2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
    
//    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            TaskView()
//                .environmentObject(realmManager)
//
//            CircleAddButton()
//                .padding()
//                .onTapGesture {
//                    showAddTaskView.toggle()
//                }
//        }
//        .sheet(isPresented: $showAddTaskView) {
//            AddTaskView()
//                .environmentObject(realmManager)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
//    }
//}

    var body: some View {
        ZStack(alignment: .bottomTrailing){
            TaskView()
                .environmentObject(realmManager)

            CircleAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }

        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
                .presentationDetents([.fraction(0.2)])

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .preferredColorScheme(.dark)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
