//    [6:15 pm] Arshad Jamaluddin Shaikh (CORP HO)


class A {
    var test = "one"
}
class B: A {
    override var test: String {
        set {
            super.test = newValue
        }
        get {
            return super.test
        }
    }
}


