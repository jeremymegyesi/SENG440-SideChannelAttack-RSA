# SENG440-SideChannelAttack-RSA
UVic SENG440 Project: Side Channel Attacks with RSA Encryption

## Project Description:
The goal of this project is to gain experience using software optimization and other techniques involved with embedded systems.
The selected project topic is Side Channel Attacks (SCA) paired with RSA encryption.
The project will involve developing C code on an ARM machine to perform RSA encryption while being robust to computation-time SCA by using a randomized computation time.

## Execution steps for ARM machine
1. Login/connect to UGLS server: accessible at https://labs.engr.uvic.ca/guacamole/#/ or using `ssh ugls.ece.uvic.ca`
2. Connect to SENG440 server with `ssh seng440.ece.uvic.ca`
3. Copy C file to `/tmp/` directory and compile .exe file by running `arm-linux-gcc -static -o example.exe example.c`
4. Copy executable (.exe) file to Arm machine using `lftp user3@arm` (password: q6coHjd7P) -> `put -O /sdcard/home/user3/ /tmp/<path to .exe>` -> wait for upload -> `exit`
5. Connect to Arm machine: `telnet arm` -> enter credentials for user (ex. user3)
6. Enable execution of file: `chmod +x example.exe`
7. Run executable on Arm machine: `./example.exe`
