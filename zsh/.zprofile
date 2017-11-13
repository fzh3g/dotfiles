typeset -U path

# Go
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

path=($HOME/bin
      $HOME/.local/bin
      $GOPATH/bin
      $HOME/.node_modules/bin
      # $HOME/app/wcstools-3.9.5/bin
      # $HOME/app/Montage-5.0/bin
      # $HOME/app/swig-3.0.12/bin
      $path)

# IDL
# source /usr/local/itt/idl/bin/idl_setup.bash
# export IDL_DIR=/usr/local/exelis/idl
export IDL_LIB_DIR=$HOME/Documents/idl/lib
export IDL_STARTUP=$HOME/.idlstartup
export IDL_PATH='<IDL_DEFAULT>'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/astrolib/pro'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/coyote'
# export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/catalyst'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/fx-idl'
# export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/others/motley'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/others/gumley'
# export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/others/mperrin'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/others/textoidl'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/others/slug_idl'
