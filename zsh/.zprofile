typeset -U path

path=($HOME/bin
      $HOME/.local/bin
      $GOPATH/bin
      $HOME/.node_modules/bin
      # $HOME/app/wcstools-3.9.5/bin
      # $HOME/app/Montage-5.0/bin
      # $HOME/app/swig-3.0.12/bin
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
