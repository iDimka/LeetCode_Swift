import Cocoa

class Rotate_Image: NSObject {
    class func _rotate(_ matrix: inout [[Int]]) {
        let upperLimit = Int(floor(Float(matrix.count) / 2.0))
        let y = matrix.count - 1
        
        (0..<upperLimit).forEach { i in
            (i..<y - i).forEach { j in
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[y - j][i]
                matrix[y - j][i] = matrix[y - i][y - j]
                matrix[y - i][y - j] = matrix[j][y - i]
                matrix[j][y - i] = tmp
                
                print("row: \(i), col: \(j): \(matrix)")
            }
        }
    }
    
    class func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        (0..<(n / 2 + n.remainderReportingOverflow(dividingBy: 2).partialValue)).forEach { row in
            (0..<Int(floor(Float(n) / 2.0))).forEach { col in
                var tmp = Array.init(repeating: 0, count: 4)
                var row = row
                var col = col
                
                (0..<4).forEach { k in
                    tmp[k] = matrix[row][col]
                    let oldRow = row
                    row = col
                    col = n - 1 - oldRow
                }
                
                (0..<4).forEach { k in
                    matrix[row][col] = tmp[(k + 3).remainderReportingOverflow(dividingBy: 4).partialValue]
                    let oldRow = row
                    row = col
                    col = n - 1 - oldRow
                }
            }
        }
        
    }
    
    class func test() {
        var input = [[1,2,3], [4,5,6], [7,8,9]]
        print(input)
        print("\n")
        _rotate(&input)
        print(input)
    }
}
