//
//  NewChecklistItemView.swift
//  Checklists
//
//  Created by Muran Hu on 2023/3/23.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: self.$newItemName)
                Button(action: {
                    let newChecklistItem = CheckListItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printAll()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
