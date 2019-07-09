#!/bin/bash

killall conky

#conky -c "/home/panjiesw/.conky/Gotham/Gotham" &

conky -c "/home/panjiesw/.conky/TeejeeTech/CPU Panel (8-core)" &

conky -c "/home/panjiesw/.conky/TeejeeTech/Network Panel" &

conky -c "/home/panjiesw/.conky/TeejeeTech/Process Panel" &

exit 0

