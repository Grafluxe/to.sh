#!/bin/bash

#Author: Leandro Silva (http://grafluxe.com)
#Copyright: 2017 Leandro Silva
#License: MIT

dir_here=$(dirname $0);
dir_install=~/.to;

fi_main_here=$dir_here/to.sh;
fi_completion_here=$dir_here/to-completion.sh;
fi_help_here=$dir_here/to-help.txt;
fi_license_here=$dir_here/LICENSE.md;

fi_main=$dir_install/to.sh;
fi_completion=$dir_install/to-completion.sh;
fi_help=$dir_install/to-help.txt;
fi_license=$dir_install/LICENSE.md;
fi_routes=$dir_install/to-routes.txt;

fi_profile=~/.profile;

has_src=$(cat $fi_profile | grep "$fi_main" | wc -l);

if [ $has_src = "0" ]; then
  mkdir -p $dir_install;

  cp $fi_main_here $fi_main;
  cp $fi_completion_here $fi_completion;
  cp $fi_help_here $fi_help;
  cp $fi_license_here $fi_license;

  touch $fi_routes;

  echo "if [ -f \"$fi_main\" ]; then\n  source \"$fi_main\";\n  source \"$fi_completion\";\nfi\n" >> $fi_profile;

  msg="Installed Successfully\n";
  msg+="-\n";
  msg+="To begin, refresh your profile (run 'source ~/.profile'), the run the 'to --help' command.";
else
  msg+="Already Installed\n";
  msg+="-\n";
  msg+="For help, run the 'to --help' command.";
fi;

echo "$msg";
