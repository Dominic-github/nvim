#!/bin/bash

# Color

# Reset
export Color_Off="\033[0m"       # Text Reset

# Regular Colors
export Black="\033[0;30m"        # Black
export Red="\033[0;31m"          # Red
export Green="\033[0;32m"        # Green
export Yellow="\033[0;33m"       # Yellow
export Blue="\033[0;34m"         # Blue
export Purple="\033[0;35m"       # Purple
export Cyan="\033[0;36m"         # Cyan
export White="\033[0;37m"        # White

# Bold
export BBlack="\033[1;30m"       # Black
export BRed="\033[1;31m"         # Red
export BGreen="\033[1;32m"       # Green
export BYellow="\033[1;33m"      # Yellow
export BBlue="\033[1;34m"        # Blue
export BPurple="\033[1;35m"      # Purple
export BCyan="\033[1;36m"        # Cyan
export BWhite="\033[1;37m"       # White

# Underline
export UBlack="\033[4;30m"       # Black
export URed="\033[4;31m"         # Red
export UGreen="\033[4;32m"       # Green
export UYellow="\033[4;33m"      # Yellow
export UBlue="\033[4;34m"        # Blue
export UPurple="\033[4;35m"      # Purple
export UCyan="\033[4;36m"        # Cyan
export UWhite="\033[4;37m"       # White

# Background
export On_Black="\033[40m"       # Black
export On_Red="\033[41m"         # Red
export On_Green="\033[42m"       # Green
export On_Yellow="\033[43m"      # Yellow
export On_Blue="\033[44m"        # Blue
export On_Purple="\033[45m"      # Purple
export On_Cyan="\033[46m"        # Cyan
export On_White="\033[47m"       # White

# High Intensty
export IBlack="\033[0;90m"       # Black
export IRed="\033[0;91m"         # Red
export IGreen="\033[0;92m"       # Green
export IYellow="\033[0;93m"      # Yellow
export IBlue="\033[0;94m"        # Blue
export IPurple="\033[0;95m"      # Purple
export ICyan="\033[0;96m"        # Cyan
export IWhite="\033[0;97m"       # White

# Bold High Intensty
export BIBlack="\033[1;90m"      # Black
export BIRed="\033[1;91m"        # Red
export BIGreen="\033[1;92m"      # Green
export BIYellow="\033[1;93m"     # Yellow
export BIBlue="\033[1;94m"       # Blue
export BIPurple="\033[1;95m"     # Purple
export BICyan="\033[1;96m"       # Cyan
export BIWhite="\033[1;97m"      # White

# High Intensty backgrounds
export On_IBlack="\033[0;100m"   # Black
export On_IRed="\033[0;101m"     # Red
export On_IGreen="\033[0;102m"   # Green
export On_IYellow="\033[0;103m"  # Yellow
export On_IBlue="\033[0;104m"    # Blue
export On_IPurple="\033[10;95m"  # Purple
export On_ICyan="\033[0;106m"    # Cyan
export On_IWhite="\033[0;107m"   # White

# =============================================================

declare NV_REMOTE="https://github.com/Frey1a/nvim.git" 

declare BASEDIR=$HOME

declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1


# =============================================================



# =============================================================



# $1 is text, "" if you dont want show text
# $2 is time delay , default is 5s
# using ex: SETTIMEOUT "abc" 2s
# using ex: SETTIMEOUT "" 2s
# using ex: SETTIMEOUT "asdasd" 

function SETTIMEOUT(){

	DefaultTime=5s

	if ! [ -z $2 ] ;then
		DefaultTime=$2
	fi
    
	if ! [ -z "$1" ] ;then
		msg "$1"
	fi
	timeout $DefaultTime bash <<EOT
	sleep 10
EOT
}




function msg() {

  local text="$1"
  local div_width="80"
  echo -e ${BPurple}$(printf "%${div_width}s\n" ' ' | tr ' ' -) ${Color_Off}
  echo -e ${BYellow}"[!] $(printf "%s\n" "$text")" ${Color_Off}
}



