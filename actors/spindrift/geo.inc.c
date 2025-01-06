// 0x0C000000
const GeoLayout spindrift_geo[] = {
    GEO_SHADOW(SHADOW_CIRCLE_4_VERTS, 0x96, 100),
    GEO_OPEN_NODE(),
        GEO_SCALE(0x00, 32768),
        GEO_OPEN_NODE(),
            GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
            GEO_OPEN_NODE(),
                GEO_ANIMATED_PART(LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002900),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(LAYER_OPAQUE, 100, 0, 0, spindrift_seg5_dl_05000328),
                    GEO_ANIMATED_PART(LAYER_ALPHA, 100, 0, 0, spindrift_seg5_dl_05002A20),
                    GEO_ANIMATED_PART(LAYER_ALPHA, 100, 0, 0, spindrift_seg5_dl_05002B30),
                    GEO_ANIMATED_PART(LAYER_OPAQUE, -88, -32, 0, NULL),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, spindrift_seg5_dl_050002A0),
                        GEO_ANIMATED_PART(LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002D08),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
                        GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
                    GEO_CLOSE_NODE(),
                GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(LAYER_OPAQUE, 0, 0, 0, NULL),
                GEO_OPEN_NODE(),
                    GEO_BILLBOARD(),
                    GEO_OPEN_NODE(),
                        GEO_DISPLAY_LIST(LAYER_ALPHA, spindrift_seg5_dl_05002748),
                    GEO_CLOSE_NODE(),
                GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002830),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_CLOSE_NODE(),
    GEO_END(),
};
