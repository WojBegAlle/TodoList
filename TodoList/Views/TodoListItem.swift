//
//  TodoListItem.swift
//  TodoList
//
//  Created by Wojciech Begierski on 21/08/2023.
//

import SwiftUI

struct TodoListItem: View {
    
    let item: TodoItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            if item.isCompleted {
                Text(item.title)
                     .strikethrough(true, color: .black)
            } else {
                Text(item.title)
            }
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct TodoListItem_Previews: PreviewProvider {
    
    static var item1 = TodoItemModel(title: "First title!", isCompleted: false)
    static var item2 = TodoItemModel(title: "Second title!", isCompleted: true)
    
    static var previews: some View {
        Group {
            TodoListItem(item: item1)
            TodoListItem(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
