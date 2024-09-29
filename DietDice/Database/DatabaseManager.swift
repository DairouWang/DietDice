//
//  DatabaseManager.swift
//  DietDice
//
//  Created by Darol on 8/19/24.
//

import Foundation
import GRDB

var dbQueue: DatabaseQueue!

class DatabaseManager {
    
    static func setup(for applictation: DietDiceApp) throws {
        let databaseURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("recipes.sqlite")
        dbQueue = try! DatabaseQueue(path: databaseURL.path)
        dbQueue.setupMemoryManagement(in: applictation)
    }
}
