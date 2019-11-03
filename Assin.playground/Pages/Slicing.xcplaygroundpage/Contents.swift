

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


@inlinable public func stride<T>(_ start: T, _ end: T, _ by: T.Stride) -> StrideTo<T>  {
    return stride(from: start, to: end, by: by)
}

let a = "ABC"

a[stride(0, 3, 1)]