function main(){
	parse_arguments "$@"

	print_logo

	detect_platform

	check_neovim_min_version

	ConfigContainer

	installPlug

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
	      echo -e ${BRed}"[!] Failed to install. OS $OS is not currently supported.\n" ${Color_Off}
      exit 1
      ;;
  esac
}

	
function installPlug(){
	#!!!!!!!!! IMPORTANT !!!!!!!
	
echo -e ${BBlue} "

      	 Install Vim-plug          

" ${Color_Off}

SETTIMEOUT "" 1s
if  [ $(which nvim) ]  ;then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

	###########################################################
	
echo -e ${BBlue}"

      	 Install Dependence        

" ${Color_Off}

SETTIMEOUT "" 1s

	########## NODE JS ##########
echo -e ${BBlue}"\n[*] Installing NodeJs ... \n" ${Color_Off}
if ! [ $(which node) ] ; then 
	$RECOMMEND_INSTALL nodejs
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] NodeJs is successfully Installed.\n" ${Color_Off}

fi


	
	########## NPM ##########
echo -e ${BBlue}"\n[*] Installing Npm ... \n" ${Color_Off}
if ! [ $(which npm) ] ; then 
	$RECOMMEND_INSTALL npm
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Npm is successfully Installed.\n" ${Color_Off}

fi

	
	########## Yarn ##########
echo -e ${BBlue}"\n[*] Installing Yarn ... \n" ${Color_Off}
if ! [ $(which yarn) ] ; then 
	$RECOMMEND_INSTALL yarn
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Yarn is successfully Installed.\n" ${Color_Off}

fi

	
	########## CCLS ##########

echo -e ${BBlue}"\n[*] Installing Ccls ... \n" ${Color_Off}
if ! [ $(which ccls) ] ; then 
	$RECOMMEND_INSTALL ccls
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Ccls is successfully Installed.\n" ${Color_Off}

fi



	########## BAT ##########

echo -e ${BBlue}"\n[*] Installing Bat ... \n" ${Color_Off}
if ! [ $(which bat) ] ; then 
	$RECOMMEND_INSTALL bat
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Bat is successfully Installed.\n" ${Color_Off}

fi

	
	
	########## LAZYGIT ##########

echo -e ${BBlue}"\n[*] Installing LazyGit ... \n" ${Color_Off}
if ! [ $(which lazygit) ] ; then 
	$RECOMMEND_INSTALL lazygit
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] LazyGit is successfully Installed.\n" ${Color_Off}

fi


	
	########## CTAGS ##########

echo -e ${BBlue}"\n[*] Installing Ctags ... \n" ${Color_Off}
if ! [ $(which ctags) ] ; then 
	$RECOMMEND_INSTALL ctags
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Ctags is successfully Installed.\n" ${Color_Off}

fi

	
	########## RIPGREP ##########

echo -e ${BBlue}"\n[*] Installing Ripgrep ... \n" ${Color_Off}
if ! [ $(which rg) ] ; then 
	$RECOMMEND_INSTALL ripgrep
else
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Ripgrep is successfully Installed.\n" ${Color_Off}

fi


}

function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.7") | cquit | else | quit | endif'
  
  if ! command -v nvim &>/dev/null; then
	  echo -e ${BYellow}"[!] Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL neovim" ${Color_Off}
	exit 1

  	# exit with an error if min_version not found
  	if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    	echo -e  ${BYellow}"[!]: My Config requires at least Neovim v0.7 or higher" ${Color_Off}
   	 	exit 1
  	fi

  fi

}

function confirm() {

  local question="$1"
  while true; do
    msg "$question"
	SETTIMEOUT "Please read carefully before answering. You have 5 seconds"
    read -p "[y]es or [N]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
         echo -e ${BYellow}"Please answer [y]es or [n]o.\n" ${Color_Off}

        ;;
    esac
  done

  echo $answer
}



