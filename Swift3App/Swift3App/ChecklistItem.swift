//
//  ChecklistItem.swift
//  Swift3App
//
//  Created by caozhuo on 2017/1/24.
//  Copyright © 2017年 caozhuo. All rights reserved.
//

import Foundation

class ChecklistItem{
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked
    }
}
