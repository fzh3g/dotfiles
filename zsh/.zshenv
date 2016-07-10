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

# CASA
export PATH=$PATH:$HOME/app/casa/bin

# Miriad
alias miriadinit="source /usr/local/miriad/miriad_cvs/miriad_start.sh"

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
