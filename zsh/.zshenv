# VLFEAT
export VLFEATROOT=$HOME/src/vlfeat
export PATH=$PATH:$VLFEATROOT/bin/glnxa64
export MANPATH=$MANPATH:$VLFEATROOT/src

# Heasoft
# export HEADAS=/usr/local/heasoft-6.17/x86_64-unknown-linux-gnu-libc2.22
# alias heainit=". $HEADAS/headas-init.sh"

# XMM SAS
# alias sasinit=". /usr/local/SAS/xmmsas_20141104_1833/setsas.sh"

# CALDB
# export CALDB=$HOME/app/caldb
# export CALDBCONFIG=$CALDB/software/tools/caldb.config
# export CALDBALIAS=$CALDB/software/tools/alias_config.fits

# CIAO
# alias ciao="source $HOME/app/ciao-4.7/bin/ciao.bash"

# GILDAS
export GAG_ROOT_DIR=$HOME/app/gildas-exe-apr16a
export GAG_EXEC_SYSTEM=x86_64-arch-gfortran
source $GAG_ROOT_DIR/etc/bash_profile

# KARMA
export KARMABASE=/usr/local/karma
export PATH=$PATH:$KARMABASE/bin

# IDL
# source /usr/local/itt/idl/bin/idl_setup.bash
# export IDL_DIR=/usr/local/exelis/idl
export PUB_DIR=$HOME/lib/pub
export IDL_LIB_DIR=$HOME/lib/idl
export IDL_START_DIR=$HOME/coding/idl
export IDL_STARTUP=$PUB_DIR/xrayidl/xraysysv.pro
export ZDEF=$PUB_DIR/xrayidl/def
export ZAUX=$PUB_DIR/xrayidl/aux
export EXPLIB=$PUB_DIR/xrayidl/experimental
export IDL_PATH='<IDL_DEFAULT>'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/astrolib/pro'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/coyote'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/idl-coyote/retired_coyote_library'
export IDL_PATH=$IDL_PATH:+'$IDL_LIB_DIR/motley'
# export IDL_PATH=$IDL_PATH:+'$PUB_DIR/idladd/idlastronlib/pro'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/idladd/rosatidl'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/atomdb_idl_2.00'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/tara'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/ae'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/pan'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/xrayidl'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/ljtastro'
export IDL_PATH=$IDL_PATH:+'$PUB_DIR/Zhiyuanprocedure'
