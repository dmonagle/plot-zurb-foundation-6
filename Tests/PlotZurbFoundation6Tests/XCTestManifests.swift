import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PlotZurbFoundation6Tests.allTests),
    ]
}
#endif
