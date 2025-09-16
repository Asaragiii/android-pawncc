#!/bin/bash

PAWNCC_URL="https://github.com/Asaragiii/android-pawncc/releases/download/pawn/pawncc"
LIBPAWNC_URL="https://github.com/Asaragiii/android-pawncc/releases/download/pawn/libpawnc.so"
PAWNDISASM_URL="https://github.com/Asaragiii/android-pawncc/releases/download/pawn/pawndisasm"

BIN_DIR="$PREFIX/bin"
LIB_DIR="$PREFIX/lib"

download_with_progress() {
  local url=$1
  local output=$2

  echo "Downloading $output..."

  curl -# -L $url -o $output

  if [ $? -ne 0 ]; then
    echo "Failed to download $output"
    exit 1
  fi
}

download_with_progress $PAWNCC_URL "pawncc"
download_with_progress $LIBPAWNC_URL "libpawnc.so"
download_with_progress $PAWNDISASM_URL "pawndisasm"

echo "Moving pawncc to $BIN_DIR..."
mv pawncc $BIN_DIR
chmod +x $BIN_DIR/pawncc

echo "Moving libpawnc.so to $LIB_DIR..."
mv libpawnc.so $LIB_DIR

echo "Moving pawndisasm to $BIN_DIR..."
mv pawndisasm $BIN_DIR
chmod +x $BIN_DIR/pawndisasm

echo "Setup completed successfully!"
