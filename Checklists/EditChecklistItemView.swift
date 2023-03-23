//
//  EditChecklistItemView.swift
//  Checklists
//
//  Created by Mac on 2023/3/23.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    @State var checklistItem: CheckListItem
    
    var body: some View {
        Form {
            TextField("name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: CheckListItem(name: "Sample item"))
    }
}
