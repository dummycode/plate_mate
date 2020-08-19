//
//  PlateRow.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct PlateRow: View {
    var plate: Plate
    
    var body: some View {
        HStack {
            VStack {
                plate.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: 50)
            Text(plate.name)
//            if plate.seen {
//                Text("Seen!")
//            }
            Spacer()
        }
        .padding(10)
    }
}

struct PlateRow_Previews: PreviewProvider {
    static var previews: some View {
        PlateRow(plate: Plate(name: "Georgia", asset: "georgia"))
    }
}
