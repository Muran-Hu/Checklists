//
//  CheckListView.swift
//  Checklists
//
//  Created by Mac on 2023/3/20.
//

import SwiftUI

struct CheckListView: View {
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items.indices, id: \.self) { index in
                    RowView(checklistItem: self.$checklist.items[index])
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(
                leading: Button(action: {
                    self.newChecklistItemViewIsVisible = true
                }){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                }
                    .sheet(isPresented: self.$newChecklistItemViewIsVisible){
                        NewChecklistItemView(checklist: self.checklist)
                    },
                trailing: EditButton())
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
