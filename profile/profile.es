
# Profile for es-shell
#

fn alias-set alias cmd {
  fn-^$alias = $cmd
}

# main

# parse alias file
@ {
  for ( args = `` \n { sed -e 's/=/ /' $* } ) {
    alias-set `{ echo $args }
  }
} ./alias
