//
//  SerializedTests.swift
//  Swift Testing ReferenceTests
//
//  Created by Lal Castro Antony on 05/02/25.
//

import Testing
import Foundation

@Suite(.serialized)
struct SerializedTests {

    @Test(.tags(.create)) func makeCupCake() async throws {
        print("Making Cupcake")
        sleep(5)
    }
    
    @Test func eatCupCake() async throws {
        print("Eating Cupcake")
    }

}
