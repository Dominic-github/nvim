#!/bin/bash
declare NV_REMOTE="https://github.com/Frey1a/nvim.git" 

declare BASEDIR = $HOME

declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1


function usage() {
  echo "Usage: install.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                               Print this help message"
  echo "    -m, --map                                Show some key nees know "
  echo "    -y, --yes                                Disable confirmation prompts (answer yes to all questions)"
  echo "    --[no]-install-dependencies              Whether to automatically install external dependencies (will prompt by default)"
}

function mapping(){
	echo"waiting"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -y | --yes)
        INTERACTIVE_MODE=0
        ;;
      --install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=1
        ;;
      --no-install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=0
        ;;
      -h | --help)
        usage
        exit 0
        ;;
	  -m | --map)
		mapping
        exit 0
        ;;

    esac
    shift
  done
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}


function main(){
	parse_arguments "$@"

	print_logo

	detect_platform

	installPlug

	Config

	print_enjoy
}


function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S --noconfirm "
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

	
function installPlug(){
	#!!!!!!!!! IMPORTANT !!!!!!!
	
echo "

      	 Install Vim-plug          

"
if test -f $(which nvim);then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
elif test -f $(which vi);then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

	###########################################################
	
echo "

      	 Install Dependence        

"
	########## NODE JS ##########
echo "
=============================
|     	    nodejs           |
==============================
"
	if test ! $(which node); then 
		$RECOMMEND_INSTALL nodejs
	else
		printf "nodejs is successfully installed"
	fi
	
	########## NPM ##########
echo "
=============================
|     	     npm             |
==============================
"
	if test ! $(which npm); then 
		$RECOMMEND_INSTALL npm
	else
		printf "npm is successfully installed"
	fi
	
echo "
=============================
|     	     yarn            |
==============================
"
	if test ! $(which yarn); then 
		$RECOMMEND_INSTALL yarn 
	else
		printf "yarn is successfully installed"
	fi
	
	########## CCLS ##########
echo "
==============================
|     	     ccls             |
===============================
"
	if test ! $(which ccls); then 
		$RECOMMEND_INSTALL ccls
	else
		printf "ccls is successfully installed"
	fi
	
	########## BAT ##########
echo "
==============================
|     	      bat             |
===============================
"
	if test ! $(which bat); then 
		$RECOMMEND_INSTALL bat
	else
		printf "bat is successfully installed"
	fi
	
	
	########## LAZYGIT ##########
echo "
==============================
|     	    lazygit           |
===============================
"
	if test ! $(which lazygit); then 
		$RECOMMEND_INSTALL lazygit
	else
		printf "lazygit is successfully installed"
	fi
	
	
	########## CTAGS ##########
echo "
==============================
|     	     ctags            |
===============================
"
	if test ! $(which ctags); then 
		$RECOMMEND_INSTALL ctags
	else
		printf "ctags is successfully installed"
	fi
	
	########## RIPGREP ##########
echo "
==============================
|     	    ripgrep           |
===============================
"
	if test ! $(which ripgrep); then 
		$RECOMMEND_INSTALL ripgrep
	else
		printf "ripgrep is successfully installed"
	fi
}

function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [N]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        echo "Please answer [y]es or [n]o."
        ;;
    esac
  done

  echo $answer
}


function Config(){
	if [ "$ARGS_INSTALL_DEPENDENCIES" -eq 1 ]; then
    	if [ "$INTERACTIVE_MODE" -eq 1 ]; then
      		if confirm "Would you like to REMOVE current nvim config file"; then
				removeCurentNeovim
				cloneNvim
			else
				echo "We will to change name nvim = nvim(old-config) on $HOME/.config "
				moveNameFile
				cloneNvim
      		fi
		fi
  	fi
}

function removeCurentNeovim(){
	if test  -d  $HOME/.config/nvim;then
		msg "Removing old nvim config files"

		rm -rf $HOME/.config/nvim
		rm -rf $HOME/.local/share/nvim
		rm -rf $HOME/.cache/nvim

		if test ! -d $HOME/.config/nvim;then
			echo "Removing is successfully"
		else
			echo "Failed to Removing."
			exit 1
		fi
	fi


}

function moveNameFile(){

	if test -d $HOME/config/nvim;then
		msg "Move nvim => nvim(old-config)"
	 	mv $HOME/.config/nvim $HOME/.config/"nvim(old-config)"

		if test -d $HOME/.config/"nvim(old-config)";then
			echo "Moving is successfully"
 		else
			echo "Failed to Moving."
			exit 1
		fi
	fi
}

function cloneNvim(){

	if test ! -d $HOME/.config/nvim;then
		msg "Cloning nvim configuration"
		git clone $NV_REMOTE $HOME/.config/nvim

		if test -d $HOME/.config/nvim;then
			echo "Cloning is successfully"
		else
			echo "Failed to clone repository. Installation failed."
			exit 1
		fi
	fi
}




function print_logo() {
  cat <<'EOF'


    ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
    ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
    ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
    ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
    ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
    ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

# author: Frey1a
# github: https://github.com/Frey1a
EOF
}

function print_enjoy(){
	  cat <<'EOF'

		███████╗███╗░░██╗░░░░░██╗░█████╗░██╗░░░██╗
		██╔════╝████╗░██║░░░░░██║██╔══██╗╚██╗░██╔╝
		█████╗░░██╔██╗██║░░░░░██║██║░░██║░╚████╔╝░
		██╔══╝░░██║╚████║██╗░░██║██║░░██║░░╚██╔╝░░
		███████╗██║░╚███║╚█████╔╝╚█████╔╝░░░██║░░░
		╚══════╝╚═╝░░╚══╝░╚════╝░░╚════╝░░░░╚═╝░░░

# author: Frey1a
# github: https://github.com/Frey1a

# Start

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                   !
!  Launch nvim and :PlugInstall to install plugins  !
!                                                   !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
EOF
}


# Run main function
main "$@"


