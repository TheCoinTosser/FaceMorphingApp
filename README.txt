# HOW TO BUILD

All commands below are to be entered inside this FaceMorphingApp folder.

1. pip3 install podman-compose --user
   Installs podman-compose on the host machine

2. git clone git@github.com:TheCoinTosser/Face-Morphing.git
   This requires the github SSH public key in the host machine.

3. podman image build -t face_morphing_image .

4. podman-compose up
