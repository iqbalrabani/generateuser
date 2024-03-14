#!/bin/bash

filename=Tekkom-D.csv

# Check if root
if [[ $(id -u) -ne 0 ]]; then
  echo "You must run with sudo."
  exit 13
fi

row=0

while IFS="," read -r nim nama angkatan progstudi matkul kelas
do
  username="user${nim}";

  echo "NIM: ${nim} | Full Name: ${nama}";

  # Create user
  echo "Creating user..."
  useradd -m $username -s $(which bash);
  # Create default password
  echo "Applying default password to ${username}...";
  passwd $username << EOF
ayojoinicn
ayojoinicn
EOF

  ((row++));
done < <(tail -n +2 ${filename})
