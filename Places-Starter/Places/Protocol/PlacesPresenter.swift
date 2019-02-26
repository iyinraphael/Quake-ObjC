//
//  PlacesPresenter.swift
//  Places
//
//  Created by Iyin Raphael on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

protocol PlacesPresenter: class {
                                            //get makes you access while set makes yoyu able to maniputate 
    var placeController: PlaceController? { get set}
}
