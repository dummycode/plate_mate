//
//  PlateRow.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateRow: View {
    @Binding var plate: Plate
    @Binding var changed: Int
    @Binding var text: String
    @Binding var showSeen: Bool
    @State var showPlate = false
    
    var body: some View {
        if shouldShowPlate() {
             HStack {
                VStack {
                    plate.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: 50)
                Text(plate.name!)
                
                Spacer()
                
                if plate.seen {
                    Text("👀")
                }
            }
            .padding(10)
            .contentShape(Rectangle())
            .onTapGesture {
                self.changed += 1
                
                self.plate.seen = !self.plate.seen
                
                withAnimation(.easeOut(duration: 0.5)) {
                    self.plate.seen = self.plate.seen
                }
                
                do {
                    try CoreDataManager.shared.mainContext.save()
                } catch {
                    print("Error updating row")
                }
            }
        }
    }
    
    func shouldShowPlate() -> Bool {
        if changed < 0 {
            return false
        }
        
        let shouldShow = showSeen || !plate.seen
        let shouldFilter = !text.isEmpty && !plate.name!.lowercased().contains(text.lowercased())
        
        return shouldShow && !shouldFilter
    }
}

struct PlateRow_Previews: PreviewProvider {
    @State static var plate = Plate()
    @State static var changed = 0
    @State static var text = ""
    @State static var showSeen = false
    
    static var previews: some View {
        plate.name = "Georgia"
        plate.imageName = "georgia"
        plate.seen = false
        
        return PlateRow(plate: $plate, changed: $changed, text: $text, showSeen: $showSeen)
    }
}