function ConfigContainer(){
	if [ "$ARGS_INSTALL_DEPENDENCIES" -eq 1 ]; then
    	if [ "$INTERACTIVE_MODE" -eq 1 ]; then
      		if confirm "Would you like to REMOVE current nvim config file"; then
				removeCurentNeovim
				cloneNvim
			else
				echo -e  ${BBlue}"[*] We will to change name nvim = nvim(old-config) on $HOME/.config " ${Color_Off}
				moveNameFile
				cloneNvim
      		fi
		fi
  	fi
}

function removeCache(){
		rm -rf $HOME/.config/coc
		rm -rf $HOME/.local/share/nvim
		rm -rf $HOME/.cache/nvim
}

function removeCurentNeovim(){
	if test  -d  $HOME/.config/nvim;then
		echo -e ${BBlue}"[*] Removing old nvim config files.\n"

		rm -rf $HOME/.config/nvim
		removeCache

		if test ! -d $HOME/.config/nvim;then
			SETTIMEOUT "" 1s
			echo -e ${BGreen}"[*] Removing is successfully.\n" ${Color_Off}
		else
			SETTIMEOUT "" 1s
			echo -e ${BRed}"[!] Failed to Removing.\n" ${Color_Off}
			exit 1
		fi
	fi
}

function moveNameFile(){

	if test -d $HOME/config/nvim;then
		echo -e ${BBlue}"[*] Move nvim => nvim(old-config)...\n"


	 	mv $HOME/.config/nvim $HOME/.config/"nvim(old-config)"

		if [ -d $HOME/.config/"nvim(old-config)" ];then
			SETTIMEOUT "" 1s
			echo -e ${BGreen}"[*] Moving is successfully.\n" ${Color_Off}
 		else
			SETTIMEOUT "" 1s
			echo -e ${BRed}"[!] Failed to Moving.\n" ${Color_Off}
			exit 1
		fi
	fi
}

function cloneNvim(){

	if test ! -d $HOME/.config/nvim;then

		echo -e ${BBlue}"[*] Cloning nvim ... .\n"

		git clone $NV_REMOTE $HOME/.config/nvim

		if test -d $HOME/.config/nvim;then
			SETTIMEOUT "" 1s
			echo -e ${BGreen}"[*] Cloning is successfully.\n" ${Color_Off}
		else
			SETTIMEOUT "" 1s
			echo -e ${BRed}"[!] Failed to clone repository. Installation failed.\n" ${Color_Off}
			exit 1
		fi
	fi
}



function print_warning(){

	echo -e ${BPurple}"
	$(cat <<'EOF'
	  

██╗██╗██╗  ░██╗░░░░░░░██╗░█████╗░██████╗░███╗░░██╗██╗███╗░░██╗░██████╗░  ██╗██╗██╗
██║██║██║  ░██║░░██╗░░██║██╔══██╗██╔══██╗████╗░██║██║████╗░██║██╔════╝░  ██║██║██║
██║██║██║  ░╚██╗████╗██╔╝███████║██████╔╝██╔██╗██║██║██╔██╗██║██║░░██╗░  ██║██║██║
╚═╝╚═╝╚═╝  ░░████╔═████║░██╔══██║██╔══██╗██║╚████║██║██║╚████║██║░░╚██╗  ╚═╝╚═╝╚═╝
██╗██╗██╗  ░░╚██╔╝░╚██╔╝░██║░░██║██║░░██║██║░╚███║██║██║░╚███║╚██████╔╝  ██╗██╗██╗
╚═╝╚═╝╚═╝  ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░╚══╝░╚═════╝░  ╚═╝╚═╝╚═╝


EOF

)" ${Color_Off}

}


function print_logo() {



echo -e ${BPurple}"
	$(cat <<'EOF'


    ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
    ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
    ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
    ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
    ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
    ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝


# author: Frey1a
# github: https://github.com/Frey1a


EOF

)" ${Color_Off}

SETTIMEOUT "" 2s

}

function print_enjoy(){

echo -e ${Purple}"
	$(cat <<'EOF'

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

)" ${Color_Off}


}


# Run main function
main "$@"


