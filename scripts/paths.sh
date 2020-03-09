#!/bin/bash

# Frequently used (to avoid repetition)
SANDBOX_C4C="/qad/sbox/004/user/c4c/"
SANDBOX_C4C_2="/qad/sbox/005/user/c4c/"
SANDBOX_JJX="/qad/sbox/004/user/jjx/"
SANDBOX_FDC="/qad/sbox/006/user/fdc/"
SANDBOX_A7P="/qad/local/sandbox/user/a7p/"
SANDBOX_LEP="/qad/sbox/004/user/lep/"
PC40="/dr01/qadapps/systest/"

# List of paths
unset -v n p g
#n=() # names
#p=() # paths
#g=() # groups
n+=('local 1');p+=(${SANDBOX_C4C}'01/*/');g+=('Local envs')
n+=('local 2');p+=(${SANDBOX_C4C}'02/*/');g+=('')
n+=('local 3');p+=(${SANDBOX_C4C_2}'03/*/');g+=('')
n+=('local 4');p+=(${SANDBOX_C4C_2}'04/*/');g+=('')
n+=('local');p+=(${PC40});g+=('PC4.0')
n+=('cats req1');p+=('/qad/sandbox/user/011/08/eamreq/');g+=('CATS - SC')
n+=('cats req2');p+=('/qad/sandbox/user/011/02/eamreq/');g+=('')
n+=('req aux');p+=('/qad/sandbox/user/011/03/*/');g+=('')
n+=('cats pur');p+=('/qad/sandbox/user/011/04/purchasing/');g+=('')
n+=('cats prodOrd');p+=('/qad/sbox/010/user/013/01/prod-order/');g+=('CATS - Mfg')
n+=('cats inventory');p+=('/qad/sandbox/user/011/06/inventory/');g+=('')
n+=('cats legacy');p+=('/qad/sbox/010/user/013/06/erp-trunk');g+=('')
n+=('req');p+=('/qad/local/sandbox/team/eamreq/');g+=('Publics')
n+=('prodord16');p+=('/qad/local/sandbox/team/prod-order');g+=('')
n+=('prodord17');p+=('/qad/local/sandbox/team/prodord2017/');g+=('')
n+=('inventory');p+=('/qad/local/sandbox/team/inventory/');g+=('')
n+=('local');p+=(${SANDBOX_C4C});g+=('Sandboxes')
n+=('jordi');p+=(${SANDBOX_JJX});g+=('')
n+=('nando');p+=(${SANDBOX_FDC});g+=('')
n+=('anand');p+=(${SANDBOX_A7P});g+=('')
n+=('lluís');p+=(${SANDBOX_LEP});g+=('')
n+=('local');p+=('/qad/local/sandbox/backups/c4c/');g+=('Backups')
n+=('cats old');p+=('/qad/local/sandbox/backups/devel/02/');g+=('')
n+=('cats 2');p+=('/qad/local/sandbox/backups/devel/vm01102.qad.com');g+=('')
n+=('cats 8');p+=('/qad/local/sandbox/backups/devel/vm01108.qad.com');g+=('')
n+=('public');p+=('/qad/local/sandbox/backups/devel/coli21.qad.com');g+=('')
n+=('workspace');p+=(${SANDBOX_C4C}'.eclipse/workspaces/');g+=('Other')
n+=('bamboo req');p+=('/qad/local/sandbox/user/dev/bamboo-agent-home-for-testcomplete/xml-data/build-dir/QRA-CATSREQ-RTS');g+=('')
n+=('bamboo inv');p+=('/qad/local/sandbox/user/dev/bamboo-agent-home-for-testcomplete/xml-data/build-dir/QRA-CATSINV-RTS');g+=('')
n+=('eam checkout');p+=('/qad/sandbox/team/eam-source/eamtrunk');g+=('')
n+=('90 days');p+=('/qad/local/90day_backups');g+=('')

# List of modifiers
unset -v mn mp mg
#mn=() # modifier names
#mp=() # modifier paths
#mg=() # modifier groups
mn+=('logs');mp+=('build/logs/');mg+=('Modifiers')
mn+=('catalina');mp+=('servers/tomcat-webui/logs/');mg+=('')
mn+=('config');mp+=('build/config/');mg+=('')
mn+=('properties');mp+=('servers/tomcat-webui/webapps/qad-central/WEB-INF/config/');mg+=('')
mn+=('plugins');mp+=('servers/tomcat/webapps/qadhome/packages/plugins');mg+=('')

# Colours and formats
white_bg=$(tput setab 7)
black_fg=$(tput setaf 0)
normal=$(tput sgr0)

# Print paths
for ((i = 0; i < ${#p[@]}; i++))
do
	if [[ "${g[i]}" != "" ]] ; then
		printf "%s  %-15s%s\n" "${black_fg}${white_bg}" "${g[i]}" "${normal}"
	fi
        printf "[ %2d ] %-15s %s\n" "$((i+1))" "${n[i]}" "${p[i]}"
done
echo
for ((i = 0; i < ${#mp[@]}; i++))
do
        if [[ "${mg[i]}" != "" ]] ; then
		printf "%s  %-15s%s\n" "${black_fg}${white_bg}" "${mg[i]}" "${normal}"
        fi
        printf "[ %-10s ] %s\n" "${mn[i]}" "${mp[i]}"
done

# Get input
echo ""
echo "Select option..."
read option mod

# Check input and go to path
re='^[0-9]+$'
if [[ $option =~ $re ]] && [[ $option -le ${#p[@]} ]] ; then
	path=${p[option-1]}
	for ((i = 0; i < ${#mn[@]}; i++))
	do
		if [ "$mod" == ${mn[i]} ] ; then
			path=$path${mp[i]}
		fi
	done
	echo "Changing dir to $path"
	cd $path
fi
