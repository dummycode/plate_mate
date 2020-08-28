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
    @State var seen: Bool
    @Binding var changed: Int
    
    var body: some View {
        HStack {
            VStack {
                plate.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 50)
            Text(plate.name!)
            
            Spacer()
            
            if seen {
                Text("👀")
            }
        }
        .padding(10)
        .contentShape(Rectangle())
        .onTapGesture {
            self.changed += 1
            self.plate.seen = !self.plate.seen
            withAnimation(.easeOut(duration: 0.2)) {
                self.seen = self.plate.seen
            }
            do {
                try CoreDataManager.shared.mainContext.save()
            } catch {
                print("Error deleting game")
            }
        }
    }
}

struct PlateRow_Previews: PreviewProvider {
    @State static var plate = Plate()
    @State static var changed = 0
    
    static var previews: some View {
        plate.name = "Georgia"
        plate.imageName = "georgia"
        plate.seen = false
        
        return PlateRow(plate: $plate, seen: plate.seen, changed: $changed)
    }
}
