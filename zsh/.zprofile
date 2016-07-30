typeset -U path
typeset -U manpath

# Go
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

# node.js
export npm_config_prefix=$HOME/.node_modules

# Ruby gem
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export GEM_PATH=$GEM_HOME

# VLFEAT
export VLFEATROOT=$HOME/src/vlfeat

# KARMA
export KARMABASE=/usr/local/karma

path=($HOME/bin
      $GOPATH/bin
      $HOME/.node_modules
      $VLFEATROOT/bin/glnxa64
      $KARMABASE/bin
      $HOME/app/casa/bin
      $path)

manpath=($VLFEATROOT/src
         $manpath)

# IDL
# source /usr/local/itt/idl/bin/idl_setup.bash
# export IDL_DIR=/usr/local/exelis/idl
export IDL_LIB_DIR=$HOME/lib/idl
export IDL_STARTUP=$HOME/.idlstartup
export IDL_PATH='<IDL_DEFAULT>'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/astrolib/pro'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/coyote'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/catalyst'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/motley'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/gumley'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/mperrin'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/textoidl'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/slug_idl'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/fx-idl'
