;; PostScript setting
this_device = !d.name
set_plot, 'ps'
device, /color, bits_per_pixel=8
set_plot, this_device
