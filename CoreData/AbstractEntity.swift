//
//  AbstractEntity.swift
//  CoreData
//
//  Created by Lucas Conceição on 01/09/14.
//  Copyright (c) 2014 Lucas Conceicao. All rights reserved.
//

import Foundation
import CoreData

class AbstractEntity: NSManagedObject{
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: nil)
    }
    
    class func entityDescription() -> (NSEntityDescription) {
        fatalError("Must Override")
    }
    
    func delete(){
        
        let context:NSManagedObjectContext = DataManager.getContext()
        var error:NSError?
        
        context.deleteObject(self)
        do {
            try context.save()
        } catch var error1 as NSError {
            error = error1
        }
        
        if (error != nil){
            NSLog(error!.description)
        }
    }
    
    func salvar(){
        
        let context:NSManagedObjectContext = DataManager.getContext()
        var error:NSError?
        
        if (self.managedObjectContext == nil) {
            context.insertObject(self)
        }
        
        do {
            try context.save()
        } catch var error1 as NSError {
            error = error1
        }
        
        if (error != nil){
            NSLog(error!.description)
        }
    }
    
}