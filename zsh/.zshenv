# VLFEAT
export VLFEATROOT=$HOME/src/vlfeat
export PATH=$PATH:$VLFEATROOT/bin/glnxa64
export MANPATH=$MANPATH:$VLFEATROOT/src

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

alias xidl='source ~/.xrayidl.sh'
