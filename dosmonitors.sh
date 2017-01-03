# Coŀloca el VGA  sota
xrandr --output DP2 --above eDP1 --auto

# Rota el VGA per a la feina
xrandr --output DP2 --rotate left

# Establei HDMI com a primary
xrandr --output DP1 --primary

