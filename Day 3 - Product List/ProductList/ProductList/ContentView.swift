//
//  ContentView.swift
//  ProductList
//
//  Created by Andrew Thwaites on 31/08/2022.
//

import SwiftUI

struct ProductDataType: Identifiable {
    let id    : Int
    let productName  : String
    let productDescription : String
    let productImage  : String
    var fav : Bool
}

var dataTypeList = [
    ProductDataType(id: 0, productName: "Nikon D750",
                    productDescription: "Full frame DSLR Camera",
                    productImage : "D750_small",
                    fav : true),
    
    ProductDataType(id: 1,
                    productName: "Sony A77ii",
                    productDescription: "APSC enthusist DSLR Camera",
                    productImage : "A77ii_small",
                    fav : false),
    ProductDataType(id: 2,
                    productName: "Sony a300",
                    productDescription: "Entry DSLR Camera",
                    productImage : "A300_small",
                    fav : false),
    ProductDataType(id: 3,
                    productName: "Nikon D850_small",
                    productDescription: "Full frame DSLR Camera",
                    productImage : "D850_small",
                    fav : false),
    ProductDataType(id: 4,
                    productName: "Nikon z6",
                    productDescription: "Prosumer fullframe Mirroless camera",
                    productImage : "Z6_small",
                    fav : false),
    
    ProductDataType(id: 5, productName: "Nikon D750",
                    productDescription: "Full frame DSLR Camera",
                    productImage : "D750_small",
                    fav : false),
    
    ProductDataType(id: 6,
                    productName: "Sony A77ii",
                    productDescription: "APSC enthusist DSLR Camera",
                    productImage : "A77ii_small",
                    fav : false),
    ProductDataType(id: 7,
                    productName: "Sony a300",
                    productDescription: "Entry DSLR Camera",
                    productImage : "A300_small",
                    fav : false),
    ProductDataType(id: 8,
                    productName: "Nikon D850_small",
                    productDescription: "Full frame DSLR Camera",
                    productImage : "D850_small",
                    fav : false),
    ProductDataType(id: 9,
                    productName: "Nikon z6",
                    productDescription: "Prosumer fullframe Mirroless camera",
                    productImage : "Z6_small",
                    fav : false),
]


struct ContentView: View {
    @State var refresh: Bool = false
    
    // get button id
    func didTap(recordId: Int ) {
        
        print(recordId)
        let status = dataTypeList[recordId].fav
        if status == false
        {
            dataTypeList[recordId].fav = true
            // hide button
            //  show favourite task
            
            Text("is Favourite")
                .font(.system(size: 10))
                .frame(width: 100, height:20  )
                .background(Color.green)
                .foregroundColor(.white)
               // .cornerRadius(10)
        }
        else {
            dataTypeList[recordId].fav = false
            // hide favourite text
            // show button
        }
    }
    
    var body: some View {
        Text("Product List")
            .padding()
        
        List(dataTypeList) { dataType in
            HStack {
                Image(dataType.productImage)
                    .frame(width: 75.0, height: 50.0,alignment: .leading)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(dataType.productName).fontWeight(.bold)
                    Text(dataType.productDescription)
                        .font(.system(size: 10))
                    
                    if(dataType.fav == true)
                    {
                        Text("Favourite")
                            .font(.system(size: 10))
                    } else {
                        Button(action: {
                            self.didTap(recordId: dataType.id)
                        }, label: {
                            Text("Make Favourite")
                                .font(.system(size: 10))
                                .frame(width: 100, height:20  )
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    }
                }
                
            }
            
            
            
        }
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
