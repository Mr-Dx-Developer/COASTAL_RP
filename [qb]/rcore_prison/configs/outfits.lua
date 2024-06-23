OUTFITS = {
    ['crm-appearance'] = {
        ['Male'] = {
            crm_clothing = {
                {crm_id = 1, crm_style = 0, crm_texture = 0}, -- Masks
                {crm_id = 3, crm_style = 15, crm_texture = 0}, -- Torsos
                {crm_id = 4, crm_style = 64, crm_texture = 0}, -- Legs
                {crm_id = 5, crm_style = 0, crm_texture = 0}, -- Hands
                {crm_id = 6, crm_style = 27, crm_texture =0}, -- Shoes
                {crm_id = 7, crm_style = 0, crm_texture = 0}, -- Accessories
                {crm_id = 8, crm_style = 0, crm_texture = 0}, -- Undershirts
                {crm_id = 9, crm_style = 0, crm_texture = 0}, -- Body Armors
                {crm_id = 10, crm_style = 0, crm_texture = 0}, -- Decals
                {crm_id = 11, crm_style = 238, crm_texture = 0}, -- Tops
            },
            crm_accessories = {
                {crm_id = 0, crm_style = -1, crm_texture = 0}, -- Hats
                {crm_id = 1, crm_style = -1, crm_texture = 0}, -- Glasses
                {crm_id = 2, crm_style = -1, crm_texture = 0}, -- Ears
                {crm_id = 6, crm_style = -1, crm_texture = 0}, -- Watches
                {crm_id = 7, crm_style = -1, crm_texture = 0}, -- Bracelets
            }
        },
        ['Female'] = {
            crm_clothing = {
                {crm_id = 1, crm_style = 0, crm_texture = 0}, -- Masks
                {crm_id = 3, crm_style = 238, crm_texture = 0}, -- Torsos
                {crm_id = 4, crm_style = 64, crm_texture = 4}, -- Legs
                {crm_id = 5, crm_style = 0, crm_texture = 0}, -- Hands
                {crm_id = 6, crm_style = 27, crm_texture = 1}, -- Shoes
                {crm_id = 7, crm_style = 0, crm_texture = 0}, -- Accessories
                {crm_id = 8, crm_style = 0, crm_texture = 0}, -- Undershirts
                {crm_id = 9, crm_style = 0, crm_texture = 0}, -- Body Armors
                {crm_id = 10, crm_style = 0, crm_texture = 0}, -- Decals
                {crm_id = 11, crm_style = 52, crm_texture = 0}, -- Tops
            },
            crm_accessories = {
                {crm_id = 0, crm_style = -1, crm_texture = 0}, -- Hats
                {crm_id = 1, crm_style = -1, crm_texture = 0}, -- Glasses
                {crm_id = 2, crm_style = -1, crm_texture = 0}, -- Ears
                {crm_id = 6, crm_style = -1, crm_texture = 0}, -- Watches
                {crm_id = 7, crm_style = -1, crm_texture = 0}, -- Bracelets
            }
        }
    },


    ['qb-clothing'] = {
        ['Male'] = {
            {
                name = l('outfits_default_with_top_label'),
                components = {
                    ['hat'] = {
                        item = 0,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['mask'] = {
                        item = 0,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['arms'] = {
                        item = 5,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['t-shirt'] = {
                        item = 15,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['torso2'] = {
                        item = 238,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['shoes'] = {
                        item = 27,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['pants'] = {
                        item = 64,
                        texture = 4,
                        defaultItem = 1,
                        defaultTexture = 0
                    },
                }
            },

            {
                name = l('outfits_default_without_top_label'),
                components = {
                    ['hat'] = {
                        item = 0,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['mask'] = {
                        item = 0,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['arms'] = {
                        item = 5,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['t-shirt'] = {
                        item = 15,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['torso2'] = {
                        item = 237,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['shoes'] = {
                        item = 27,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['pants'] = {
                        item = 64,
                        texture = 4,
                        defaultItem = 1,
                        defaultTexture = 0
                    },
                }
            }
        },
        ['Female'] = {
            {
                name = l('outfits_default_with_top_label'),
                components = {
                    ['arms'] = {
                        item = 5,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['t-shirt'] = {
                        item = 15,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['torso2'] = {
                        item = 238,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['shoes'] = {
                        item = 27,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['pants'] = {
                        item = 64,
                        texture = 4,
                        defaultItem = 1,
                        defaultTexture = 0
                    },
                }
            },

            {
                name = l('outfits_default_without_top_label'),
                components = {
                    ['arms'] = {
                        item = 5,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['t-shirt'] = {
                        item = 15,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['torso2'] = {
                        item = 237,
                        texture = 0,
                        defaultItem = 0,
                        defaultTexture = 0
                    },

                    ['shoes'] = {
                        item = 27,
                        texture = 0,
                        defaultItem = 1,
                        defaultTexture = 0
                    },

                    ['pants'] = {
                        item = 64,
                        texture = 4,
                        defaultItem = 1,
                        defaultTexture = 0
                    },
                }
            }
        }
    },

    ['skinchanger'] = {
        ['Male'] = {
            {
                name = l('outfits_default_with_top_label'),
                components = {
                    skin = {
                        decals_1     = 0,
                        decals_2     = 0,
                        pants_1      = 5,
                        pants_2      = 7,
                        mask_1       = 0,
                        mask_2       = 0,
                        bproof_1     = 0,
                        bproof_2     = 0,
                        chain_1      = 0,
                        chain_2      = 0,
                        helmet_1     = 14,
                        helmet_2     = 0,
                        glasses_1    = -1,
                        glasses_2    = 0,
                        arms = 5,
                        tshirt_1 = 15,
                        tshirt_2     = 0,
                        torso_1 = 238,
                        torso_2 = 0,
                        shoes_1 = 7,
                        shoes_2 = 0,
                    }
                }
            },
        },
        ['Female'] = {
            {
                name = l('outfits_default_with_top_label'),
                components = {
                    skin = {
                        tshirt_2     = 0,
                        torso_2      = 0,
                        decals_1     = 0,
                        decals_2     = 0,
                        pants_1      = 66,
                        pants_2      = 6,
                        mask_1       = 0,
                        mask_2       = 0,
                        bproof_1     = 0,
                        bproof_2     = 0,
                        chain_1      = 0,
                        chain_2      = 0,
                        helmet_1     = -1,
                        helmet_2     = 0,
                        glasses_1    = -1,
                        glasses_2    = 0,
                        arms = 15,
                        tshirt_1 = 15,
                        torso_1 = 23,
                        shoes_1 = 27,
                        shoes_2 = 0,
                    }
                }
            },
        }
    },

    ['illenium-appearance'] = {
        ['Female'] = {
            {
                name = l('outfits_default_with_top_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = -1,
                        drawable = -1,
                        prop_id = 0
                    },
                    {
                        componentLabel = 'Glasses',
                        texture = -1,
                        drawable = -1,
                        prop_id = 1
                    },
                    {
                        componentLabel = 'Ears',
                        texture = -1,
                        drawable = -1,
                        prop_id = 2
                    },
                    {
                        componentLabel = 'Watches',
                        texture = -1,
                        drawable = -1,
                        prop_id = 6
                    },
                    {
                        componentLabel = 'Bracelets',
                        texture = -1,
                        drawable = -1,
                        prop_id = 7
                    },
                },
                components = {
                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'White shirt',
                        component_id = 11,
                        drawable = 74,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 66,
                        texture = 6
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 27,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 15,
                        texture = 0
                    },
                }
            },
            {
                name = l('outfits_default_classic_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = -1,
                        drawable = -1,
                        prop_id = 0
                    },
                    {
                        componentLabel = 'Glasses',
                        texture = -1,
                        drawable = -1,
                        prop_id = 1
                    },
                    {
                        componentLabel = 'Ears',
                        texture = -1,
                        drawable = -1,
                        prop_id = 2
                    },
                    {
                        componentLabel = 'Watches',
                        texture = -1,
                        drawable = -1,
                        prop_id = 6
                    },
                    {
                        componentLabel = 'Bracelets',
                        texture = -1,
                        drawable = -1,
                        prop_id = 7
                    },
                },
                components = {
                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'White shirt',
                        component_id = 11,
                        drawable = 73,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 66,
                        texture = 6
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 27,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 14,
                        texture = 0
                    },
                }
            }
        },

        ['Male'] = {
            {
                name = l('outfits_default_without_top_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = -1,
                        drawable = -1,
                        prop_id = 0
                    },
                    {
                        componentLabel = 'Glasses',
                        texture = -1,
                        drawable = -1,
                        prop_id = 1
                    },
                    {
                        componentLabel = 'Ears',
                        texture = -1,
                        drawable = -1,
                        prop_id = 2
                    },
                    {
                        componentLabel = 'Watches',
                        texture = -1,
                        drawable = -1,
                        prop_id = 6
                    },
                    {
                        componentLabel = 'Bracelets',
                        texture = -1,
                        drawable = -1,
                        prop_id = 7
                    },
                },
                components = {
                    {
                        componentLabel = 'Mask',
                        component_id = 1,
                        drawable = 0,
                        texture = 0
                    },  
                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'Orange shit',
                        component_id = 11,
                        drawable = 238,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 5,
                        texture = 7
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 7,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 2,
                        texture = 0
                    },
                }
            },
            {
                name = l('outfits_default_with_top_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = -1,
                        drawable = -1,
                        prop_id = 0
                    },
                    {
                        componentLabel = 'Glasses',
                        texture = -1,
                        drawable = -1,
                        prop_id = 1
                    },
                    {
                        componentLabel = 'Ears',
                        texture = -1,
                        drawable = -1,
                        prop_id = 2
                    },
                    {
                        componentLabel = 'Watches',
                        texture = -1,
                        drawable = -1,
                        prop_id = 6
                    },
                    {
                        componentLabel = 'Bracelets',
                        texture = -1,
                        drawable = -1,
                        prop_id = 7
                    },
                },
                components = {
                    {
                        componentLabel = 'Mask',
                        component_id = 1,
                        drawable = 0,
                        texture = 0
                    },                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'Orange shit',
                        component_id = 11,
                        drawable = 237,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 5,
                        texture = 7
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 7,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 5,
                        texture = 0
                    },
                }
            }
        },
    },

    ['fivem-appearance'] = {
        ['Female'] = {
            {
                name = l('outfits_default_with_top_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = 0,
                        drawable = -1,
                        prop_id = 0
                    },
                },
                components = {
                    {
                        componentLabel = 'Mask',
                        component_id = 1,
                        drawable = 0,
                        texture = 0
                    },    
                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'White shirt',
                        component_id = 11,
                        drawable = 74,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 66,
                        texture = 6
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 27,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 15,
                        texture = 0
                    },
                }
            },
            {
                name = l('outfits_default_classic_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = 0,
                        drawable = -1,
                        prop_id = 0
                    },
                },
                components = {
                    {
                        componentLabel = 'Mask',
                        component_id = 1,
                        drawable = 0,
                        texture = 0
                    },    
                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'White shirt',
                        component_id = 11,
                        drawable = 73,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 66,
                        texture = 6
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 27,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 14,
                        texture = 0
                    },
                }
            }
        },

        ['Male'] = {
            {
                name = l('outfits_default_without_top_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = 0,
                        drawable = -1,
                        prop_id = 0
                    },
                },
                components = {
                    {
                        componentLabel = 'Mask',
                        component_id = 1,
                        drawable = 0,
                        texture = 0
                    },    
                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'Orange shit',
                        component_id = 11,
                        drawable = 238,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 5,
                        texture = 7
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 7,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 2,
                        texture = 0
                    },
                }
            },
            {
                name = l('outfits_default_with_top_label'),
                props = {
                    {
                        componentLabel = 'Hats / Helmet',
                        texture = 0,
                        drawable = -1,
                        prop_id = 0
                    },
                },
                components = {
                    {
                        componentLabel = 'Mask',
                        component_id = 1,
                        drawable = 0,
                        texture = 0
                    },    
                    {
                        componentLabel = 'Under shirt',
                        component_id = 8,
                        drawable = 15,
                        texture = 0
                    },
                    {
                        componentLabel = 'Orange shit',
                        component_id = 11,
                        drawable = 237,
                        texture = 0
                    },
                    {
                        componentLabel = 'Trousers',
                        component_id = 4,
                        drawable = 5,
                        texture = 7
                    },
                    {
                        componentLabel = 'Shoes',
                        component_id = 6,
                        drawable = 7,
                        texture = 0
                    },
                    {
                        componentLabel = 'Hands',
                        component_id = 3,
                        drawable = 5,
                        texture = 0
                    },
                }
            }
        }
    },
}