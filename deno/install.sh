if test ! $(which deno)
then
  echo "no deno found, installing"
  curl -fsSL https://deno.land/x/install/install.sh | sh
else
  echo "deno found"
fi

