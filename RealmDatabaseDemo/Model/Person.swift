//
//  Person.swift
//  RealmDatabaseDemo
//
//  Created by Adolfho Athyla on 11/11/18.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil
    let dogs = List<Dog>()
    
    required init(name: String, picture: Data?, dogs: [Dog]) {
        super.init()
        self.name = name
        self.picture = picture
        self.dogs.append(objectsIn: dogs)
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
    
    static func getPeople() -> [Person]? {
        do {
            let realm = try Realm()
            return Array(realm.objects(Person.self))
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
}
