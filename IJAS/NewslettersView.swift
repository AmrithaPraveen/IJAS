//
//  NewslettersView.swift
//  IJAS
//
//  Created by Amritha Praveen on 1/1/24.
//

import Foundation
import SwiftUI
import PDFKit

struct NewslettersView: View {
    //let pdfURL = URL(string:"https://drive.google.com/file/d/10mEt1hzlASsGA2yi5aaRtvdEfHvJahwD/view") // The URL of the PDF file

    var body: some View {
        VStack{
           
            HStack{
               WebView(url: URL(string: "https://drive.google.com/file/d/10mEt1hzlASsGA2yi5aaRtvdEfHvJahwD/view")!)
            }
            Spacer()
        
        }
        .padding(.horizontal, 24)
        .navigationBarHidden(true)
            
        }
    }
