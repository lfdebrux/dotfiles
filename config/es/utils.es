# TODO: How can we make these more expressive?

# the in command runs commands in a different directory
fn-in = $&noreturn @ dir body {
  let (oldpwd = `{pwd}) {
    cd $dir && unwind-protect $body {cd $oldpwd}
  }
}

# apply applies body to each line of stdin
fn-apply = $&noreturn @ body {
  catch @ e value {
    if {!~ $e break} {
      throw $e $value
    }
    result $value
  } {
    let (result = <=true)
      forever {
        let (read = <=%read)
          if {~ $read ()} {
            throw break $result
          } {
            result = <={$body $read}
          }
      }
  }
}

# filter applies test to each line of stdin
# and filters out lines which don't pass
fn-filter = $&noreturn @ test {
  catch @ e {
    if {!~ $e break} {
      throw $e
    }
    result true
  } {
    forever {
      let (read = <=%read)
        if {~ $read ()} {
          throw break
        } {
          if {$test $read} {
            echo $read
          }
        }
    }
  }
}
