//
//  DateFormatHelper.swift
//  DinesTest
//
//  Created by Adam Richardson on 16/02/2023.
//

import Foundation

class DateFormatHelper {
    static let shared = DateFormatHelper()
    
    func getDisplyDateFormat() -> String {
        return "dd/MM/yyyy - HH:MM"
    }
    
    func getDateAsString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = self.getDisplyDateFormat()
        return formatter.string(from: date)
    }
}
