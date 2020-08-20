//
//  PlateList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateList: View {
    @State var text: String = ""
    @State private var isEditing = false
    
    var body: some View {
        VStack {
           HStack {
               TextField("Search...", text: $text)
                   .padding(7)
                   .padding(.horizontal, 25)
                   .background(Color(.systemGray6))
                   .cornerRadius(8)
                   .padding(.horizontal, 10)
                   .onTapGesture {
                       self.isEditing = true
                   }
    
               if isEditing {
                   Button(action: {
                       self.isEditing = false
                       self.text = ""
    
                   }) {
                       Text("Cancel")
                   }
                   .padding(.trailing, 10)
                   .transition(.move(edge: .trailing))
                   .animation(.default)
               }
            }
            
            List(plateData.filter({ text.isEmpty ? true : $0.name.contains(text) })) { plate in
                    PlateRow(plate: plate)
                    .onTapGesture {
                        print("Tapped")
                    }
            }
        }
    }
}

struct PlateList_Previews: PreviewProvider {
    static var previews: some View {
        PlateList()
    }
}
