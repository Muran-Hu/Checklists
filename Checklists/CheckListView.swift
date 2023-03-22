//
//  CheckListView.swift
//  Checklists
//
//  Created by Mac on 2023/3/20.
//

import SwiftUI

struct CheckListItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct CheckListView: View {
    
    @State var checkListItems = [
        CheckListItem(name: "Walk the dog"),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Soccer practice"),
        CheckListItem(name: "Eat ice cream")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checkListItems) { checkListItem in
                    HStack {
                        Text(checkListItem.name)
                        Spacer()
                        Text(checkListItem.isChecked ? "✅" : "☑️")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = checkListItems.firstIndex(where: {$0.id == checkListItem.id}) {
                            checkListItems[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
            .navigationTitle("Checklist")
            .onAppear() {
                self.printAll()
            }
        }
    }
    
    func printAll() {
        for item in checkListItems {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        checkListItems.remove(atOffsets: whichElement)
        printAll()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        checkListItems.move(fromOffsets: whichElement, toOffset: destination)
        printAll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
