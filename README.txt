################
# HOW TO BUILD #
################

1. pip3 install podman-compose --user
   Installs podman-compose on the host machine

2. git clone --recurse-submodules git@github.com:TheCoinTosser/FaceMorphingApp.git
   PS: This requires the github SSH public key in the host machine.
   PS 2: On Windows this command might fail to download the submodules (Bug: https://stackoverflow.com/a/52788404/1369016)
	 In that case, just go inside the FaceMorphingApp directory and clone the submodule manually (git clone git@github.com:TheCoinTosser/Face-Morphing.git)

3. podman machine start

4. podman image build -t face_morphing_image .

5. podman-compose up
