internal class SomeInternalClass {
    
}

private class SomePrivateClass {
    
}

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    let i = SomeInternalClass()
    let p = SomePrivateClass()
    
    return (i, p)
    
}


public class A {
    private func someMethod() {}
}
internal class B: A {
    override internal func someMethod() {}
}