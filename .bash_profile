source ~/.profile
export PATH=/usr/local/opt/openssl/bin:/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/mysql/bin:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
export EDITOR='subl -w'

# export CXX=/usr/local/Cellar/gcc@6/6.4.0/bin/g++-6
export OPENSSL_ROOT="$(brew --prefix openssl)"
export OPENSSL_INCLUDE_DIR="$(brew --prefix openssl)/include"
export OPENSSL_LIB_DIR="$(brew --prefix openssl)/lib"

pips() {
    echo $'\n'$1 >> requirements.txt; pip install $1
}

pip-save () {
    for pkg in $@;
    do
        pip install "$pkg" && {
            name="$(pip show "$pkg" | grep Name: | awk '{print $2}')";
            version="$(pip show "$pkg" | grep Version: | awk '{print $2}')";
            echo "${name}==${version}" >> requirements.txt
        };
    done
}

# virtualenv
export WORKON_HOME=~/virtualenvs
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

stty erase '^?'

export PATH="$HOME/.cargo/bin:$PATH"
