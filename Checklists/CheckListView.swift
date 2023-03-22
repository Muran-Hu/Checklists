//
//  CheckListView.swift
//  Checklists
//
//  Created by Mac on 2023/3/20.
//

import SwiftUI

struct CheckListView: View {
    
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { checkListItem in
                    HStack {
                        Text(checkListItem.name)
                        Spacer()
                        Text(checkListItem.isChecked ? "✅" : "☑️")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = checklist.items.firstIndex(where: {$0.id == checkListItem.id}) {
                            checklist.items[matchingIndex].isChecked.toggle()
                        }
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
            .navigationTitle("Checklist")
            .onAppear() {
                checklist.printAll()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
