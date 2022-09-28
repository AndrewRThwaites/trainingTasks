//
//  Note+CoreDataProperties.swift
//  NewNotes
//
//  Created by Andrew Thwaites on 26/09/2022.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var note: String?
    @NSManaged public var created: Date?
    @NSManaged public var modified: NSObject?

}

extension Note : Identifiable {

}
