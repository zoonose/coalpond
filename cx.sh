# launch thing `version`
_cplv="CoalPooLaunch! 0.0.0.0.2"
# app
_cpa="~/coalpond/target/release/coal-qq-client"
# keypair
_cpk="~/.config/solana/coalpool.json"
# server
_cps="coalpool.xyz"
# server wallet (for tx fees)
_cpsw="mineaReAn75LSXbZmW2XsBEmPMhsVGGh3onpBBJjwSD"
# ----------

set -e  #hmm

# expand tilde
_cpa="$(echo "echo $_cpa" | bash)"
_cpk="$(echo "echo $_cpk" | bash)"

[ "$1" = "edit" ] && printf "## th editoo0or" && nano "${BASH_SOURCE[0]}" && printf "\n" && exit

printf '%b\n' "\033[0;32m$(date)\033[0;0m"
printf '%b\n' "\033[1;37mhello,\033[0;37m my name is ${BASH_SOURCE[0]##*/}\033[0;0m"
printf '%b\n' "\033[0;37m$_cplv"
[[ "$_cpa" =~ ([^/]*$) ]] && printf "for $($_cpa -V)\n"

printf '%b\n' "\033[1;37mCores      \033[0;37m: $(nproc)"
if [ -f "$_cpk" ]; then
  if [[ "$_cpk" =~ ([^/]+\.json$) ]]; then
    printf '%b\n' "\033[1;37mKeypair    \033[0;37m: ${BASH_REMATCH[1]}"
    printf '%b\n' "   address : $(solana address --keypair $_cpk)"
  else
    printf '%b\n' "\033[1;31mKeypair not .json? \033[0;37m$_cpk\033[0;0m"
    exit
  fi
else
  printf '%b\n' "\033[1;31mKeypair not found \033[0;37m$_cpk\033[0;0m"
  exit
fi

printf '%b\n' "\033[1;37mServer     \033[0;37m: $_cps"
printf '%b\n' "   address : $_cpsw"
printf        "   balance : "
_cpswb="$(solana balance $_cpsw)"
printf "$_cpswb : "
if [[ "$_cpswb" =~ (^[0-9]+)\.([0-9])([0-9]) ]]; then
   if [[ "${BASH_REMATCH[1]}" -eq 0 ]] && [[ "${BASH_REMATCH[2]}" -lt 2 ]]; then
      if [[ "${BASH_REMATCH[2]}" -ge 1 ]]; then
         printf '%b\n' "\033[1;33mLOW \033[0;37m(\033[0;36mó\033[0;37m_\033[0;36mò\033[0;37m)\033[0;0m"
      elif [[ "${BASH_REMATCH[3]}" -eq 0 ]]; then
         printf '%b\n' "\033[1;31mNope. \033[0;37m(\033[0;36mṬ\033[0;37m︵\033[0;36mṬ\033[0;37m)\033[0;0m"
         printf '%b\n' "\033[1;31mServer needs more SOL for transaction fees.\033[0;0m\n"
         exit
      fi
   else
      printf '%b\n' "\033[1;32mOk.  \033[0;37m(\033[0;36m^\033[0;37m_\033[0;36m^\033[0;37m)\033[0;0m"
   fi
fi

printf '%b\n' "\033[2;37m---------------------------------------\033[0;0m"

if [ "$1" = "mine" ]; then
   bash -c "$_cpa --keypair $_cpk --url $_cps mine --cores $(nproc)"
   printf "\n"
   elif [ "$1" = "rewards" ] || [ "$1" = "claim" ] || [ "$1" = "balance" ]; then
      bash -c "$_cpa --keypair $_cpk --url $_cps $1"
      printf "\n"
   elif [ "$1" = "help" ]; then
      bash -c "$_cpa --help"
      printf "\n"

   elif [ "$1" = "-" ]; then
      shift
      printf '%b\n' "\033[1;36mBypass Mode\033[1;37m:\033[1;34m$DIRSTACK\033[1;37m\$\033[0;0m $_cpa $@"
      bash -c "$_cpa $@"

   elif [ "$#" -gt 1 ]; then
      printf '%b\n' "\033[1;31mArg! too many args! \033[0;37monly one arg please. or \033[1;36m-\033[0;37m as first arg for bypass mode.\n\033[0;0m"
      exit

   else printf '%b\n' "\033[1;37mOptions: \033[1;40mmine\033[0;37m, \033[1;40mrewards\033[0;37m, \033[1;40mclaim\033[0;37m, \033[1;40mbalance\033[0;37m.\n         \033[1;40m-\033[0;37m for bypass mode.\n         \033[1;40medit\033[0;37m to edit this script.\033[0;0m\n"
fi

#  wat :
#  coal pool loader thing
#  (unl33t ; nominally functional ; ymmv)
#
#  update the stuff at the top to match your stuff
#  the actual coalpool client is at https://github.com/coal-digital/coalpool
#  idk what will happen if you actually run the one at this repo
#
#   add the following to .bash_aliases (or .bashrc) (without the #) for ultimate convenience
#
 #   alias cx="bash ~/cx.sh $@"
#
#   or whatever you save it as, as it ends with .sh
#   and also doesn't have any spaces because I have
#   not figured out how to make that work [sad trombone])
#
#   then run
#
 #   cx <command>
#
#   and rejoice (optional)
#
#  the end