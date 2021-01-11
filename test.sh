pkg install -y proot wget
mkdir ~/ubuntu_directory
cd ~/ubuntu_directory

wget https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh
sed -i 's/disco/focal/g' ubuntu.sh
bash ubuntu.sh

sed -i 's/#command+=" -b \/data/command+=" -b \/data/g' start-ubuntu.sh

#termux-setup-storage
#mkdir ~/storage/shared/Paper/
#ln -s ~/storage/shared/Paper/ ~/Paper

mkdir ~/Paper/
cd ~/Paper/

wget https://papermc.io/api/v2/projects/paper/versions/1.16.4/builds/403/downloads/paper-1.16.4-403.jar
wget https://raw.githubusercontent.com/7man7LMYT/glowing-pancake/main/eula.txt

cd ~

cat >.profile <<EOM
apt update
apt install -y default-jre

echo
echo Paper has been installed?
#echo You can access the config file using your phones file manager, there should be a folder called 'Geyser'.
echo You can now start Paper at any time using
echo ./ubuntu_directory/start-ubuntu.sh
echo cd Paper
echo java -Xmx1024M -Xms1024M paper-1.16.4-403.jar -jar

rm -rf .profile

exit
EOM

./ubuntu_directory/start-ubuntu.sh
