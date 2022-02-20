//
//  MyStockModel.swift
//  MintApp
//
//  Created by David Yoon on 2022/02/20.
//

import Foundation


struct MyStock: Decodable {
    let stockName: String
    let currentPrice: Int
    let stockQuantity: Float
    let valueChange: Int
    let percentChange: Float
}
