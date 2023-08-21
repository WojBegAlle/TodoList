//
//  ListViewModel.swift
//  TodoList
//
//  Created by Wojciech Begierski on 21/08/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [TodoItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsDataKey: String = "todo_item_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            TodoItemModel(title: "This is the first title", isCompleted: false),
//            TodoItemModel(title: "This is a the second!", isCompleted: true),
//            TodoItemModel(title: "Third!", isCompleted: true),
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsDataKey),
            let savedItems = try? JSONDecoder().decode([TodoItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = TodoItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: TodoItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodeData, forKey: itemsDataKey)
        }
    }
    
}
