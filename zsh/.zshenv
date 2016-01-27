# Path
export PATH=$PATH:$HOME/bin

# Go
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Ruby gem
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin

# Astronomy software
# Heasoft
export HEADAS=/usr/local/heasoft-6.17/x86_64-unknown-linux-gnu-libc2.22
alias heainit=". $HEADAS/headas-init.sh"

# XMM SAS
# alias sasinit=". /usr/local/SAS/xmmsas_20141104_1833/setsas.sh"

# CALDB
# export CALDB=$HOME/app/caldb
# export CALDBCONFIG=$CALDB/software/tools/caldb.config
# export CALDBALIAS=$CALDB/software/tools/alias_config.fits

# CIAO
# alias ciao="source $HOME/app/ciao-4.7/bin/ciao.bash"

# GILDAS
export GAG_ROOT_DIR=$HOME/app/gildas-exe-dec15a
export GAG_EXEC_SYSTEM=x86_64-arch-gfortran
source $GAG_ROOT_DIR/etc/bash_profile

# KARMA
source /usr/local/karma/.karmarc

# IDL
#source /usr/local/itt/idl/bin/idl_setup.bash
#export IDL_DIR=/usr/local/exelis/idl
export PUBDIR=$HOME/lib/pub
#export IDL_STARTUP=$PUBDIR/xrayidl/xraysysv.pro
#export ZDEF=$PUBDIR/xrayidl/def
#export ZAUX=$PUBDIR/xrayidl/aux
#export EXPLIB=$PUBDIR/xrayidl/experimental
export IDL_PATH='<IDL_DEFAULT>'
export IDL_PATH=$IDL_PATH:+'$PUBDIR/idladd/idlastronlib/pro'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/idladd/rosatidl'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/atomdb_idl_2.00'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/tara'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/ae'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/pan'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/xrayidl'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/ljtastro'
#export IDL_PATH=$IDL_PATH:+'$PUBDIR/Zhiyuanprocedure'
