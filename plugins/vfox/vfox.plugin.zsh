# export $VFOX_HOME=~/.version-fox;

# if [[ -z "$__VFOX_PID" ]]; then
#   vfox_uid=$(vfox env -s zsh -j | jq -r '.uid');
#   echo $vfox_uid;
#   export __VFOX_SHELL=$'zsh';
#   # export PATH=$'C:\Users\ISummers\.version-fox\temp\1733115600-15844\python;C:\Users\ISummers\.version-fox\temp\1733115600-15844\python\Scripts;C:\Users\ISummers\.local\bin;C:\Users\ISummers\.cache\repos\romkatv\zsh-bench;C:\Users\ISummers\bin;C:\Users\ISummers\AppData\Local\Programs\Git\mingw64\bin;C:\Users\ISummers\AppData\Local\Programs\Git\usr\local\bin;C:\Users\ISummers\AppData\Local\Programs\Git\usr\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0;C:\WINDOWS\System32\OpenSSH;C:\Program Files (x86)\Sennheiser\SenncomSDK;C:\Program Files (x86)\Citrix\HDX\bin;C:\Program Files\Citrix\HDX\bin;C:\Program Files\dotnet;C:\Program Files\skaffold;C:\Program Files\nodejs;C:\Users\ISummers\.version-fox\cache\python\current\Scripts;C:\Users\ISummers\.version-fox\cache\python\current;C:\Users\ISummers\AppData\Local\Programs\Python\Python312;C:\Users\ISummers\AppData\Local\Programs\Python\Python312\Scripts;C:\users\isummers\.local\bin;C:\Users\ISummers\AppData\Roaming\Python\Python312\Scripts;C:\Users\ISummers\AppData\Local\Microsoft\WindowsApps;C:\Users\ISummers\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\ISummers\AppData\Local\Programs\Microsoft VS Code Insiders\bin;C:\Users\ISummers\Appdata\Local\Programs\Git\cmd;C:\Users\ISummers\AppData\Local\Microsoft\WinGet\Packages\Microsoft.devtunnel_Microsoft.Winget.Source_8wekyb3d8bbwe;C:\Users\ISummers\AppData\Local\Microsoft\WinGet\Packages\junegunn.fzf_Microsoft.Winget.Source_8wekyb3d8bbwe;C:\Users\ISummers\AppData\Local\Programs\Git\usr\bin\vendor_perl;C:\Users\ISummers\AppData\Local\Programs\Git\usr\bin\core_perl';
#   # export __VFOX_CURTMPPATH=$'C:/Users\ISummers\.version-fox\temp\1733115600-15844';

#   export __VFOX_PID=$$;

  # _vfox_hook() {
  #   trap -- '' SIGINT;
  #   # use vfox env -s zsh -j to get the json output and find the paths that need to be updated


  #   trap - SIGINT;
  # }
  # typeset -ag precmd_functions;
  # if [[ -z "${precmd_functions[(r)_vfox_hook]+1}" ]]; then
  #   precmd_functions=( _vfox_hook ${precmd_functions[@]} )
  # fi
  # typeset -ag chpwd_functions;
  # if [[ -z "${chpwd_functions[(r)_vfox_hook]+1}" ]]; then
  #   chpwd_functions=( _vfox_hook ${chpwd_functions[@]} )
  # fi

  # trap 'vfox env --cleanup' EXIT
# fi
