# setting variables
export PUB_DIR=$HOME/Documents/pub
export ZDEF=$PUB_DIR/xrayidl/def
export ZAUX=$PUB_DIR/xrayidl/aux
export EXPLIB=$PUB_DIR/xrayidl/exp

# setting path
# export IDL_PATH=$IDL_PATH:+'$PUB_DIR/idladd/idlastronlib/pro'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/idladd/rosatidl'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/atomdb_idl_2.00'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/tara'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/ae'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/pan'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/xrayidl'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/ljtastro'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/Zhiyuanprocedure'

# enter idl
idl $PUB_DIR/xrayidl/xraysysv.pro
