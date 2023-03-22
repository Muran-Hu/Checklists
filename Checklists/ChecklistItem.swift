//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Mac on 2023/3/22.
//

import Foundation

struct CheckListItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
