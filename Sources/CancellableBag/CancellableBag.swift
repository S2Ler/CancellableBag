import Combine

public class CancellableBag {
  private var cancellables: [Cancellable] = []

  deinit {
    clear()
  }

  public func add(_ cancellable: Cancellable) {
    cancellables.append(cancellable)
  }

  public func clear() {
    cancellables.forEach { $0.cancel() }
  }
}

public extension Cancellable {
  func add(to bag: CancellableBag) {
    bag.add(self)
  }
}
