//
//  RowView.swift
//  Checklists
//
//  Created by Mac on 2023/3/23.
//

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: CheckListItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) {
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "☑️")
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(CheckListItem(name: "Sample item")))
    }
}
