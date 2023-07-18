//
//  ItemView.swift
//  Demo
//
//  Created by 沈 立竑 on 2023/07/17.
//

import SwiftUI

struct ItemView: View {
    let name: String
    let price: Int

    var body: some View {
        HStack{
            Text(name)
            Spacer()
            Text("¥\(price)")
        }.padding(.horizontal, 16)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(name: "Test", price: 123)

    }
}
