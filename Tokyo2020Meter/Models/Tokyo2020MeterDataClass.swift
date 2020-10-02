//
//  Tokyo2020MeterDataClass.swift
//  Tokyo2020Meter
//
//  Created by 露峰光 on 2020/10/02.
//

import Foundation
import Combine

class Tokyo2020MeterDataClass:ObservableObject {
    @Published var remaining:Date = Date()
    @Published var ramainingHours:Date = Date()
    
    init(){
        getRemainings()
    }
    
    private func getRemainings(){
        self.remaining = Tokyo2020MeterData().remaining ?? Date()
        self.ramainingHours = Tokyo2020MeterData().remainingHours ?? Date()
        print("updating")
    }
}
