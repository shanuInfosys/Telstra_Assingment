//
//  SnapKit
//
//  Copyright (c) 2011-Present SnapKit Team - https://github.com/SnapKit
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
// swiftlint:disable all
#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif


public extension ConstraintView {
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpleft: ConstraintItem { return self.snp.left }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snptop: ConstraintItem { return self.snp.top }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpright: ConstraintItem { return self.snp.right }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpbottom: ConstraintItem { return self.snp.bottom }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpleading: ConstraintItem { return self.snp.leading }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snptrailing: ConstraintItem { return self.snp.trailing }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpwidth: ConstraintItem { return self.snp.width }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpheight: ConstraintItem { return self.snp.height }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpcenterX: ConstraintItem { return self.snp.centerX }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpcenterY: ConstraintItem { return self.snp.centerY }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpbaseline: ConstraintItem { return self.snp.baseline }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, OSX 10.11, *)
    var snplastBaseline: ConstraintItem { return self.snp.lastBaseline }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, OSX 10.11, *)
    var snpfirstBaseline: ConstraintItem { return self.snp.firstBaseline }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snpleftMargin: ConstraintItem { return self.snp.leftMargin }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snptopMargin: ConstraintItem { return self.snp.topMargin }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snprightMargin: ConstraintItem { return self.snp.rightMargin }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snpbottomMargin: ConstraintItem { return self.snp.bottomMargin }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snpleadingMargin: ConstraintItem { return self.snp.leadingMargin }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snptrailingMargin: ConstraintItem { return self.snp.trailingMargin }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snpcenterXWithinMargins: ConstraintItem { return self.snp.centerXWithinMargins }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snpcenterYWithinMargins: ConstraintItem { return self.snp.centerYWithinMargins }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpedges: ConstraintItem { return self.snp.edges }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpsize: ConstraintItem { return self.snp.size }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    var snpcenter: ConstraintItem { return self.snp.center }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snpmargins: ConstraintItem { return self.snp.margins }
    
    @available(iOS, deprecated, message:"Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snpcenterWithinMargins: ConstraintItem { return self.snp.centerWithinMargins }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    func snp_prepareConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
        return self.snp.prepareConstraints(closure)
    }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    func snp_makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.makeConstraints(closure)
    }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    func snp_remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.remakeConstraints(closure)
    }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    func snp_updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.updateConstraints(closure)
    }
    
    @available(*, deprecated, message:"Use newer snp.* syntax.")
    func snp_removeConstraints() {
        self.snp.removeConstraints()
    }
    
    var snp: ConstraintViewDSL {
        return ConstraintViewDSL(view: self)
    }
    
}
// swiftlint:disable all
