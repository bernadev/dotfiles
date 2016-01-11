Although the .vimrc file contains all the configuration to work just replacing
the original file (In case that already exists), there is some steps to follow
manually such as plugins installation and so on, those steps are explained below:

Installing Pathogen:

  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Installing Solarized Theme:

  cd ~/.vim/bundle
  git clone git://github.com/altercation/vim-colors-solarized.git

Installing CoffeScript Support:

  git clone https://github.com/kchmck/vim-coffee-script.git \
  ~/.vim/bundle/vim-coffee-script/
