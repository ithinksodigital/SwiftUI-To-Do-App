//
//  TaskView.swift
//  todooo
//
//  Created by Rafal Pawelec on 18/03/2023.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
                Text("Ordinary to do list")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                            
            List {
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }
                            .swipeActions(edge: .leading) {
                                Button() {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                } label: {
                                    Label("Mark as done", systemImage: task.completed ? "arrow.counterclockwise" : "checkmark")
                                }
                                .tint(task.completed ? .blue : .green)

                            }
                    }
                    
                }
                
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            .listStyle(.plain)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(.dark)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
