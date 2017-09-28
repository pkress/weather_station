-- setup I2c and connect display
function init_i2c_display()
    -- Pinsa are hardwired on the oled display shield
    local sda = 2 -- GPIO14
    local scl = 1 -- GPIO12
    local sla = 0x3c -- 0x3c or 0x3d
    i2c.setup(0, sda, scl, i2c.SLOW)
    disp = u8g.ssd1306_64x48_i2c(sla)
end

function prepare()
    disp:setFont(u8g.font_6x10)
    disp:setFontRefHeightExtendedText()
    disp:setDefaultForegroundColor()
    disp:setFontPosTop()
end

init_i2c_display()
prepare()

