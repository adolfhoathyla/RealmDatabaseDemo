//
//  ViewController.swift
//  RealmDatabaseDemo
//
//  Created by Adolfho Athyla on 11/11/18.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let person = Person(name: "Pogba", picture: nil, dogs: [Dog.getDog(name: "Clesis")!])
        person.save()
        */
        let people = Person.getPeople()
        print(people)
    }


}

