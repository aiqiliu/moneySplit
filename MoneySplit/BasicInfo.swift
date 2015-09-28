//
//  buyerInfo.swift
//  MoneySplit
//
//  Created by Aiqi Liu on 9/26/15.
//  Copyright (c) 2015 Aiqi Liu. All rights reserved.
//

import Foundation
class basicInfo{
    var myName : [String] = []
    var otherNames : [String] = []
    
    //selected buyer from picker
    var selectedBuyer = ""
    //adjusted to edit when num par is selectable
    var numPar: Double = 1.0
    //money owed to otherNames buyer
    var splited = [Double](count: (0), repeatedValue: 0.0)

    //row index selected in picker
    var rowIndex: Int = 0
    //three empty string holders for each otherBuyer
    var display :[String] = []
}
