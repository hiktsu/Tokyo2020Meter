//
//  ContentView.swift
//  Tokyo2020Meter
//
//  Created by 露峰光 on 2020/10/02.
//

import SwiftUI

struct ContentView: View {
    @State var tokyo2020Meter = Tokyo2020MeterDataClass()
    var body: some View {
        VStack{
            Text("Tokyo 2020 opening ceremony is scheduled to start at 8PM July,23 2021")
            Text(tokyo2020Meter.remaining,style: .relative)
            HStack {
                Text(tokyo2020Meter.ramainingHours,style: .timer)
                Text("To Go")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
