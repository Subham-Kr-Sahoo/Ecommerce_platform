//
//  UserImageModel.swift
//  Online-Groceries
//
//  Created by Subham  on 27/08/24.
//

import Foundation
import SwiftUI

struct UserImageModel : Hashable{
    let name : String
    let image : String
    let backgroundColor : String
    let number : Int
}

let imageArray : [UserImageModel] = [
    UserImageModel(name: "Chill Crawler", image: "sloth", backgroundColor: "CCB893",number: 0),
    UserImageModel(name: "Etheral Phantom", image: "ghost", backgroundColor: "949191" ,number: 0),
    UserImageModel(name: "Ancient Giant", image: "dinosaur", backgroundColor: "CFEDB7",number: 0),
    UserImageModel(name: "Silent Hunter", image: "cat", backgroundColor: "6D7A67",number: 0),
    UserImageModel(name: "Sky Dancer", image: "birdy", backgroundColor: "E3DAC5",number: 0),
    UserImageModel(name: "Clever Paws", image: "foxy", backgroundColor: "CDB2DB",number: 0),
    UserImageModel(name: "Grubby Snout", image: "piggy", backgroundColor: "DEBAE3",number: 0),
    UserImageModel(name: "Loyal Buddy", image: "doggo", backgroundColor: "B5A1BF",number: 0),
    UserImageModel(name: "Celestial Spark", image: "star.fill", backgroundColor: "E8CB8B",number: 1),
    UserImageModel(name: "Fiery Glow", image: "flame.fill", backgroundColor: "F76D6D",number: 1),
    UserImageModel(name: "Green Vein", image: "leaf.fill", backgroundColor: "B0D6D5",number: 1),
    UserImageModel(name: "Love Core", image: "heart.fill", backgroundColor: "F0ADCD",number: 1)
]
