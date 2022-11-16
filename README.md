https://www.atlassian.com/git/tutorials/dotfiles

EXISTING SYSTEM WITH DOTFILES ALREADY CLONED:

1. alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
2. echo ".cfg" >> .gitignore
3. git clone --bare git@github.com:Michalidis/dotfiles.git $HOME/.cfg
4. alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
5. config checkout
6. config config --local status.showUntrackedFiles no
7. config submodule init
8. config submodule update

Before performing git actions, call

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

Then instead of calling "git add" and other git commands, call "config add". That should do the trick

NEW SYSTEM WITHOUT DOTFILES CLONED:

Install ZSH:

1. Install git
2. Install curl
3. Install zsh (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
4. Install oh-my-zsh (./.oh-my-zsh/tools/install.sh)

Install i3:

1. sudo apt-get install i3
2. Log out
3. Choose i3 as WM
4. sudo apt-get install -y i3status py3status conky
5. mv extras/py3status.conf /etc/

Install NVIM:

1. git clone https://github.com/neovim/neovim.git
2. cd neovim
3. sudo apt-get install libtool libtool-bin autoconf automake cmake make libncurses5-dev g++ pkg-config gettext
4. make CMAKE_BUILD_TYPE=Release
5. sudo make install
6. choose and install a font from "fonts/" folder
7. sudo apt install silversearcher-ag
8. run nvim and run "forceUpdateAll", usually accessed by <leader>c menu
9. sudo npm install -g neovim
10. pip3 install --upgrade pynvim
11. fix issues when running ":checkhealth" from nvim
12. sudo apt-get install ranger

Install Plug:

1. Create file "plug.vim" in .local/share/nvim/site/autoload/ directory
2. Paste the contents of https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim to the file and save
3. Open nvim
4. Call command ":PlugInstall"
5. curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt-get install -y nodejs
6. sudo apt-get install npm python3-pip
7. pip3 install --user neovim

Install TMUX:

1. sudo apt-get install tmux

Install luarocks: (is this needed?)

1. sudo apt install build-essential libreadline-dev unzip
2. curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
3. tar -zxf lua-5.3.5.tar.gz
4. cd lua-5.3.5
5. make linux test
6. wget https://luarocks.org/releases/luarocks-3.8.0.tar.gz
7. tar zxpf luarocks-3.8.0.tar.gz
8. cd luarocks-3.8.0
9. ./configure --with-lua-include=/usr/local/include

Install flameshot (screenshots):

1. sudo apt-get install flameshot

Install docker:

1. sudo apt update
2. sudo apt install apt-transport-https ca-certificates curl software-properties-common
3. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
4. echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
5. sudo apt update
6. apt-cache policy docker-ce
7. sudo apt-get install docker-ce
8. sudo systemctl status docker

Execute docker without sudo:

1. sudo usermod -aG docker ${USER}
2. PERFORM A SYSTEM REBOOT

Install docker-compose:

1. mkdir -p ~/.docker/cli-plugins/
2. curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
3. mv docker-compose ~/.docker/cli-plugins/docker-compose
4. chmod +x ~/.docker/cli-plugins/docker-compose
5. sudo ln -s ~/.docker/cli-plugins/docker-compose /usr/bin/docker-compose

Install Angular language service:

1. npm -g install typescript
2. npm -g install @angular/language-service
3. npm -g install @angular/cli

Install Typescript language server:

1. npm -g install typescript-language-server typescript

Install TSLint:

1. Open nvim
2. execute :CocInstall coc-tslint

Install RipGrep (used by <leader>r mapping):

1. sudo apt-get install ripgrep
