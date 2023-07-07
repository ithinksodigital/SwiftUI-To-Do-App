//
//  AddTaskView.swift
//  todooo
//
//  Created by Rafal Pawelec on 18/03/2023.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here",text: $title)
                .textFieldStyle(.roundedBorder)
            HStack {
                Spacer()
                Button {
                    
                    if !title.isEmpty {
                        realmManager.addTask(taskTitle: title)
                    }
                    dismiss()
                } label: {
                    Text("Add task")
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                }

            }
            
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .preferredColorScheme(.dark)
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
