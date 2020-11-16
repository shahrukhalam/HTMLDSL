//
//  HTMLView.swift
//  HTMLDSL
//
//  Created by Shahrukh Alam on 14/11/20.
//

import Foundation

protocol HTMLView: View {  }
protocol HTMLContentView: HTMLView {  }

protocol HTMLHeadView: HTMLContentView {  }
protocol HTMLHeadContentView: HTMLHeadView {  }

protocol HTMLBodyView: HTMLContentView {  }
protocol HTMLBodyContentView: HTMLBodyView {  }
protocol HTMLBodyTextContentView: HTMLBodyContentView {  }
