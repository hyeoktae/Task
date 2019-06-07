//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by hyeoktae kwon on 2019/06/05.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
                HStack {
                    Text("Joshua Tree National Parks")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                    
                }
        }
        .padding()
    }
}

#if DEBUG
struct ContentViewPreviews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
