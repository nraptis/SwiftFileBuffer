Do you need 100% lossless data writing and reading from files?<br />

Here is your tool, it's easy to use. Read and write from most of the Swift data types.<br />

Fully unit tested, billions of times. All bugs and quirks ironed out. Iron clad "works out of the box" guaranteed.<br />

Does not support writing Data type larger than Fat32 file size limit, which is 4,294,967,295 bytes.<br />

Example, writing a file:<br />
(Note, must supply entire directory, "file.txt" is not enough, see project for example)<br />

```
let fileBuffer = FileBuffer()

fileBuffer.writeBool(true)
fileBuffer.writeUInt8(14)
fileBuffer.writeFloat32(1.5)
fileBuffer.writeString("👙 Example 🧠 String 👙")

fileBuffer.save(filePath: "file.txt")
```

Example, reading a file:<br />
(Note, must supply entire directory, "file.txt" is not enough, see project for example)<br />

```
let fileBuffer = FileBuffer()
fileBuffer.load(filePath: "file.txt")

if fileBuffer.isEmpty { return }

if let bool = fileBuffer.readBool() {
    print("Read Bool: \(bool)")
} else { return }

if let uint8 = fileBuffer.readUInt8() {
    print("Read UInt8: \(uint8)")
} else { return }

if let float32 = fileBuffer.readFloat32() {
    print("Read Float32: \(float32)")
} else { return }

if let string = fileBuffer.readString() {
    print("Read String: \(string)")
} else { return }

```

As you can see, the save and load sequencing must be 100% symmetrical.<br />

Highly recommended for medical or video game data, guaranteed data accuracy, not lossy like JSON format.<br />
