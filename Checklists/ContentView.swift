//
//  ContentView.swift
//  Checklists
//
//  Created by Mac on 2023/3/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkListItems = [
        "Walk the dog",
        "Brush my teeth",
        "Learn iOS development",
        "Soccer practice",
        "Eat ice cream"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(checkListItems, id: \.self) { item in
                    Text(item)
                        .onTapGesture {
                            let indexsToRemove = IndexSet(integersIn: 0...4)
                            self.checkListItems.remove(atOffsets: indexsToRemove)
//                            self.checkListItems.remove(at: 0)
//                            self.checkListItems.append(item + "\(Int.random(in: 1...10))")
                            self.printAll()
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
        ContentView()
    }
}
