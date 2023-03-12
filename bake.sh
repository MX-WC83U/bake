installation() {
  apt update && apt upgrade -y &&
  apt install neofetch pip curl git nano micro build-essential libssl-dev pkg-config cmake -y &&
  echo -e "\n alias md='neofetch memory disk' \n alias ns='neofetch --stdout' \n alias crr='cargo run --release' \n alias cbr='cargo build --release' " >> ~/.bashrc &&
  source ~/.bashrc 
}

rust() {
  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y &&
  source "$HOME/.cargo/env"
}

repo() {
  git clone https://github.com/broomshed/musical-umbrella &&
  cd musical-umbrella &&
  cargo run --release 
}

run_or_exit() {
  command=$1
  cd $TMP_INSTALL_DIR &&
  echo "[*] Running" $command
  $command
  return_value=$?
  if [ $return_value -ne 0 ]; then
    echo "[!] Failed to run" $command
    exit 1
  fi
  echo "[*] Completed running" $command
}

run_or_exit installation 
run_or_exit rust
run_or_exit repo
