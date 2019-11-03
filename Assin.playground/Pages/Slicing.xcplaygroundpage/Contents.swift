

extension String {
    subscript (stride: StrideTo<Int>) -> StringLiteralType {
        let s = stride.min()!
        let e = stride.max()! + 1
        let start = self.index(startIndex, offsetBy: s)
        let end = self.index(startIndex, offsetBy: e)
        
        let result =  self[start..<end]
        return String(result)
    }
}

let a = "ABC"

a[stride(from: 0, to: 3, by: 1)]
