//
//  Dog.swift
//  RealmDatabaseDemo
//
//  Created by Adolfho Athyla on 11/11/18.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    
    required init(name: String, age: Int) {
        super.init()
        self.name = name
        self.age = age
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    static func getDogs() -> [Dog]? {
        do {
            let realm = try Realm()
            return Array(realm.objects(Dog.self))
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
    
    static func getDog(name: String) -> Dog? {
        do {
            let realm = try Realm()
            return realm.objects(Dog.self).filter("name = %s", name).first
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
}
