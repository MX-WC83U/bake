installation() {
  apt update && apt upgrade -y &&
  apt install neofetch curl git nano micro build-essential libssl-dev pkg-config cmake -y
}

rust() {
  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y
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
