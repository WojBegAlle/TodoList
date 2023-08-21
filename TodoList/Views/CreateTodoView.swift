//
//  CreateTodoView.swift
//  TodoList
//
//  Created by Wojciech Begierski on 21/08/2023.
//

import SwiftUI

struct CreateTodoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = "";
    @State var backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    
    @State var altertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(backgroundColor))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed,
                    label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Create a Todo Task ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if isTextValid() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }

    }
    
    func isTextValid() -> Bool {
        if(textFieldText.isEmpty) {
            altertTitle = "Your task can not be empty!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(altertTitle))
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateTodoView()
        }.environmentObject(ListViewModel())
    }
}
