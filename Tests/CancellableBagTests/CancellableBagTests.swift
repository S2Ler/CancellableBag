import XCTest
@testable import CancellableBag
import Combine

final class CancellableBagTests: XCTestCase {
  func testBag() {
    var bag: CancellableBag! = CancellableBag()
    var producedValues: [Int] = []

    let subject = CurrentValueSubject<Int, Error>(0)

    subject.sink { (value) in
      producedValues.append(value)
    }.add(to: bag)

    subject.send(1)
    XCTAssertEqual(producedValues, [0, 1])

    subject.send(2)
    XCTAssertEqual(producedValues, [0, 1, 2])

    bag.clear()

    subject.send(3)
    XCTAssertEqual(producedValues, [0, 1, 2])

    subject.sink { (value) in
      producedValues.append(value)
      }.add(to: bag)
    XCTAssertEqual(producedValues, [0, 1, 2, 0])

    subject.send(1)
    XCTAssertEqual(producedValues, [0, 1, 2, 0, 1])

    bag = nil
    subject.send(2)
    XCTAssertEqual(producedValues, [0, 1, 2, 0, 1])
  }
}
