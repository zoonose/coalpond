# app
_cpa="~/coalpond/target/release/coal-qq-client"
# keypair
_cpk="~/.config/solana/ec1ipse.json"
# server
_cps="coalpool.xyz"
# ----------

set -e  #hmm

_cpa="$(echo "echo $_cpa" | bash)"
_cpk="$(echo "echo $_cpk" | bash)"

[ "$1" = "edit" ] && printf "## th editoo0or" && nano "${BASH_SOURCE[0]}" && printf "\n" && exit

# whomi
printf "$(date)\n"
printf '%b\n' "\033[1;37mhello,\033[0;00m my name is ""${BASH_SOURCE[0]##*/}"""
printf '%b\n' "CoalPooLaunch! 0.0.000.0"

#wat
[[ "$_cpa" =~ ([^/]*$) ]] && printf "for $($_cpa -V)\n"
printf '%b\n' "Cores  : $(nproc)"

if [ -f "$_cpk" ]; then
  if [[ "$_cpk" =~ ([^/]+\.json$) ]]; then
    printf '%b\n' "Keypair: ${BASH_REMATCH[1]}"
    printf '%b\n' "Address: $(solana address --keypair $_cpk)"
  else
    printf '%b\n' "Keypair not .json? $_cpk"
    exit
  fi
else
  printf '%b\n' "Keypair not found $_cpk"
  exit
fi
printf '%b\n' "Server : $_cps"


if [ "$1" = "mine" ]; then bash -c "$_cpa --keypair $_cpk --url $_cps mine --cores $(nproc) " && printf "\n"
elif [ "$1" = "rewards" ]; then  bash -c "$_cpa --keypair $_cpk --url $_cps rewards" && printf "\n"
elif [ "$1" = "claim" ]; then  bash -c "$_cpa --keypair $_cpk --url $_cps claim" && printf "\n"
elif [ "$1" = "balance" ]; then  bash -c "$_cpa --keypair $_cpk --url $_cps balance" && printf "\n"
elif [ "$1" = "help" ]; then bash -c "$_cpa --help" && printf "solana address: $(solana address --keypair $_cpk)\n\n"
elif [ "$1" = "-" ]; then shift && printf '%b\n' "\e[1m## Bypass Mode ##\e[0m" && printf "\$ $_cpa $@\n" && bash -c "$_cpa $@"
elif [ "$#" -gt 1 ]; then printf '%b\n' "arg! too many args! only one arg please. or \e[1;36m-\e[0m as first arg for passthrough mode.\n" && exit
else printf "%b\n" "\noptions: \e[1;40mmine\e[0m, \e[1;40mrewards\e[0m, \e[1;40mclaim\e[0m, \e[1;40mbalance\e[0m.\n         \e[1;40m-\e[0m for bypass mode\n         \e[1;40medit\e[0m to edit this script.\n"
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
 #   alias cx="bash ~/cx.sh "$@""
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