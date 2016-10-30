//
//  Model.swift
//  CoreData
//
//  Created by Lucas Conceição on 17/08/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import CoreData

class Cidade: AbstractEntity {
    //its the best part!
    @NSManaged var nome:String
    @NSManaged var cadastros:NSArray
    
    override class func entityDescription() -> (NSEntityDescription){
        return DataManager.getEntity("Cidade")
    }
}