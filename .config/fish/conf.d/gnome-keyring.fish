set -l envfile "$HOME/.gnome-keyring.env"

if not pgrep -f 'gnome-keyring-daemon.*components.*gpg,pkcs11,ssh,secrets' > /dev/null
    # A hack to clean up old instances
    killall -q gnome-keyring-daemon

    gnome-keyring-daemon --start --components=gpg,pkcs11,ssh,secrets > $envfile
end

# change var assignments to the fish syntax:
# 1. prefix with set -x
# 2. turn = to ' '
# 3. add ; at the end of each line
set var_set (cat "$envfile" |  sed -e 's/^\(.*\)/set -x \\1/' -e 's/=/ /' -e 's/\(.*\)$/\1;/')
eval $var_set
