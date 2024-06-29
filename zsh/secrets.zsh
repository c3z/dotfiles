# Read keys from file and assign to array
echo "Loading secrets..."

keys=()
while IFS= read -r line; do
  keys+=("$line")
done < ~/.zsh-envtoload

# Print the keys array
echo "${keys[@]}"

for key in "${keys[@]}"; do
  if sec ls | grep -q "$key"; then
    export "$key"=$(sec get "$key")
    echo "$key set successfully."
  else
    echo "$key not found."
  fi
done
