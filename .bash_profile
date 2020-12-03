if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

export PATH="/usr/local/erlang/bin:$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:/Users/sbeam/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

export PATH="$HOME/.cargo/bin:$PATH"
