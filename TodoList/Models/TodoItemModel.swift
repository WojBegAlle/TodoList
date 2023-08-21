//
//  TodoItemModel.swift
//  TodoList
//
//  Created by Wojciech Begierski on 21/08/2023.
//

import Foundation

struct TodoItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TodoItemModel {
        return TodoItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
