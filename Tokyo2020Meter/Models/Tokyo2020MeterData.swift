//
//  Tokyo2020MeterData.swift
//  Tokyo2020Meter
//
//  Created by 露峰光 on 2020/10/02.
//

import Foundation
import Combine

struct Tokyo2020MeterData {
     var remaining:Date? {
        let dateComponentFor2020 = DateComponents(year:2021,month: 7,day: 23,hour: 20)
        let dateFor2020 = Calendar.current.date(from: dateComponentFor2020)
        return dateFor2020
    }
    var remainingHours:Date? {
        let dayToday = Calendar.current.dateComponents(in: TimeZone.current, from: Date())
        let todayEight = DateComponents(calendar: Calendar.current, year: dayToday.year,month: dayToday.month,day:dayToday.day,hour: 20)
        let remainingHours = Calendar.current.date(from: todayEight)
        return remainingHours
   }
}
