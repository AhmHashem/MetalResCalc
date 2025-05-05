
procedure(listMetalLayersWithDimensions()
  let((selSet layerDict obj layerName bBox ll ur width length area foundLayers totalResistance multiplier)
    ; Define metal multipliers as a separate table
    metalMultipliers = makeTable("metal multipliers" 1.0) ; Default multiplier = 1.0
    metalMultipliers["METAL1"] = 1.0
    metalMultipliers["METAL2"] = 1.1
    metalMultipliers["METAL3"] = 1.2
    metalMultipliers["METAL4"] = 1.3
    metalMultipliers["METAL5"] = 1.4
    metalMultipliers["METAL6"] = 1.5
    metalMultipliers["POLY"] = 0.9

    selSet = geGetSelectedSet()
    layerDict = makeTable("layer dimensions" nil)
    foundLayers = nil

    unless(selSet
      error("No shapes selected.")
    )

    foreach(obj selSet
      layerName = obj~>layerName
      when(layerName
        bBox = obj~>bBox
        ll = lowerLeft(bBox)
        ur = upperRight(bBox)
        width = xCoord(ur) - xCoord(ll)
        length = yCoord(ur) - yCoord(ll)
        multiplier = metalMultipliers[layerName] || 1.0 ; Fallback to 1.0 if layer not found
        Resistance = (width / length) * multiplier
        
        if(layerDict[layerName] then
          layerDict[layerName] = cons(list(width length Resistance multiplier) layerDict[layerName])
        else
          layerDict[layerName] = list(list(width length Resistance multiplier))
          foundLayers = cons(layerName foundLayers)
        )
      )
    )

    if(foundLayers then
      printf("Metal layers with scaled dimensions ((width / length) x multiplier = Resistance):\n\n")
      foreach(layerName foundLayers
        dimList = layerDict[layerName]
        printf("Layer: %s\n" layerName)
        printf("  Multiplier: %.2f\n" cadddr(car(dimList))) ; Show multiplier for this layer
        printf("  Shapes found: %d\n" length(dimList))
        printf("  Dimensions ((width / length) x multiplier = Resistance):\n")
        foreach(dim dimList
          printf("    (%.4f / %.4f) x %.2f = %.4f\n" 
                 car(dim) cadr(dim) cadddr(dim) caddr(dim))
        )
        ;printf("  Min width: %.4f\n" apply('min mapcar('car dimList)))
        ;printf("  Max width: %.4f\n" apply('max mapcar('car dimList)))
        ;printf("  Min length: %.4f\n" apply('min mapcar('cadr dimList)))
        ;printf("  Max length: %.4f\n" apply('max mapcar('cadr dimList)))
        
        totalResistance = 0.0
        foreach(dim dimList
          totalResistance = totalResistance + caddr(dim)
        )
        printf("  Total scaled Resistance: %.4f\n" totalResistance)
        printf("\n")
      )
    else
      printf("No metal layers found in selection.\n")
    )
  )
)
