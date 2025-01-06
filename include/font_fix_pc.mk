# JP/EU Font texture format fix (not only for PC)
ifeq ($(TARGET_N64),0)

# JP font texture format fix
$(BUILD_DIR)/$(TEXTURE_DIR)/segment2/segment2.%.ia1.inc.c: $(TEXTURE_DIR)/segment2/segment2.%.ia1.png
	$(call print,Converting to IA8:,$<,$@)
	$(V)$(N64GRAPHICS) -s $(TEXTURE_ENCODING) -i $@ -g $< -f ia8

# EU font texture format fix
$(BUILD_DIR)/$(TEXTURE_DIR)/segment2/font_graphics.%.ia1.inc.c: $(TEXTURE_DIR)/segment2/font_graphics.%.ia1.png
	$(call print,Converting to IA4:,$<,$@)
	$(V)$(N64GRAPHICS) -s $(TEXTURE_ENCODING) -i $@ -g $< -f ia4

endif
