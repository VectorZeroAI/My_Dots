hl.config({
    decoration = {
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.7,
            noise = 0,
            variant = "acrylic", -- default kawase -- NOTE: If battery life issues => Move back from acrylic to aurora or kawase
            acrylic = {
                aberration = 0.025,--0.025,
                bulb = 20.0,
                clarity = 0.50,
                refraction = 20.0,
                tint = "0x04EEF5FF" -- TODO : Edit this a bit
            },
            glass = { -- general config of glass
                refraction = 10,
                roughness = 0.8,
                size = 30,
            },
            haze = { -- Normal blur.
                intensity = 0.4,
                iridescence = 0.6
            },
            water = {
                damping = 0.95,
                duration = 12.0,
                radius = 20.0,
                speed = 0.76,
                strength = 32.0
            },
            aurora = {
                color1 = "0x29F0A0FF",
                color2 = "0x7A4DFFFF",
                intensity = 0.7,
                speed = 1.4
            },
            drops = {
                speed = 3,
            },
            fluid_jar = {
                color = "0xCC3399FF",
                distortion = 8.0,
                fill_amount = 0.5,
                mass = 1.4,
                precision = 1.0,
                speed = 3.7,
                turbulence = 5.0
            },
            heat_shimmer = {
                speed = 0.7
            },
            ripple = { -- dont see anything
                duration = 0.9,
                radius = 200.0,
                strength = 30.0,
                width = 80.0
            }
        },
    }
})
