//
//  ViewExtension.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 23/12/21.
//

import Foundation
import SwiftUI

extension View {
    
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
