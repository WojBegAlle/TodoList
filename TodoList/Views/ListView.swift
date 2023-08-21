//
//  ListView.swift
//  TodoList
//
//  Created by Wojciech Begierski on 21/08/2023.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {

            List {
                if listViewModel.items.count != 0 {
                    ForEach(listViewModel.items) { item in
                        TodoListItem(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform:
                                listViewModel.moveItem)
                } else {
                    VStack {
                        Text("Nie masz jeszcze żadnych zadań, dodaj, żeby się tutaj pojawiły")
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }

            }
            .listStyle(PlainListStyle())
            .navigationTitle("Todo List")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: CreateTodoView())
            )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
    }
}
