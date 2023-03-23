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
