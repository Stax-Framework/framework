local Creator = {
    started = false,
    CharacterData = {}
}

function Creator.StartCharacterCreator()
    Creator.CharacterData = {}
    Creator.started = true

    
end

function Creator.StopCharacterCreator()

end

function Creator.BuildCharacterData()

end

---# NATIVES LIST
-- ClearPedProp(ped, propId)

-- GetPedEyeColor(ped)
-- SetPedEyeColor(ped, index)

-- GetPedFaceFeature(ped, index)
-- SetPedFaceFeature(ped, index, scale)

-- GetPedHairColor(ped)
-- GetPedHairHighlightColor(ped)
-- SetPedHairColor(ped, colorId, highlightColorId)

-- GetPedHeadOverlayData(ped, index, overlayValue, colourType, firstColour, secondColour, overlayOpactiy)
-- SetPedHeadOverlay(ped, overlayId, index, opacity)

-- SetPedComponentVariation(ped, componentId, drawableId, textureId, paletteId)