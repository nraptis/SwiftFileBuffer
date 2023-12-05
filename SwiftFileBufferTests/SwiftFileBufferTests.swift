//
//  SwiftFileBufferTests.swift
//  SwiftFileBufferTests
//
//  Created by Nicky Taylor on 12/5/23.
//

import XCTest

final class SwiftFileBufferTests: XCTestCase {

    func test100() {
        _testLotsOfRandomFiles(size: 100)
    }
    
    func test1000() {
        _testLotsOfRandomFiles(size: 10000)
    }
    
    func test10000() {
        _testLotsOfRandomFiles(size: 10000)
    }
    
    func test100000() {
        _testLotsOfRandomFiles(size: 100000)
    }
    
    func test1000000_01() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_02() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_03() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_04() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_05() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_06() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_07() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_08() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_09() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_10() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_11() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_12() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_13() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_14() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_15() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_16() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_17() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_18() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_19() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    func test1000000_20() {
        _testLotsOfRandomFiles(size: 1000000)
    }
    
    static func randomData() -> Data {
        randomData(length: Int.random(in: 0...512))
    }
    
    static func randomData(length: Int) -> Data {
        var dataBytes = [UInt8](repeating: 0, count: length)
        var index = 0
        while index < length {
            dataBytes[index] = UInt8.random(in: 0...255)
            index += 1
        }
        return Data(dataBytes)
    }
    
    enum TestNodeHardcore {
        case data(Data)
        case string(String)
        case int8(Int8)
        case uint8(UInt8)
        case uint16(UInt16)
        case int16(Int16)
        case float32(Float32)
        case int32(Int32)
        case uint32(UInt32)
        case float64(Float64)
        case uint64(UInt64)
        case int64(Int64)
        case bool(Bool)
        
        static func random() -> TestNodeHardcore {
            let choice = Int.random(in: 0...12)
            if choice == 0 {
                let data = SwiftFileBufferTests.randomData()
                return TestNodeHardcore.data(data)
            } else if choice == 1 {
                let string = String.randomUTF8String(length: Int.random(in: 0...255))
                return TestNodeHardcore.string(string)
            } else if choice == 2 {
                return TestNodeHardcore.int8(Int8.random(in: Int8.min...Int8.max))
            } else if choice == 3 {
                return TestNodeHardcore.uint8(UInt8.random(in: UInt8.min...UInt8.max))
            } else if choice == 4 {
                return TestNodeHardcore.uint16(UInt16.random(in: UInt16.min...UInt16.max))
            } else if choice == 5 {
                return TestNodeHardcore.int16(Int16.random(in: Int16.min...Int16.max))
            } else if choice == 6 {
                return TestNodeHardcore.float32(Float32.random(in: -1000.0...1000.0))
            } else if choice == 7 {
                return TestNodeHardcore.int32(Int32.random(in: Int32.min...Int32.max))
            } else if choice == 8 {
                return TestNodeHardcore.uint32(UInt32.random(in: UInt32.min...UInt32.max))
            } else if choice == 9 {
                return TestNodeHardcore.float64(Float64.random(in: -1000.0...1000.0))
            } else if choice == 10 {
                return TestNodeHardcore.uint64(UInt64.random(in: UInt64.min...UInt64.max))
            } else if choice == 11 {
                return TestNodeHardcore.int64(Int64.random(in: Int64.min...Int64.max))
            } else {
                return TestNodeHardcore.bool(Bool.random())
            }
        }
    }
    
