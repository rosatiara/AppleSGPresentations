//
//  HealthEyes.swift
//  AppleSingaporePresentations
//
//  Created by Rosa Tiara Galuh on 17/09/24.
//


// HKContactsPrescription
// HKContactsLensSpecification

import HealthKit

/*
 Explanations:
 A written prescription usually includes the following specifications:
 - base curve,
 - diameter,
 - power (or sphere),
 - additional figures for Cylinder and Axis if you have astigmatism
 - addition and Dominant figures for presbyopia correction.
 */


// Diopter
 /// The higher the number of diopters, the stronger the power of the glasses. The higher the number, the closer we're be able to see.
 /// lenses for myopia (rabun jauh) has negative diopter value, whereas hyperophia is positive

let sphere = HKQuantity(unit: .diopter(), doubleValue: -0.75)
let cylinder = HKQuantity(unit: .diopter(), doubleValue: -0.5)
let axis = HKQuantity(unit: .degreeAngle(), doubleValue: 155.0)
let addPower = HKQuantity(unit: .diopter(), doubleValue: +2.00)
let baseCurve = HKQuantity(unit: HKUnit.meterUnit(with: .milli),
                           doubleValue: 9.0)


let diameter = HKQuantity(unit: HKUnit.meterUnit(with: .milli),
                          doubleValue: 12.0)

let contactsRightEye = HKContactsLensSpecification(sphere: sphere,
                                                   cylinder: cylinder,
                                                   axis: axis,
                                                   addPower: addPower,
                                                   baseCurve: baseCurve,
                                                   diameter: diameter)

let contactsLeftEye = HKContactsLensSpecification(sphere: sphere,
                                                   cylinder: cylinder,
                                                   axis: axis,
                                                   addPower: addPower,
                                                   baseCurve: baseCurve,
                                                   diameter: diameter)

let dateIssued = Date()
let expirationDate = dateIssued.addingTimeInterval(60 * 24 * 365)
let prescription = HKContactsPrescription(rightEyeSpecification: contactsRightEye,
                                          leftEyeSpecification: contactsLeftEye,
                                          brand: "MyBrand Name",
                                          dateIssued: dateIssued,
                                          expirationDate: expirationDate,
                                          device: HKDevice.local(),
                                          metadata: nil)
