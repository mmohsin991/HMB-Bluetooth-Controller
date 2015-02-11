//
//  Constants.swift
//  HMB Bluetooth Controller
//
//  Created by Mohsin on 07/02/2015.
//  Copyright (c) 2015 HMB-TEC. All rights reserved.
//

import UIKit


let redColor = UIColor(red: 175.0/255.0, green: 25.0/255.0, blue: 27.0/255.0, alpha: 1.0)

// define pre-define rooms and device types 
var roomsTypeGloble = ["BAD", "WC","KELLER", "KINDERZIMMER", "BALKON", "BURO", "ESSZIMMER", "TERRASSE", "HOBBYRAUM","FLUR"]
var deviceTypeGloble = ["LAMPE","VENTILATOR","BACKOFEN", "STEHLAMPE", "LED STRIPE", "ROLLO", "MARKISE", "STECKDOSE", "DIVERSES"]


var devicesGloble = ["DEVICE1": "LAMPE","DEVICE2": "BACKOFEN","DEVICE3": "VENTILATOR","DEVICE4": "MARKISE","DEVICE5": "STECKDOSE"]

// define the room name and type of room
var roomsGloble = ["ROOM1":"BAD", "ROOM2":"KINDERZIMMER", "ROOM3":"BALKON", "ROOM4":"BURO","ROOM5":"ESSZIMMER"]

// define overall structure of the home
var homeArchGloble : [String: [String:String]] = [
    "ROOM1" : ["DEVICE1": "LAMPE","DEVICE2": "BACKOFEN","DEVICE3": "VENTILATOR","DEVICE4": "MARKISE","DEVICE5": "STECKDOSE"],
    "ROOM2" : ["DEVICE1": "BACKOFEN","DEVICE2": "MARKISE","DEVICE3": "VENTILATOR"],
    "ROOM3" : ["DEVICE1": "BACKOFEN","DEVICE2": "BACKOFEN","DEVICE3": "STECKDOSE","DEVICE4": "MARKISE"],
    "ROOM4" : ["DEVICE1": "VENTILATOR"],
    "ROOM5" : ["DEVICE1": "LAMPE","DEVICE2": "LED STRIPE","DEVICE3": "VENTILATOR","DEVICE4": "MARKISE","DEVICE5": "STECKDOSE","DEVICE6": "STECKDOSE"],
]

var selectedRoomNameGloble = String()