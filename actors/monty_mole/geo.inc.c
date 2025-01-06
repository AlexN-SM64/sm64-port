// 0x0C000000
const GeoLayout monty_mole_geo[] = {
    GEO_NODE_START(),
    GEO_OPEN_NODE(),
        GEO_SCALE(0x00, 16384),
        GEO_OPEN_NODE(),
            GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
            GEO_OPEN_NODE(),
                GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, monty_mole_seg5_dl_050044B0),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(LAYER_OPAQUE, 116, 0, 0, monty_mole_seg5_dl_05004C00),
                    GEO_ANIMATED_PART(LAYER_ALPHA, 116, 0, 0, monty_mole_seg5_dl_05004D30),
                    GEO_ANIMATED_PART(LAYER_OPAQUE, -68, -5, -40, NULL),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, monty_mole_seg5_dl_05003C48),
                    GEO_CLOSE_NODE(),
                    GEO_ANIMATED_PART(LAYER_OPAQUE, -68, -5, 40, NULL),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, monty_mole_seg5_dl_05003518),
                    GEO_CLOSE_NODE(),
                    GEO_ANIMATED_PART(LAYER_OPAQUE, 80, 1, 78, NULL),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, monty_mole_seg5_dl_050032A0),
                        GEO_OPEN_NODE(),
                            GEO_ANIMATED_PART(LAYER_OPAQUE, 80, 0, 0, monty_mole_seg5_dl_05003820),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                    GEO_ANIMATED_PART(LAYER_OPAQUE, 80, 1, -78, NULL),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, monty_mole_seg5_dl_050039D0),
                        GEO_OPEN_NODE(),
                            GEO_ANIMATED_PART(LAYER_OPAQUE, 80, 0, 0, monty_mole_seg5_dl_05003F50),
                            GEO_ASM(0, geo_update_projectile_pos_from_parent),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                GEO_CLOSE_NODE(),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_CLOSE_NODE(),
    GEO_END(),
};