    func _testLotsOfRandomFiles(size: Int) {
        var loop = 0
        while loop < size {
            loop += 1
            if size > 100 {
                if ((loop % 10000) == 0) || (loop == size) {
                    let percent = Float(loop) / Float(size)
                    let percentString = String(format: "%.1f%%", percent * 100.0)
                    if loop == size {
                        print("Done: \(loop) of \(size) @ \(percentString)")
                    } else {
                        print("Loop: \(loop) of \(size) @ \(percentString)")
                    }
                }
            }
            
            let count = Int.random(in: 1...255)
            let fileBuffer = FileBuffer()
            var testNodes = [TestNodeHardcore]()
            var loop = 0
            while loop < count {
                let testNode = TestNodeHardcore.random()
                testNodes.append(testNode)
                switch testNode {
                case .data(let data):
                    fileBuffer.writeData(data)
                case .string(let string):
                    fileBuffer.writeString(string)
                case .int8(let int8):
                    fileBuffer.writeInt8(int8)
                case .uint8(let uInt8):
                    fileBuffer.writeUInt8(uInt8)
                case .uint16(let uInt16):
                    fileBuffer.writeUInt16(uInt16)
                case .int16(let int16):
                    fileBuffer.writeInt16(int16)
                case .float32(let float32):
                    fileBuffer.writeFloat32(float32)
                case .int32(let int32):
                    fileBuffer.writeInt32(int32)
                case .uint32(let uInt32):
                    fileBuffer.writeUInt32(uInt32)
                case .float64(let float64):
                    fileBuffer.writeFloat64(float64)
                case .uint64(let uInt64):
                    fileBuffer.writeUInt64(uInt64)
                case .int64(let int64):
                    fileBuffer.writeInt64(int64)
                case .bool(let bool):
                    fileBuffer.writeBool(bool)
                }
                loop += 1
            }
            
            for testNode in testNodes {
                switch testNode {
                case .data(let value):
                    if let readValue = fileBuffer.readData() {
                        if value != readValue {
                            print("data mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("data miss...")
                    }
                    
                case .string(let value):
                    if let readValue = fileBuffer.readString() {
                        if value != readValue {
                            print("string mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("string miss...")
                    }
                case .int8(let value):
                    if let readValue = fileBuffer.readInt8() {
                        if value != readValue {
                            print("int8 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("int8 miss...")
                    }
                case .uint8(let value):
                    if let readValue = fileBuffer.readUInt8() {
                        if value != readValue {
                            print("uint8 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("uint8 miss...")
                    }
                case .uint16(let value):
                    if let readValue = fileBuffer.readUInt16() {
                        if value != readValue {
                            print("uint16 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("uint16 miss...")
                    }
                case .int16(let value):
                    if let readValue = fileBuffer.readInt16() {
                        if value != readValue {
                            print("int16 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("int16 miss...")
                    }
                case .float32(let value):
                    if let readValue = fileBuffer.readFloat32() {
                        if value != readValue {
                            print("float32 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("float32 miss...")
                    }
                case .int32(let value):
                    if let readValue = fileBuffer.readInt32() {
                        if value != readValue {
                            print("int32 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("int32 miss...")
                    }
                case .uint32(let value):
                    if let readValue = fileBuffer.readUInt32() {
                        if value != readValue {
                            print("uint32 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("uint32 miss...")
                    }
                case .float64(let value):
                    if let readValue = fileBuffer.readFloat64() {
                        if value != readValue {
                            print("float64 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("float64 miss...")
                    }
                case .uint64(let value):
                    if let readValue = fileBuffer.readUInt64() {
                        if value != readValue {
                            print("uint64 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("uint64 miss...")
                    }
                case .int64(let value):
                    if let readValue = fileBuffer.readInt64() {
                        if value != readValue {
                            print("int64 mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("int64 miss...")
                    }
                case .bool(let value):
                    if let readValue = fileBuffer.readBool() {
                        if value != readValue {
                            print("bool mismatch \(value) vs \(readValue)")
                        }
                    } else {
                        XCTFail("bool miss...")
                    }
                }
            }
        }
    }
}

extension String {
    static func randomUTF8String(length: Int) -> String {
        let valid: [Character] = ["\0", "\u{01}", "\u{02}", "\u{03}", "\u{04}", "\u{05}", "\u{06}", "\u{07}", "\u{08}",
                                  "\t", "\n", "\u{0B}", "\u{0C}", "\r", "\u{0E}", "\u{0F}", "\u{10}", "\u{11}", "\u{12}",
                                  "\u{13}", "\u{14}", "\u{15}", "\u{16}", "\u{17}", "\u{18}", "\u{19}", "\u{1A}", "\u{1B}",
                                  "\u{1C}", "\u{1D}", "\u{1E}", "\u{1F}", " ", "!", "\"", "#", "$", "%", "&", "\'", "(", ")",
                                  "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@",
                                  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
                                  "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`",
                                  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
                                  "w", "x", "y", "z", "{", "|", "}", "~", "\u{7F}", "�"]
        var array = [Character]()
        var index = 0
        while index < length {
            let letter = valid[Int.random(in: 0..<valid.count)]
            array.append(letter)
            index += 1
        }
        return String(array)
    }
}
