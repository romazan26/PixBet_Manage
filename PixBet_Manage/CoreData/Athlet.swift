//
//  Athlet+CoreDataProperties.swift
//
//
//  Created by Роман on 29.10.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Athlet)
public class Athlet: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Athlet> {
        return NSFetchRequest<Athlet>(entityName: "Athlet")
    }

    @NSManaged public var age: Int16
    @NSManaged public var descript: String?
    @NSManaged public var name: String?
    @NSManaged public var foto: UIImage?
    @NSManaged public var gender: Bool
    @NSManaged public var height: Int16
    @NSManaged public var weight: Int16
    @NSManaged public var group: Group?

}

extension Athlet : Identifiable {

}
