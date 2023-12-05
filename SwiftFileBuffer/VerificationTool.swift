//
//  VerificationTool.swift
//  SwiftFileBuffer
//
//  Created by Nicky Taylor on 12/5/23.
//

import Foundation

class VerificationTool: ObservableObject {
    
    @Published var relativePath = "my_folder/my_file.dat"
    
    var fullFilePath: String {
        
        let documentsDirectory: String
#if os(macOS)
        documentsDirectory = FileManager.default.currentDirectoryPath
#else
        documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
#endif
        return documentsDirectory + "/" + relativePath
    }
    
    func save() {
        
        let fileBuffer = FileBuffer()
        
        fileBuffer.writeBool(true)
        fileBuffer.writeBool(false)
        fileBuffer.writeInt8(-13)
        fileBuffer.writeUInt8(14)
        fileBuffer.writeInt16(-15)
        fileBuffer.writeUInt16(16)
        fileBuffer.writeInt32(-17)
        fileBuffer.writeUInt32(18)
        fileBuffer.writeInt64(-19)
        fileBuffer.writeUInt64(20)
        fileBuffer.writeFloat32(1.5)
        fileBuffer.writeFloat64(2.12512512005)
        fileBuffer.writeData(Data([0, 1, 2, 3]))
        fileBuffer.writeString("👙 Example 🧠 String 👙")
        
        fileBuffer.save(filePath: fullFilePath)
        print("File saved to: \(fullFilePath)")
    }
    
    func load() {
        
        let fileBuffer = FileBuffer()
        fileBuffer.load(filePath: fullFilePath)
        
        if fileBuffer.isEmpty {
            print("No data loaded from: \(fullFilePath)")
            return
        }

        if let bool = fileBuffer.readBool() {
            print("Read Bool: \(bool)")
        } else {
            print("Expected Bool, Bad Read!")
            return
        }
        
        if let bool = fileBuffer.readBool() {
            print("Read Bool: \(bool)")
        } else {
            print("Expected Bool, Bad Read!")
            return
        }
        
        if let int8 = fileBuffer.readInt8() {
            print("Read Int8: \(int8)")
        } else {
            print("Expected Int8, Bad Read!")
            return
        }
        
        if let uint8 = fileBuffer.readUInt8() {
            print("Read UInt8: \(uint8)")
        } else {
            print("Expected UInt8, Bad Read!")
            return
        }
        
        if let int16 = fileBuffer.readInt16() {
            print("Read Int16: \(int16)")
        } else {
            print("Expected Int16, Bad Read!")
            return
        }
        
        if let uint16 = fileBuffer.readUInt16() {
            print("Read UInt16: \(uint16)")
        } else {
            print("Expected UInt16, Bad Read!")
            return
        }
        
        if let int32 = fileBuffer.readInt32() {
            print("Read Int32: \(int32)")
        } else {
            print("Expected Int32, Bad Read!")
            return
        }
        
        if let uint32 = fileBuffer.readUInt32() {
            print("Read UInt32: \(uint32)")
        } else {
            print("Expected UInt32, Bad Read!")
            return
        }
        
        if let int64 = fileBuffer.readInt64() {
            print("Read Int64: \(int64)")
        } else {
            print("Expected Int64, Bad Read!")
            return
        }
        
        if let uint64 = fileBuffer.readUInt64() {
            print("Read UInt64: \(uint64)")
        } else {
            print("Expected UInt64, Bad Read!")
            return
        }
        
        if let float32 = fileBuffer.readFloat32() {
            print("Read Float32: \(float32)")
        } else {
            print("Expected Float32, Bad Read!")
            return
        }
        
        if let float64 = fileBuffer.readFloat64() {
            print("Read Float64: \(float64)")
        } else {
            print("Expected Float64, Bad Read!")
            return
        }
        
        if let data = fileBuffer.readData() {
            print("Read Data: \([UInt8](data))")
        } else {
            print("Expected Data, Bad Read!")
            return
        }
        
        if let string = fileBuffer.readString() {
            print("Read String: \(string)")
        } else {
            print("Expected String, Bad Read!")
            return
        }
    }
}
