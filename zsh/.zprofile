typeset -U path

# Go
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

# node.js
export npm_config_prefix=$HOME/.node_modules

# Ruby gem
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export GEM_PATH=$GEM_HOME

# VLFEAT
# export VLFEATROOT=$HOME/src/vlfeat
# export MANPATH=$MANPATH:$VLFEATROOT/src

# KARMA
export KARMABASE=/usr/local/karma

# GNU GLOBAL
export GTAGSLABLE=pygments
export GTAGSCONF=$HOME/.globalrc

# DS9
export XPA_METHOD=local

path=($HOME/bin
      $HOME/.local/bin
      $GOPATH/bin
      $HOME/.node_modules/bin
      $HOME/app/wcstools-3.9.5/bin
      # $VLFEATROOT/bin/glnxa64
      $KARMABASE/bin
      $path)

# IDL
# source /usr/local/itt/idl/bin/idl_setup.bash
# export IDL_DIR=/usr/local/exelis/idl
export IDL_LIB_DIR=$HOME/Dropbox/Code/idl
export IDL_STARTUP=$HOME/.idlstartup
export IDL_PATH='<IDL_DEFAULT>'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/astrolib/pro'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/coyote'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/catalyst'
# export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/motley'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/gumley'
# export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/mperrin'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/textoidl'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/slug_idl'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/fx-idl'

# Application theme
[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
