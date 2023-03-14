sys() {
  sudo apt update && sudo apt upgrade -y &&
  sudo apt install neofetch pip curl git nano micro build-essential libssl-dev pkg-config cmake -y &&
  echo -e "\n alias md='neofetch memory disk' \n alias ns='neofetch --stdout' \n alias crr='cargo run --release' \n alias cbr='cargo build --release' " >> ~/.bashrc &&
  source ~/.bashrc &&
  sudo bash -c "echo 'kernel.hostname = engn' >> /etc/sysctl.conf"
}

pkg() {
  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y &&
  source "$HOME/.cargo/env" &&
  curl -fsSL https://get.docker.com -o get-docker.sh &&
  sh get-docker.sh
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

run_or_exit sys
run_or_exit pkg
